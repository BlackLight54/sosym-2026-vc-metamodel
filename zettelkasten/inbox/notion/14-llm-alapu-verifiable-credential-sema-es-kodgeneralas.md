---
source: notion
notion_id: 33d0766f-0685-80cf-8794-cf3fd94e1ea6
notion_url: https://app.notion.com/p/33d0766f068580cf8794cf3fd94e1ea6
title: LLM-alapú Verifiable Credential séma és kódgenerálás
pulled: 2026-06-17
---

<properties>
{"Kiírás éve":"2026","Notes":"","Research Track":"","Student":"","Target Venue":"","Topic":"LLM-alapú Verifiable Credential séma és kódgenerálás","url":"https://app.notion.com/p/33d0766f068580cf8794cf3fd94e1ea6"}
</properties>

Az önrendelkezésű identitás (Self-Sovereign Identity, SSI) egy olyan-magának az elmúlt években egyre nagyobb teret hódító-identitás- és adatkezelési paradigma, amelyben a felhasználók maguk kezelik digitális azonosítóikat és az azokhoz kapcsolódó minden potenciálisan személyes adatot. E megközelítés elméleti és technológiai alapját az ellenőrizhető tanúsítványok (Verifiable Credentials, VC) és a decentralizált azonosítók (Decentralized Identifiers, DID) adják: a VC-k digitálisan aláírt állításokat tartalmaznak egy alanyról, amelyeket az alany maga tárol és oszt meg a számára szükséges mértékben. A téma aktualitását az EU eIDAS 2.0 rendelete adja, amely 2026 végére kötelezi a tagállamokat VC-khez hasonló adaststrukturák tárolására képes, “digitális identitás tárcák” biztosítására az állampolgárok számára, ezzel kontinentális léptékben megnyitva az utat az SSI paradigmáját megvalósító szoftveralkalmazások előtt.
A tanszéken folyó kutatások egyik iránya a VC ökoszisztémák szisztematikus tervezése.[Design Space Exploration of Verifiable Credential Schemas using Partial Graph Modeling](https://www.inf.u-szeged.hu/~cscs/cscs2024/pdf/cscs2024.pdf#page=36) Egy ilyen rendszer tervezésének és fejlesztésének részét képezi az adatmodell – a VC sémák – kialakítása, valamint a kibocsátó és ellenőrző komponensek implementálása. Ezek a feladatok jelenleg manuálisak, és jelentős szakértelmet igényelnek a JSON-LD, a kriptográfiai aláírások és a kapcsolódó szabványok terén.
A nagy nyelvi modellek (LLM) programkód-generálásban mutatott képességei nyomán felmerül a kérdés, hogy mennyire alkalmazhatók ezek az eszközök a VC fejlesztés területén. Konkrétan vizsgálható, hogy természetes nyelvű use case leírásokból generálhatók-e érvényes VC sémák (JSON-LD/JSON Schema formátumban), illetve hogy a séma alapján előállíthatók-e működőképes kódrészletek a kibocsátási és ellenőrzési logikához (pl. TypeScript, Python).
Ezen komponensek generálásában érdemes lehet az LLM-ek alkalmazása mellet formális modellező eszközök használata a hallucináció és az LLM-ek egyéb hibáinak elkerülése mellett, mint például a gráfadatbázisok, ontológiáknak való megfelelés ellenőrzése, vagy akár a parciális gráfmodellezés ([Refinery](https://refinery.tools/))
A téma felderítő, kísérletező jellegű, és több irányba is továbbvihető. Megvizsgálható a promptok és a kontextus (pl. szabványdokumentációk, példasémák) hatása a generált kimenetek minőségére, a különböző LLM-ek összehasonlítása, illetve a generált kódok automatizált tesztelésének lehetősége.
Az Önálló laboratórium pontos célját a hallgatóval közösen, az ő érdeklődése mentén alakítjuk ki. A félév elején a hallgató megismerkedik a VC szabványokkal és a meglévő fejlesztői eszközökkel, e közben körvonalazódik, hogy melyik részproblémára fókuszál a félév hátralévő részében.
- VC séma szerkesztő, összekötő, olvasó, vizualizáló eszköz – vizuális editor JSON-LD/JSON Schema alapú sémák létrehozásához
- VC sémacsoportok generálása LLM-ek segítségével
- vc kiadási/ellenőrzési kódgenerálás/snippet generálás
- **Tamarin prover példagyűjtemény SSI protokollokhoz** – oktatási célú modellek és elemzések
- **VC protokollok összehasonlító elemzése ProVerif-fel** – egyszerű protokollok modellezése és tulajdonságaik vizsgálata
-
	- **VC korrelációs kockázat elemző eszköz prototípusa** – adott VC séma és használati minta alapján linkability becslés
- **Titkossági tulajdonságok kvalitatív összehasonlító keretrendszere** – különböző SSI megoldások rangsorolása
