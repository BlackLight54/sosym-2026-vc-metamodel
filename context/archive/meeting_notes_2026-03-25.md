# Meeting notes 2026-03-25

Raw notes from advisor meetings. Parsed into actionable TODO items — see TODO.md "Advisor feedback (2026-03-25)" section.

## Imre notes 2026-03-25 1800

- [ ] Claim property layer should be renamed, make claude give suggestions based on prior work
- [ ] Van-e az ÁRF szektori elvű bukokon kívül más formális vagy felformázott specifikációk? Ami a mi szempontunkból tényleges Governance Framework, és ami constrainteket állít föl nekünk, olyan jellegű constricteket, amikről itt beszélünk.
- [ ] arf fókuszú gap analyis. 5.3.4
- [ ] Error detection: concrete model + error edge, DSE: dierse grapg generation

## Oszkár notes 2026-03-25 1830

- [ ] A gap paragrafban "scattered across" helyett, összegyűjtöttük és formalizáltuk. Így nem kell cite.
- [ ] Utána ki kell modondani, hogy a kényszereknek van egymásra hatása, emerging behaviour-t, intercation-t mutatnak, és hogy ezt a hatást nem lehet megjósolni, ha nem nézzük őket együtt.
- [ ] ... meg kell indokolnunk azt, hogy miért nem lehet a meglévő eszközöket ezekre a területekre használni. Tehát mik azok a challenge-ok, amik meg kellett, hogy ilyenkor a novámód elérjük a fejlesztését?

Igen, mi az, kell, hogy

That necessitates the development of novel modeling and verification tools.

Én szeretnék méhaport.

És akkor erre egy ötletem nekem az, hogy hierarchikus követelményrendszer, mint az autótervezés helyett itt egymással versengő, Peer követelményeink vannak. A stakeholderek nem működnek feltétlenül együtt. Ha az összes stakeholdernek a céljai nem feltétlenül hozhatók egy koherens egésszé össze.

- [ ] A Noor cikke kapcsolódik, de feltehetjük, Nour ECMAFA cikke.

Hogyha valaki bírálja mind a kettőt, hogy van közös izé, akkor az tudja, hogy mi a kettő között a különbség...

És ennyi.

És ezt randomizáltan töltsük fel. Csak a bírálat idejére.

- [ ] Motivation helyett overview, és az overview kezdődik 3.1 Motivation-nel.
- [ ] **Utana Functional Overview**
Itt kell nekünk egy olyan doboz, mint amit Imrével csináltunk a BPM-es cikkben, aminek a bemenete „Valami, ami Design Specification vagy Partial Design vagy valami ilyesmi."

Igen, tehát egy speck. Igen. Ezen kívül még egy Constraint halmaz.

És ez a Martin doboz. Igen. A kényszerhalmaz az lehet a Martin doboz része.

Jó, igen. Lehet, hogy egy percben esik ki, igen. Azért szeretem.

Igen, az is lehet, hogy ez egyben van.
Kimenetek: OK, NOT_OK: errors, generate: graph.

-[ ] 3.3 How to use on this example.
Tehát egy tervezőmérnök mit csinál? Milyen lépések sorozatával unja meg a fejlesztést, vagy készít el egy konkrét dolgot ezzel a – ilyen fajta dobozokkal? Ühüm.

Ha errort lát ki kell javíteni etc.

- [ ] EVAL: Kell mérés, legalább két oldal evaluation.

- [ ] Összehasonlítani valami baseline fejleszétsi esközzel, ami miatt refienry.

- [ ] fix séma (ezt lehet exportálni workflowba):
  - Research questions, How does the run time of the validation scale with the model size? Honnét lesz a nagyobb modellünk? Egy második példányt készítünk, ötöt, és elmondjuk, hogy miért valid az, hogy ezt megcsináljuk, ez miért hasonlít egy nagyobb modellhez.
  - Selected domains: legalább 2, de inkább 3 vagy öt modell, amit leírunk, pusztán leíró jelleggel.
  - Measurement setup: hogyan végezzük a méréseket, milyen eszközökkel, milyen környezetben, milyen metrikákat használunk. Noor cikkéből lehet inspirálódni.
  - Measurement results:
  2 diagramm, mit mértünk, oldal tetején figure*-ba
  - analysis of the results: mit jelent ez, miért fontos, milyen következtetéseket lehet levonni belőle. Megválaszoljuk a research question-öket, és megmondjuk, hogy ezek alapján mi a tanulság.
  - Threats to validity: milyen fenyegetések vannak a validitásra, hogyan próbáltuk ezeket csökkenteni, és milyen hatással lehetnek ezek a fenyegetések a következtetéseinkre. internal validity, external valoidity, construct validity, conclusion validity. Hányféleképpen ronthattuk volna el.
- [ ] Tehát a VCDM alapú model coverage annyi értelme van, hogy megmondja, hogy meddig jutottunk el a munkában, de különben mérési értelme nincs. Tehát ez nem mérés, hanem azt modnja meg mennyire tudtuk formalizálni a kényszereket. Ez inkább sima eval mint mérés, vagy elaboration-soundness/completeness.
- [ ] blinding claim-eket újra kell futtatni az eredeti absztrakt alapján.
- [ ] Oszkárnak teaser figure-be Refineray-t SW-ből rakni, ilyen place holder make
- [ ] Teams csopi
