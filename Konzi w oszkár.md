figure-ök hiányoznak

shallow a cikk, nincs kimondott állítás, érdemes lenne formalizálni hogy miért jó amit csinálok

CORE-DISC: Amit én csinálok, az lefedi ezt a 4 tulajdonságot.

4-es fejezetben meg máshol is szigorú kijelentéseket kell tenni.

- Consistency: Ha valamit az eszköz invalidnak mond, az biztosan invalid. Ha az eszköz mond valamit, akkor az jó. Ha generálunk valamit, akkor az nem sért kényszert. Helyesség-teljesség érvelése kell. Miért refinery-t használunk, miért nem egy rajzolóprogramot: a felhasználó számára miért jó, hogy refinery-n keresztül modellezi le az egészet, nem pedig egy rajzolóprogrmaon. Azért, ha mi helyesen formalizáljuk, akkor hibás az hibás, rá tudunk mutatni egy design flaw-ra"Detecting desing flaws in early phase of development, even in partial models", tényleg megsértünk valamit ami fontos. A szájukba kell rágni az eredményt, nem értik az emberek a gráfmodellezést. Ahhoz hogy ezt kimondjuk, a BG-ba kellhet matek.
- Predication proof solution (bool encoding)
- Azt akarjuk megragadni refinery-ben hogy, hogy ha valami attributumot- design goal-t - rárakunk az elején, akkor a refinery megmutatja nekünk hogyha ezt megsértjük, valamint tud nekünk generálni parciális modellből olyat ami biztosan nem sérti meg.
- Mi az ereje.
- erős állítások
- akár úgy hogy doboz, bele Soudness: garancia 1 garancia 2
randomnál és LLMnél jobb garancia kell; Jobbak vagyunk mintha Erdős-Rényi-vel generáltunk egy random gráfot.

- Realistic? Not discussed here
- Diverse? Why do we need diverse solutions? Say something
- Scalable? Why do we need to generate and evaluate big graphs? If somebody wants a bigger model, then we can make a reasonable

Akkor kell refinery stílusban kód, meg le kell matematikailag jól írni azokat a predikátumokat, amik vagy a design gólokat, vagy a cross layer constrainteket valahogy megfogalmazzák.

Le kell írni prominensen a példát. A példához tartozó kényszereket matematikailag precízen le kell írni. Ami lehet Refinery is? Ne használnék bevezetés nélkül a refinery fogalmakat, és ne használnék bevezetés nélkül olyan matematikai fogalmakat, amiket használunk; tehát még relációkat sem.

A reviewereknek a Refinery kínai. Teszeni fog nekik, de el kell nekik rendesen mondani.

Ami hiányzik, a BG-be egy rendes refinery magyarázat. Önhordónak kell lennie a cikknek.

Oszkár a matekot meg a refinery bevezetését megírja, egy példakódot kell keresni ami illusztratív. Kell neki helyet szorítnai, kell page budget matek. Placeholdert odarakni.

6.3-ba el kell mondani a modellek jó tulajdonságait: helyesek! sound and complete.

Ábrák, példák(kódrészletek, példaábrák)

Ami most kell: draftot feltölteni, pdf-et. Csekkolni van-e benne valami etikátlan vagy CFP sértő dolog. Lilát kivenni. Van-e benne olyasmi amit az AI betett és baj lehet belőle? Hazudni nem lehet. Forrásokat meg kell nézni. Ha azt mondom hogy valami igaz, vagy nem igaz, pedig az ellenkezője a valóság, az gáz. Ne legyen komoly tárgyi tévedés. Ne legyen benne nagyon vad dolog állítva. Legegyszerűbb ha kikomenteljük.

Also, what about range proofs versus predicate proofs? That is for future work when range proofs are finally implemented in some verifiable credential carrying formats. Or if they are already in a non-creds V2, then we should evaluate them.
