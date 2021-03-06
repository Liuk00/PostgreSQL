﻿-- Function: unit_tests_public.qualifications(boolean)

-- DROP FUNCTION unit_tests_public.qualifications(boolean);

CREATE OR REPLACE FUNCTION unit_tests_public.qualifications(
    IN _build_dependencies boolean DEFAULT false,
    OUT _results unit_testing.unit_test_result[])
  RETURNS unit_testing.unit_test_result[] AS
$BODY$
<<me>>
DECLARE
  context               text;
  full_function_name 	  text;
  test_name		          text = '';
  error			            diagnostic.error;
BEGIN
  GET DIAGNOSTICS context = PG_CONTEXT;
  full_function_name = diagnostic.full_function_name(context);
  -- check to build dependencies
  IF _build_dependencies THEN
    PERFORM unit_testing.build_function_dependencies(diagnostic.function_name(context),'unit_tests_public.metrics',
                                                                                       'unit_tests_public.schools');
    RETURN;
  END IF;
  ------------------------------------

  test_name = 'INSERT qualifications';

  ------------------------------------

  BEGIN
    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95977000000000','1000000000','Padroneggiare gli strumenti espressivi','Padroneggiare gli strumenti espressivi ed argomentativi indispensabili per gestire l’interazione comunicativa verbale in vari contesti','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95978000000000','1000000000','Leggere, comprendere ed interpretare','Leggere, comprendere ed interpretare testi scritti di vario tipo','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95979000000000','1000000000','Produrre testi di vario tipo in relazione','Produrre testi di vario tipo in relazione ai differenti scopi comunicativi','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95980000000000','1000000000','Utilizzare una lingua straniera per','Utilizzare una lingua straniera per i principali scopi comunicativi ed operativi','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95981000000000','1000000000','Utilizzare gli strumenti fondamentali','Utilizzare gli strumenti fondamentali per una fruizione consapevole del patrimonio artistico','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95982000000000','1000000000','Utilizzare e produrre testi multimediali','Utilizzare e produrre testi multimediali','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95983000000000','1000000000','Utilizzare le tecniche e le procedure','Utilizzare le tecniche e le procedure del calcolo aritmetico ed algebrico, rappresentandole anche sotto forma grafica','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95984000000000','1000000000','Confrontare ed analizzare figure','Confrontare ed analizzare figure geometriche, individuando invarianti e relazioni.','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95985000000000','1000000000','Individuare le strategie appropriate','Individuare le strategie appropriate per la soluzione di problemi','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95986000000000','1000000000','Analizzare dati e interpretarli sviluppando','Analizzare dati e interpretarli sviluppando deduzioni e ragionamenti sugli stessi anche con l’ausilio di rappresentazioni grafiche, usando consapevolmente gli strumenti di calcolo e le potenzialità offerte da applicazioni specifiche di tipo informatico.','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95987000000000','1000000000','Osservare,descrivere ed analizzare','Osservare,descrivere ed analizzare fenomeni appartenenti alla realtà naturale e artificiale e riconoscere nelle sue varie forme i concetti di sistema e di complessità','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95988000000000','1000000000','Analizzare qualitativamente e quantitativamente','Analizzare qualitativamente e quantitativamente fenomeni legati alle trasformazioni di energia a partire dall’esperienza','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95989000000000','1000000000','Essere consapevole delle potenzialità','Essere consapevole delle potenzialità delle tecnologie rispetto al contesto culturale e sociale a cui vengono applicate','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95990000000000','1000000000','Comprendere il cambiamento e la diversità','Comprendere il cambiamento e la diversità dei tempi storici in una dimensione diacronica attraverso il confronto fra epoche e in una dimensione sincronica attraverso il confronto fra aree geografiche e culturali.','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95991000000000','1000000000','Collocare l’esperienza personale','Collocare l’esperienza personale in un sistema di regole fondato sul reciproco riconoscimento dei diritti garantiti dalla Costituzione, a tutela della persona, della collettività e dell’ambiente','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95992000000000','1000000000','Orientarsi nel tessuto produttivo','Orientarsi nel tessuto produttivo del proprio territorio.','11435000000000','Expertise');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95964000000000','1000000000','asse dei linguaggi','asse dei linguaggi','11435000000000','Axis');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95965000000000','1000000000','asse matematico','asse matematico','11435000000000','Axis');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95966000000000','1000000000','asse scientifico-tecnologico','asse scientifico-tecnologico','11435000000000','Axis');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('95967000000000','1000000000','asse storico-sociale','asse storico-sociale','11435000000000','Axis');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96019000000000','1000000000','Comprendere il messaggio contenuto in un testo orale','Comprendere il messaggio contenuto in un testo orale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96020000000000','1000000000','Cogliere le relazioni logiche tra le varie componenti di un testo orale','Cogliere le relazioni logiche tra le varie componenti di un testo orale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96021000000000','1000000000','Esporre in modo chiaro logico e coerente esperienze vissute o testi ascoltati','Esporre in modo chiaro logico e coerente esperienze vissute o testi ascoltati','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96022000000000','1000000000','Riconoscere differenti registri comunicativi di un testo orale','Riconoscere differenti registri comunicativi di un testo orale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96023000000000','1000000000','Affrontare molteplici situazioni comunicative scambiando informazioni, idee per','Affrontare molteplici situazioni comunicative scambiando informazioni, idee per esprimere anche il proprio punto di vista','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96024000000000','1000000000','Individuare il punto di vista dell’altro in contesti formali ed informali','Individuare il punto di vista dell’altro in contesti formali ed informali','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96025000000000','1000000000','Padroneggiare le strutture della lingua presenti nei testi','Padroneggiare le strutture della lingua presenti nei testi','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96026000000000','1000000000','Applicare strategie diverse di lettura','Applicare strategie diverse di lettura','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96027000000000','1000000000','Individuare natura, funzione e principali scopi comunicativi ed espressivi di un','Individuare natura, funzione e principali scopi comunicativi ed espressivi di un testo','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96028000000000','1000000000','Cogliere i caratteri specifici di un testo letterario','Cogliere i caratteri specifici di un testo letterario','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96029000000000','1000000000','Ricercare , acquisire e selezionare informazioni generali e specifiche in funzione','Ricercare , acquisire e selezionare informazioni generali e specifiche in funzione della produzione di testi scritti di vario tipo','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96030000000000','1000000000','Prendere appunti e redigere sintesi e relazioni','Prendere appunti e redigere sintesi e relazioni','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96031000000000','1000000000','Rielaborare in forma chiara le informazioni','Rielaborare in forma chiara le informazioni','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96032000000000','1000000000','Produrre testi corretti e coerenti adeguati alle diverse situazioni comunicative','Produrre testi corretti e coerenti adeguati alle diverse situazioni comunicative','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96033000000000','1000000000','Comprendere i punti principali di messaggi e annunci semplici e chiari su argomenti','Comprendere i punti principali di messaggi e annunci semplici e chiari su argomenti di interesse personale, quotidiano, sociale o professionale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96034000000000','1000000000','Ricercare informazioni all’interno di testi di breve estensione di interesse personale,','Ricercare informazioni all’interno di testi di breve estensione di interesse personale, quotidiano, sociale o professionale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96136000000000','1000000000','Il piano euclideo: relazioni tra','Il piano euclideo: relazioni tra rette; congruenza di figure; poligoni e loro proprietà.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96035000000000','1000000000','Descrivere in maniera semplice esperienze ed eventi, relativi all’ambito personale','Descrivere in maniera semplice esperienze ed eventi, relativi all’ambito personale e sociale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96036000000000','1000000000','Utilizzare in modo adeguato le strutture grammaticali','Utilizzare in modo adeguato le strutture grammaticali','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96037000000000','1000000000','Interagire in conversazioni brevi e semplici su temi di interesse personale, quotidiano,','Interagire in conversazioni brevi e semplici su temi di interesse personale, quotidiano, sociale o professionale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96038000000000','1000000000','Scrivere brevi testi di interesse personale, quotidiano, sociale o professionale','Scrivere brevi testi di interesse personale, quotidiano, sociale o professionale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96039000000000','1000000000','Scrivere correttamente semplici testi su tematiche coerenti con i percorsi di studio','Scrivere correttamente semplici testi su tematiche coerenti con i percorsi di studio','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96040000000000','1000000000','Riflettere sui propri atteggiamenti in rapporto all’altro in contesti multiculturali','Riflettere sui propri atteggiamenti in rapporto all’altro in contesti multiculturali','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96041000000000','1000000000','Riconoscere e apprezzare le opere d’arte','Riconoscere e apprezzare le opere d’arte','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96042000000000','1000000000','Conoscere e rispettare i beni culturali e ambientali a partire dal proprio territorio','Conoscere e rispettare i beni culturali e ambientali a partire dal proprio territorio','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96043000000000','1000000000','Comprendere i prodotti della comunicazione audiovisiva','Comprendere i prodotti della comunicazione audiovisiva','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96044000000000','1000000000','Elaborare prodotti multimediali (testi, immagini, suoni , ecc.), anche con tecnologie','Elaborare prodotti multimediali (testi, immagini, suoni , ecc.), anche con tecnologie digitali','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96045000000000','1000000000','Comprendere il significato logico-operativo di numeri appartenenti ai diversi sistemi','Comprendere il significato logico-operativo di numeri appartenenti ai diversi sistemi numerici. Utilizzare le diverse notazioni e saper convertire da una all’altra (da frazioni a decimali, da frazioni apparenti ad interi, da percentuali a frazioni..);','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96046000000000','1000000000','Comprendere il significato di potenza; calcolare potenze e applicarne le proprietà.','Comprendere il significato di potenza; calcolare potenze e applicarne le proprietà.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96047000000000','1000000000','Risolvere brevi espressioni nei diversi insiemi numerici; rappresentare la soluzione','Risolvere brevi espressioni nei diversi insiemi numerici; rappresentare la soluzione di un problema con un’espressione e calcolarne il valore anche utilizzando una calcolatrice.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96048000000000','1000000000','Tradurre brevi istruzioni in sequenze simboliche (anche con tabelle); risolvere','Tradurre brevi istruzioni in sequenze simboliche (anche con tabelle); risolvere sequenze di operazioni e problemi sostituendo alle variabili letterali i valori numerici.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96049000000000','1000000000','Comprendere il significato logico-operativo di rapporto e grandezza derivata; impostare','Comprendere il significato logico-operativo di rapporto e grandezza derivata; impostare uguaglianze di rapporti per risolvere problemi di proporzionalità e percentuale; risolvere  semplici problemi diretti e inversi','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96050000000000','1000000000','Risolvere equazioni di primo grado e verificare la correttezza dei procedimenti','Risolvere equazioni di primo grado e verificare la correttezza dei procedimenti utilizzati.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96051000000000','1000000000','Rappresentare graficamente equazioni di primo grado; comprendere il concetto di','Rappresentare graficamente equazioni di primo grado; comprendere il concetto di equazione e quello di funzione','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96052000000000','1000000000','Risolvere sistemi di equazioni di primo grado seguendo istruzioni e verificarne','Risolvere sistemi di equazioni di primo grado seguendo istruzioni e verificarne la correttezza dei risultati.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96053000000000','1000000000','Riconoscere i principali enti, figure e luoghi geometrici e descriverli con linguaggio','Riconoscere i principali enti, figure e luoghi geometrici e descriverli con linguaggio naturale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96054000000000','1000000000','individuare le proprietà essenziali delle figure e riconoscerle in situazioni concrete','individuare le proprietà essenziali delle figure e riconoscerle in situazioni concrete','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96055000000000','1000000000','Disegnare figure geometriche con semplici tecniche grafiche e operative','Disegnare figure geometriche con semplici tecniche grafiche e operative','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96056000000000','1000000000','Applicare le principali formule relative alla retta e alle figure geometriche sul','Applicare le principali formule relative alla retta e alle figure geometriche sul piano cartesiano','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96057000000000','1000000000','In casi reali di facile leggibilità risolvere problemi di tipo geometrico, e ripercorrerne','In casi reali di facile leggibilità risolvere problemi di tipo geometrico, e ripercorrerne le procedure di soluzione','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96058000000000','1000000000','Comprendere i principali passaggi logici di una dimostrazione','Comprendere i principali passaggi logici di una dimostrazione','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96059000000000','1000000000','Progettare un percorso risolutivo strutturato in tappe','Progettare un percorso risolutivo strutturato in tappe','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96060000000000','1000000000','Formalizzare il percorso di soluzione di un problema attraverso modelli algebrici','Formalizzare il percorso di soluzione di un problema attraverso modelli algebrici e grafici','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96061000000000','1000000000','Convalidare i risultati conseguiti sia empiricamente, sia mediante argomentazioni','Convalidare i risultati conseguiti sia empiricamente, sia mediante argomentazioni','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96062000000000','1000000000','Tradurre dal linguaggio naturale al linguaggio algebrico e viceversa','Tradurre dal linguaggio naturale al linguaggio algebrico e viceversa','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96063000000000','1000000000','Raccogliere, organizzare e rappresentare un insieme di dati.','Raccogliere, organizzare e rappresentare un insieme di dati.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96064000000000','1000000000','Rappresentare classi di dati mediante istogrammi e diagrammi a torta.','Rappresentare classi di dati mediante istogrammi e diagrammi a torta.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96065000000000','1000000000','Leggere e interpretare tabelle e grafici in termini di corrispondenze fra elementi','Leggere e interpretare tabelle e grafici in termini di corrispondenze fra elementi di due insiemi.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96137000000000','1000000000','Circonferenza e cerchio','Circonferenza e cerchio','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96066000000000','1000000000','Riconoscere una relazione tra variabili, in termini di proporzionalità diretta o','Riconoscere una relazione tra variabili, in termini di proporzionalità diretta o inversa e formalizzarla attraverso una funzione matematica.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96067000000000','1000000000','Rappresentare sul piano cartesiano il grafico di una funzione.','Rappresentare sul piano cartesiano il grafico di una funzione.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96068000000000','1000000000','Valutare l’ordine di grandezza di un risultato.','Valutare l’ordine di grandezza di un risultato.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96069000000000','1000000000','Elaborare e gestire semplici calcoli attraverso un foglio elettronico','Elaborare e gestire semplici calcoli attraverso un foglio elettronico','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96070000000000','1000000000','Elaborare e gestire un foglio elettronico per rappresentare in forma grafica i risultati','Elaborare e gestire un foglio elettronico per rappresentare in forma grafica i risultati dei calcoli eseguiti','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96071000000000','1000000000','Raccogliere dati attraverso l’osservazione diretta dei fenomeni naturali (fisici,','Raccogliere dati attraverso l’osservazione diretta dei fenomeni naturali (fisici, chimici, biologici, geologici, ecc..) o degli oggetti artificiali o la consultazione di testi e manuali o media.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96072000000000','1000000000','Organizzare e rappresentare i dati raccolti.','Organizzare e rappresentare i dati raccolti.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96073000000000','1000000000','Individuare, con la guida del docente, una possibile interpretazione dei dati in','Individuare, con la guida del docente, una possibile interpretazione dei dati in base a semplici modelli.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96074000000000','1000000000','Presentare i risultati dell’analisi.','Presentare i risultati dell’analisi.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96075000000000','1000000000','Utilizzare classificazioni, generalizzazioni e/o schemi logici per riconoscere il','Utilizzare classificazioni, generalizzazioni e/o schemi logici per riconoscere il modello di riferimento.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96076000000000','1000000000','Riconoscere e definire i principali aspetti di un ecosistema.','Riconoscere e definire i principali aspetti di un ecosistema.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96077000000000','1000000000','Essere consapevoli del ruolo che i processi tecnologici giocano nella modifica dell’ambiente','Essere consapevoli del ruolo che i processi tecnologici giocano nella modifica dell’ambiente che ci circonda considerato come sistema.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96078000000000','1000000000','Analizzare in maniera sistemica un determinato ambiente al fine di valutarne i rischi','Analizzare in maniera sistemica un determinato ambiente al fine di valutarne i rischi per i suoi fruitori.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96079000000000','1000000000','Analizzare un oggetto o un sistema artificiale in termini di funzioni o di architettura.','Analizzare un oggetto o un sistema artificiale in termini di funzioni o di architettura.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96080000000000','1000000000','Interpretare un fenomeno naturale o un sistema artificiale dal punto di vista energetico','Interpretare un fenomeno naturale o un sistema artificiale dal punto di vista energetico distinguendo le varie trasformazioni di energia in rapporto alle leggi che le governano.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96081000000000','1000000000','Avere la consapevolezza dei possibili impatti sull’ambiente naturale dei modi di','Avere la consapevolezza dei possibili impatti sull’ambiente naturale dei modi di produzione e di utilizzazione dell’energia nell’ambito quotidiano.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96082000000000','1000000000','Riconoscere il ruolo della tecnologia nella vita quotidiana e nell’economia della','Riconoscere il ruolo della tecnologia nella vita quotidiana e nell’economia della società.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96083000000000','1000000000','Saper cogliere le interazioni tra esigenze di vita e processi tecnologici.','Saper cogliere le interazioni tra esigenze di vita e processi tecnologici.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96084000000000','1000000000','Adottare semplici progetti per la risoluzione di problemi pratici..','Adottare semplici progetti per la risoluzione di problemi pratici..','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96085000000000','1000000000','Saper spiegare il principio di funzionamento e la struttura dei principali dispositivi','Saper spiegare il principio di funzionamento e la struttura dei principali dispositivi fisici e software','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96086000000000','1000000000','Utilizzare le funzioni di base dei software più comuni per produrre testi e comunicazioni','Utilizzare le funzioni di base dei software più comuni per produrre testi e comunicazioni multimediali, calcolare e rappresentare dati, disegnare, catalogare informazioni, cercare informazioni e comunicare in rete.','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96087000000000','1000000000','Riconoscere le dimensioni del tempo e dello spazio attraverso l’osservazione di','Riconoscere le dimensioni del tempo e dello spazio attraverso l’osservazione di eventi storici e di aree geografiche','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96088000000000','1000000000','Collocare i più rilevanti eventi storici affrontati secondo le coordinate spaziotempo','Collocare i più rilevanti eventi storici affrontati secondo le coordinate spaziotempo','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96089000000000','1000000000','Identificare gli elementi maggiormente significativi per confrontare aree e periodi','Identificare gli elementi maggiormente significativi per confrontare aree e periodi diversi','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96090000000000','1000000000','Comprendere il cambiamento in relazione agli usi, alle abitudini, al vivere quotidiano','Comprendere il cambiamento in relazione agli usi, alle abitudini, al vivere quotidiano nel confronto con la propria esperienza personale','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96091000000000','1000000000','Leggere - anche in modalità multimediale - le differenti fonti letterarie, iconografiche,','Leggere - anche in modalità multimediale - le differenti fonti letterarie, iconografiche, documentarie, cartografiche ricavandone informazioni su eventi storici di diverse epoche e differenti aree geografiche','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96092000000000','1000000000','Individuare i principali mezzi e strumenti che hanno caratterizzato l’innovazione','Individuare i principali mezzi e strumenti che hanno caratterizzato l’innovazione tecnico-scientifica nel corso della storia','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96093000000000','1000000000','Comprendere le caratteristiche fondamentali dei principi e delle regole della Costituzione','Comprendere le caratteristiche fondamentali dei principi e delle regole della Costituzione italiana','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96094000000000','1000000000','Individuare le caratteristiche essenziali della norma giuridica e comprenderle a','Individuare le caratteristiche essenziali della norma giuridica e comprenderle a partire dalle proprie esperienze e dal contesto scolastico','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96138000000000','1000000000','Misura di grandezze; grandezze incommensurabili;','Misura di grandezze; grandezze incommensurabili; perimetro e area dei poligoni. Teoremi di Euclide e di Pitagora.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96095000000000','1000000000','Identificare i diversi modelli istituzionali e di organizzazione sociale e le principali','Identificare i diversi modelli istituzionali e di organizzazione sociale e le principali relazioni tra persona – famiglia – società - Stato','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96096000000000','1000000000','Riconoscere le funzioni di base dello Stato, delle Regioni e degli Enti Locali ed','Riconoscere le funzioni di base dello Stato, delle Regioni e degli Enti Locali ed essere in grado di rivolgersi, per le proprie necessità, ai principali servizi da essi erogati','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96097000000000','1000000000','Identificare il ruolo delle istituzioni europee e dei principali organismi di cooperazione','Identificare il ruolo delle istituzioni europee e dei principali organismi di cooperazione internazionale e riconoscere le opportunità offerte alla persona, alla scuola e agli ambiti territoriali di appartenenza','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96098000000000','1000000000','Adottare nella vita quotidiana comportamenti responsabili per la tutela e il rispetto','Adottare nella vita quotidiana comportamenti responsabili per la tutela e il rispetto dell’ambiente e delle risorse naturali','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96099000000000','1000000000','Riconoscere le caratteristiche principali del mercato del lavoro e le opportunità','Riconoscere le caratteristiche principali del mercato del lavoro e le opportunità lavorative offerte dal territorio','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96100000000000','1000000000','Riconoscere i principali settori in cui sono organizzate le attività economiche','Riconoscere i principali settori in cui sono organizzate le attività economiche del proprio territorio','11435000000000','Skill');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96101000000000','1000000000','Principali strutture grammaticali','Principali strutture grammaticali della lingua italiana','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96102000000000','1000000000','Elementi di base della funzioni della','Elementi di base della funzioni della lingua','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96103000000000','1000000000','Lessico fondamentale per la gestione','Lessico fondamentale per la gestione di semplici comunicazioni orali in contesti formali e informali','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96104000000000','1000000000','Contesto, scopo e destinatario della','Contesto, scopo e destinatario della comunicazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96105000000000','1000000000','Codici fondamentali della comunicazione','Codici fondamentali della comunicazione orale, verbale e non verbale','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96106000000000','1000000000','Principi di organizzazione del discorso','Principi di organizzazione del discorso descrittivo, narrativo, espositivo, argomentativo','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96107000000000','1000000000','Strutture essenziali dei testi narrativi,','Strutture essenziali dei testi narrativi, espositivi, argomentativi','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96108000000000','1000000000','Principali connettivi logici','Principali connettivi logici','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96109000000000','1000000000','Varietà lessicali in rapporto ad','Varietà lessicali in rapporto ad ambiti e contesti diversi','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96110000000000','1000000000','Tecniche di lettura analitica e sintetica','Tecniche di lettura analitica e sintetica','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96111000000000','1000000000','Tecniche di lettura espressiva','Tecniche di lettura espressiva','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96112000000000','1000000000','Denotazione e connotazione','Denotazione e connotazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96113000000000','1000000000','Principali generi letterari, con','Principali generi letterari, con particolare riferimento alla tradizione italiana','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96114000000000','1000000000','Contesto storico di riferimento di','Contesto storico di riferimento di alcuni autori e opere','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96115000000000','1000000000','Elementi strutturali di un testo','Elementi strutturali di un testo scritto coerente e coeso','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96116000000000','1000000000','Uso dei dizionari','Uso dei dizionari','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96117000000000','1000000000','Modalità e tecniche delle diverse','Modalità e tecniche delle diverse forme di produzione scritta: riassunto, lettera, relazioni, ecc.  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96118000000000','1000000000','Fasi della produzione scritta: pianificazione,stesura','Fasi della produzione scritta: pianificazione,stesura e revisione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96119000000000','1000000000','Lessico di base su argomenti di vita','Lessico di base su argomenti di vita quotidiana , sociale e professionale','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96120000000000','1000000000','Uso del dizionario bilingue','Uso del dizionario bilingue','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96121000000000','1000000000','Regole grammaticali fondamentali','Regole grammaticali fondamentali','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96122000000000','1000000000','Corretta pronuncia di un repertorio','Corretta pronuncia di un repertorio di parole e frasi memorizzate di uso comune','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96123000000000','1000000000','Semplici modalità di scrittura: messaggi','Semplici modalità di scrittura: messaggi brevi, lettera informale  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96124000000000','1000000000','Cultura e civiltà dei paesi di cui','Cultura e civiltà dei paesi di cui si studia la lingua','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96125000000000','1000000000','Elementi fondamentali per la lettura/ascolto','Elementi fondamentali per la lettura/ascolto di un’opera d’arte (pittura, architettura, plastica, fotografia, film, musica…..)','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96126000000000','1000000000','Principali forme di espressione artistica','Principali forme di espressione artistica','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96127000000000','1000000000','Principali componenti strutturali','Principali componenti strutturali ed espressive di un prodotto audiovisivo','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96128000000000','1000000000','Semplici applicazioni per la elaborazione','Semplici applicazioni per la elaborazione audio e video','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96129000000000','1000000000','Uso essenziale della comunicazione','Uso essenziale della comunicazione telematica','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96130000000000','1000000000','Gli insiemi numerici N, Z, Q, R;','Gli insiemi numerici N, Z, Q, R; rappresentazioni, operazioni, ordinamento.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96131000000000','1000000000','I sistemi di numerazione','I sistemi di numerazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96132000000000','1000000000','Espressioni algebriche; principali','Espressioni algebriche; principali operazioni.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96133000000000','1000000000','Equazioni e disequazioni di primo','Equazioni e disequazioni di primo grado.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96134000000000','1000000000','Sistemi di equazioni e disequazioni','Sistemi di equazioni e disequazioni di primo grado.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96135000000000','1000000000','Gli enti fondamentali della geometria','Gli enti fondamentali della geometria e il significato dei termini: assioma, teorema, definizione.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96139000000000','1000000000','Teorema di Talete e sue conseguenze','Teorema di Talete e sue conseguenze','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96140000000000','1000000000','Il metodo delle coordinate: il piano','Il metodo delle coordinate: il piano cartesiano.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96141000000000','1000000000','Interpretazione geometrica dei sistemi','Interpretazione geometrica dei sistemi di equazioni.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96142000000000','1000000000','Trasformazioni geometriche elementari','Trasformazioni geometriche elementari e loro invarianti  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96143000000000','1000000000','Le fasi risolutive di un problema','Le fasi risolutive di un problema e loro rappresentazioni con diagrammi','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96144000000000','1000000000','Principali rappresentazioni di un','Principali rappresentazioni di un oggetto matematico.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96145000000000','1000000000','Tecniche risolutive di un problema','Tecniche risolutive di un problema che utilizzano frazioni, proporzioni, percentuali, formule geometriche, equazioni e disequazioni di 1° grado.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96146000000000','1000000000','Significato di analisi e organizzazione','Significato di analisi e organizzazione di dati numerici.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96147000000000','1000000000','Il piano cartesiano e il concetto','Il piano cartesiano e il concetto di funzione.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96148000000000','1000000000','Funzioni di proporzionalità diretta,','Funzioni di proporzionalità diretta, inversa e relativi grafici, funzione lineare.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96149000000000','1000000000','Incertezza di una misura e concetto','Incertezza di una misura e concetto di errore.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96150000000000','1000000000','La notazione scientifica per i numeri','La notazione scientifica per i numeri reali.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96151000000000','1000000000','Il concetto e i metodi di approssimazione','Il concetto e i metodi di approssimazione  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96152000000000','1000000000','i numeri “macchina”','i numeri “macchina”','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96153000000000','1000000000','il concetto di approssimazione','il concetto di approssimazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96154000000000','1000000000','semplici applicazioni che consentono','semplici applicazioni che consentono di creare, elaborare un foglio elettronico con le forme grafiche corrispondenti','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96155000000000','1000000000','Concetto di misura e sua approssimazione','Concetto di misura e sua approssimazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96156000000000','1000000000','Errore sulla misura','Errore sulla misura','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96157000000000','1000000000','Principali Strumenti e tecniche di','Principali Strumenti e tecniche di misurazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96158000000000','1000000000','Sequenza delle operazioni da effettuare,.','Sequenza delle operazioni da effettuare,.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96159000000000','1000000000','Fondamentali Meccanismi di catalogazione','Fondamentali Meccanismi di catalogazione','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96160000000000','1000000000','Utilizzo dei principali programmi','Utilizzo dei principali programmi software','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96161000000000','1000000000','Concetto di sistema e di complessità','Concetto di sistema e di complessità Osservare, descrivere ed analizzare fenomeni appartenenti alla realtà naturale e artificiale e riconoscere nelle sue varie forme i concetti di sistema e di complessità','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96162000000000','1000000000','Schemi, tabelle e grafici','Schemi, tabelle e grafici','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96163000000000','1000000000','Principali Software dedicati.','Principali Software dedicati.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96164000000000','1000000000','Semplici schemi per presentare correlazioni','Semplici schemi per presentare correlazioni tra le variabili di un fenomeno appartenente all’ambito scientifico caratteristico del percorso formativo.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96165000000000','1000000000','Concetto di ecosistema.','Concetto di ecosistema.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96166000000000','1000000000','Impatto ambientale limiti di tolleranza.','Impatto ambientale limiti di tolleranza.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96167000000000','1000000000','Concetto di sviluppo sostenibile.','Concetto di sviluppo sostenibile.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96168000000000','1000000000','Schemi a blocchi','Schemi a blocchi','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96169000000000','1000000000','Concetto di input-output di un sistema','Concetto di input-output di un sistema artificiale.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96170000000000','1000000000','Diagrammi e schemi logici applicati','Diagrammi e schemi logici applicati ai fenomeni osservati. Analizzare qualitativamente e quantitativamente fenomeni legati alle trasformazioni di energia a partire dall’esperienza','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96171000000000','1000000000','Concetto di calore e di temperatura','Concetto di calore e di temperatura','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96172000000000','1000000000','Limiti di sostenibilità delle variabili','Limiti di sostenibilità delle variabili di un ecosistema','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96173000000000','1000000000','Strutture concettuali di base del','Strutture concettuali di base del sapere tecnologico','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96174000000000','1000000000','Fasi di un processo tecnologico (sequenza','Fasi di un processo tecnologico (sequenza delle operazioni: dall’ “idea” al “prodotto”) Essere consapevole delle potenzialità delle tecnologie rispetto al contesto culturale e sociale i cui vengono applicate','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96175000000000','1000000000','Il metodo della progettazione.','Il metodo della progettazione.','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96176000000000','1000000000','Architettura del computer','Architettura del computer','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96177000000000','1000000000','Struttura di Internet','Struttura di Internet','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96178000000000','1000000000','Struttura generale e operazioni comuni','Struttura generale e operazioni comuni ai diversi pacchetti applicativi (Tipologia di menù, operazioni di edizione, creazione e conservazione di documenti ecc.)','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96179000000000','1000000000','Operazioni specifiche di base di','Operazioni specifiche di base di alcuni dei programmi applicativi più comuni','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96180000000000','1000000000','Le periodizzazioni fondamentali della','Le periodizzazioni fondamentali della storia mondiale','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96181000000000','1000000000','I principali fenomeni storici e le','I principali fenomeni storici e le coordinate spazio-tempo che li determinano','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96182000000000','1000000000','I principali fenomeni sociali, economici','I principali fenomeni sociali, economici che caratterizzano il mondo contemporaneo, anche in relazione alle diverse culture','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96183000000000','1000000000','Conoscere i principali eventi che','Conoscere i principali eventi che consentono di comprendere la realtà nazionale ed europea','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96184000000000','1000000000','I principali sviluppi storici che','I principali sviluppi storici che hanno coinvolto il proprio territorio  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96185000000000','1000000000','Le diverse tipologie di fonti','Le diverse tipologie di fonti','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96186000000000','1000000000','Le principali tappe dello sviluppo','Le principali tappe dello sviluppo dell’innovazione tecnico-scientifica e della conseguente innovazione tecnologica','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96187000000000','1000000000','Costituzione italiana','Costituzione italiana','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96188000000000','1000000000','Organi dello Stato e loro funzioni','Organi dello Stato e loro funzioni principali','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96189000000000','1000000000','Conoscenze di base sul concetto di','Conoscenze di base sul concetto di norma giuridica e di gerarchia delle fonti','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96190000000000','1000000000','Principali Problematiche relative','Principali Problematiche relative all’integrazione e alla tutela dei diritti umani e alla promozione delle pari opportunità','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96191000000000','1000000000','Organi e funzioni di Regione, Provincia','Organi e funzioni di Regione, Provincia e Comune','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96192000000000','1000000000','Conoscenze essenziali dei servizi','Conoscenze essenziali dei servizi sociali','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96193000000000','1000000000','Ruolo delle organizzazioni internazionali','Ruolo delle organizzazioni internazionali','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96194000000000','1000000000','Principali tappe di sviluppo dell’Unione','Principali tappe di sviluppo dell’Unione Europea','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96195000000000','1000000000','Regole che governano l’economia e','Regole che governano l’economia e concetti fondamentali del mercato del lavoro','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96196000000000','1000000000','Regole per la costruzione di un curriculum','Regole per la costruzione di un curriculum vitae  ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96197000000000','1000000000','Strumenti essenziali per leggere','Strumenti essenziali per leggere il tessuto produttivo del proprio territorio','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96198000000000','1000000000','Principali soggetti del sistema economico','Principali soggetti del sistema economico del proprio territorio ','11435000000000','Knowledge');

    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('96203000000000','1000000000','Sistema delle competenze, conosenze ed abilità raggruppate per assi','Inizio struttura','11435000000000','Root');


	/* U04T1 e U04T2 */
    INSERT INTO scuola247.qualifications(qualification,school,"name",description,metric,"type") VALUES ('195977000000000','2000000000','Sistema delle competenze, conosenze ed abilità raggruppate per assi','Inizio struttura','11435000000000','Root');


    _results = _results || assert.pass(full_function_name, test_name);

    EXCEPTION WHEN OTHERS THEN

      GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;

      _results = _results || assert.fail(full_function_name, test_name, 'INSERT scuola247.qualifications FAILED'::text, error);

      RETURN;

  END;

  ------------------------------------------

  test_name = 'Update qualification_parent';

  ------------------------------------------

  BEGIN

        _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95977000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95978000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95979000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95980000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95981000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95964000000000 WHERE qualification = 95982000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95965000000000 WHERE qualification = 95983000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95965000000000 WHERE qualification = 95984000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95965000000000 WHERE qualification = 95985000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95965000000000 WHERE qualification = 95986000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95966000000000 WHERE qualification = 95987000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95966000000000 WHERE qualification = 95988000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95966000000000 WHERE qualification = 95989000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95967000000000 WHERE qualification = 95990000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95967000000000 WHERE qualification = 95991000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95967000000000 WHERE qualification = 95992000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 96203000000000 WHERE qualification = 95964000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 96203000000000 WHERE qualification = 95965000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 96203000000000 WHERE qualification = 95966000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 96203000000000 WHERE qualification = 95967000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96019000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96020000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96021000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96022000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96023000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96024000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96025000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96026000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96027000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96028000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96029000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96030000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96031000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96032000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96033000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96034000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96136000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96035000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96036000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96037000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96038000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96039000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96040000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95981000000000 WHERE qualification = 96041000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95981000000000 WHERE qualification = 96042000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95982000000000 WHERE qualification = 96043000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95982000000000 WHERE qualification = 96044000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96045000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96046000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96047000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96048000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96049000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96050000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96051000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96052000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96053000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96054000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96055000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96056000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96057000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96058000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96059000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96060000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96061000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96062000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96063000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96064000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96065000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96137000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96066000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96067000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96068000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96069000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96070000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96071000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96072000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96073000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96074000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96075000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96076000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96077000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96078000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96079000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95988000000000 WHERE qualification = 96080000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95988000000000 WHERE qualification = 96081000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96082000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96083000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96084000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96085000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96086000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96087000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96088000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96089000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96090000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96091000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96092000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96093000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96094000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96138000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96095000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96096000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96097000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96098000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96099000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96100000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96101000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96102000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96103000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96104000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96105000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95977000000000 WHERE qualification = 96106000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96107000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96108000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96109000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96110000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96111000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96112000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96113000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95978000000000 WHERE qualification = 96114000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96115000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96116000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96117000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95979000000000 WHERE qualification = 96118000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96119000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96120000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96121000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96122000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96123000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95980000000000 WHERE qualification = 96124000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95981000000000 WHERE qualification = 96125000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95981000000000 WHERE qualification = 96126000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95982000000000 WHERE qualification = 96127000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95982000000000 WHERE qualification = 96128000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95982000000000 WHERE qualification = 96129000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96130000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96131000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96132000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96133000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95983000000000 WHERE qualification = 96134000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96135000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96139000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96140000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96141000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95984000000000 WHERE qualification = 96142000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96143000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96144000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95985000000000 WHERE qualification = 96145000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96146000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96147000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96148000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96149000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96150000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96151000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96152000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96153000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95986000000000 WHERE qualification = 96154000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96155000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96156000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96157000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96158000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96159000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96160000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96161000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96162000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96163000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96164000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96165000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96166000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96167000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96168000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96169000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95987000000000 WHERE qualification = 96170000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95988000000000 WHERE qualification = 96171000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95988000000000 WHERE qualification = 96172000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96173000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96174000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96175000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96176000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96177000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96178000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95989000000000 WHERE qualification = 96179000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96180000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96181000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96182000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96183000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96184000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96185000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95990000000000 WHERE qualification = 96186000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96187000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96188000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96189000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96190000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96191000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96192000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96193000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95991000000000 WHERE qualification = 96194000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96195000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96196000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96197000000000;', 1);

    _results = _results || assert.check_update_done('UPDATE scuola247.qualifications SET qualification_parent = 95992000000000 WHERE qualification = 96198000000000;', 1);


    _results = _results || assert.pass(full_function_name, test_name);

    EXCEPTION WHEN OTHERS THEN

      GET STACKED DIAGNOSTICS error.returned_sqlstate = RETURNED_SQLSTATE, error.message_text = MESSAGE_TEXT, error.schema_name = SCHEMA_NAME, error.table_name = TABLE_NAME, error.column_name = COLUMN_NAME, error.constraint_name = CONSTRAINT_NAME, error.pg_exception_context = PG_EXCEPTION_CONTEXT, error.pg_exception_detail = PG_EXCEPTION_DETAIL, error.pg_exception_hint = PG_EXCEPTION_HINT, error.pg_datatype_name = PG_DATATYPE_NAME;

      _results = _results || assert.fail(full_function_name, test_name, 'UPDATE scuola247.qualifications FAILED'::text, error);

      RETURN;

  END;
  RETURN;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION unit_tests_public.qualifications(boolean)
  OWNER TO postgres;
