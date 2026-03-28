# Refinery Examples

Complete `.problem` files from Refinery tutorials. Each demonstrates different language constructs.

## 1. File System (introductory)

**Demonstrates:** classes, containment, `container`, `opposite`, inheritance, scope

Source: <https://refinery.tools/learn/tutorials/file-system/>

```refinery
class Filesystem {
    contains Dir[1] root
}

abstract class FSObject {
    container Dir parent opposite contents
}

class Dir extends FSObject {
    contains FSObject[] contents opposite parent
}

class File extends FSObject.

class Link extends FSObject {
    FSObject[1] target
}

scope node = 10..20.
```

## 2. Project Planning (intermediate)

**Demonstrates:** error predicates, `default !`, `?exists`, transitive closure `+`, `count{}`, `+=` scope, `opposite` with bidirectional references

Source: <https://refinery.tools/learn/tutorials/project/>

```refinery
class Project {
    contains Task[] tasks
    contains Team[] teams
}

class Task {
    contains Effort[1..*] effort
    Task[] dependsOn
}

class Team {
    contains Person[1..*] people
}

class Person {
    Effort[0..*] effort opposite person
}

class Effort {
    Person[1] person opposite effort
}

% --- Error predicates ---

error repeatedEffort(Effort effort1, Effort effort2) <->
    effort1 != effort2,
    person(effort1, person),
    person(effort2, person),
    Task::effort(task, effort1),
    Task::effort(task, effort2).

error cyclicDependency(Task task) <->
    dependsOn+(task, task).

% --- Helper predicates ---

pred worksOn(Person person, Task task) <->
    Person::effort(person, work),
    Task::effort(task, work).

error taskSharing(Team g1, Team g2) <->
    g1 != g2,
    people(g1, p1),
    people(g2, p2),
    worksOn(p1, t),
    worksOn(p2, t).

pred communicates(Team g1, Team g2) <->
    people(g1, p1),
    people(g2, p2),
    worksOn(p1, t1),
    worksOn(p2, t2),
    dependsOn(t2, t1).

% --- Partial model ---

Project(proj).
!exists(Project::new).
tasks(proj, task1).
tasks(proj, task2).
scope Task += 0.
default !dependsOn(*, *).
dependsOn(task2, task1).
teams(proj, team1).
teams(proj, team2).
people(team1, alice).
people(team1, bob).
!people(team1, Person::new).
Person(carol).
?exists(team2).
!exists(Team::new).

scope node = 30..50, Person += 10, Task += 5, Project = 1, Team = 3.
```

## 3. DLT / Hyperledger Fabric (advanced)

**Demonstrates:** propagation rules with `may`/`must`, shadow predicates, negative propagation, complex metamodels. This example uses the same propagation rule patterns as the VC metamodel.

Source: <https://refinery.tools/learn/tutorials/dlt/>

```refinery
abstract class FabricNetwork {
    contains Organization[1..*] organizations
    contains Channel[1..*] channels
}

class KafkaFabricNetwork extends FabricNetwork.
class RaftFabricNetwork extends FabricNetwork.

class Organization {
    contains Host[1..*] hosts
}

class Host {
    contains Node[1..4] nodes
}

abstract class Node.

class OrderingNode extends Node {
    Channel[1..*] orders opposite orderedBy
}

class EndorsingNode extends Node {
    ChaincodeInstance[1..*] endorses opposite endorsedBy
}

class Channel {
    contains ChaincodeInstance[1..*] chaincodes
    OrderingNode[0..*] orderedBy opposite orders
}

class ChaincodeInstance {
    EndorsingNode[2..*] endorsedBy opposite endorses
}

% --- Error predicates ---

error channelInKafkaNetworkWithoutOrderer(c) <->
    channels(n, c),
    KafkaFabricNetwork(n),
    !orderedBy(c, _).

% --- Auxiliary predicates ---

pred ordererOrganization(o) <->
    Organization(o),
    hosts(o, h),
    nodes(h, n),
    OrderingNode(n).

pred peerHelper(Channel c, Host h, Node n) <->
    orders(n, c), nodes(h, n);
    chaincodes(c, i), endorses(n, i), nodes(h, n).

pred peer(n, c) <-> peerHelper(c, _, n).

pred participatesIn(o, c) <->
    hosts(o, h), peerHelper(c, h, _).

pred collaboratesWith(Organization o1, Organization o2) <->
    o1 != o2,
    participatesIn(o1, c),
    participatesIn(o2, c).

% --- Shadow predicates ---

shadow pred endorsesChaincode(EndorsingNode n, Channel c, ChaincodeInstance i) <->
    chaincodes(c, i), endorses(n, i).

shadow pred endorsesMultipleChaincodes(EndorsingNode n, Channel c) <->
    endorsesChaincode(n, c, i1),
    endorsesChaincode(n, c, i2),
    i1 != i2.

% --- Propagation rules ---

propagation rule collaboratesWithSymmetric(Organization o1, Organization o2) <->
    collaboratesWith(o1, o2)
    ==> collaboratesWith(o2, o1).

propagation rule notCollaboratesWithSymmetric(Organization o1, Organization o2) <->
    !collaboratesWith(o1, o2)
    ==> !collaboratesWith(o2, o1).

propagation rule cannotParticipateIn(Organization o1, Channel c) <->
    participatesIn(o2, c),
    !collaboratesWith(o1, o2),
    o1 != o2
    ==> !participatesIn(o1, c).

propagation rule cannotBePeerOf(Node n, Channel c) <->
    nodes(h, n), hosts(o, h), !participatesIn(o, c)
    ==> !peer(n, c).

propagation rule cannotEndorse(Node n, ChaincodeInstance i) <->
    chaincodes(c, i), !peer(n, c)
    ==> !endorses(n, i).

propagation rule cannotOrder(Node n, Channel c) <->
    !peer(n, c)
    ==> !orders(n, c).

propagation rule mustEndorse(EndorsingNode n, ChaincodeInstance i) <->
    peer(n, c),
    !endorsesMultipleChaincodes(n, c),
    chaincodes(c, i),
    may endorses(n, i)
    ==> endorses(n, i).

% --- Partial model ---

KafkaFabricNetwork(network).
!exists(KafkaFabricNetwork::new).
!exists(RaftFabricNetwork::new).
default !channels(*, *).
channels(network, Ch1).
channels(network, Ch2).
!exists(Organization::new).
Organization(OrgA).
hosts(OrgA, HA1).
Organization(OrgB).
Organization(OrgC).

scope node = 15..60,
    Node = 8..30,
    OrderingNode = 4..15,
    EndorsingNode = 4..15,
    Channel = 3..*,
    FabricNetwork = 1.
```

## Construct index

Quick lookup — which example demonstrates what:

| Construct | File System | Project | DLT |
|---|---|---|---|
| `class`, `abstract class`, `extends` | x | x | x |
| `contains`, `container`, `opposite` | x | x | x |
| Multiplicities (`[1]`, `[]`, `[1..*]`) | x | x | x |
| `pred` (derived predicate) | | x | x |
| `error` predicate | | x | x |
| `shadow pred` | | | x |
| `propagation rule` | | | x |
| `must` / `may` in guards | | | x |
| `!exists(ClassName::new)` | | x | x |
| `?exists` (unknown) | | x | |
| `default !` (closed-world) | | x | x |
| `+=` (incremental scope) | | x | |
| Transitive closure `+` | | x | |
| `count{}` | | x | |
| Disjunction `;` in predicates | | | x |
