-- -----------------------------------------------------
-- Table `knjizara`.`autor`
-- -----------------------------------------------------
INSERT INTO autor (`Ime`, `Prezime`, `Opis`)
  VALUES ("Bil", "Brajson", "Bil Brajson ro�en je 1951. godine u De Moinu u Ajovi. Na svom prvom putovanju po Evropi, s rancem na le�ima 1973, dospeo je i u Englesku, gde je upoznao �enu koja �e mu postati supruga i re�io da se skrasi. Pi�e putopisne �lanke za Tajms i Indipendent. Do 1995. �iveo je sa �enom i �etvoro dece u Severnom Jork�iru, a potom odlu�io da se vrati u Sjedinjene Dr�ave i preselio se s porodicom u Hanover u Nju Hemp�iru. Osam godina kasnije re�io se na jo� jedan povratak, i Brajsonovi od 2003. ponovo �ive u Engleskoj.

    Prva Brajsonova knjiga bio je urnebesni putopis The Lost Continent (Izgubljeni kontinent), u kome je opisao putovanja po malim ameri�kim gradovima u starom �evroletu svoje majke. Od tada je objavio, izme�u ostalog, A Walk in the Woods (�etnja po �umi), I`m a Stranger Here Myself (I ja sam ovde stranac), The Mother Tongue (Maternji jezik) i Bill Bryson`s African Diary (Afri�ki dnevnik Bila Brajsona). Pored duhovitog putopisa Ni ovde ni tamo: pute�estvija po Evropi, Laguna je objavila i A short History of Nearly Everything (Kratka istorija bezmalo sva�ega).

    Bil Brajson je za Kratku istoriju bezmalo sva�ega dobio 2005. Dekartovu nagradu koju EU dodeljuje za izuzetna me�unarodna ostvarenja u oblasti nauke. Kratka istorija bezmalo sva�ega je tako�e dobila nagradu Aventis u kategoriji nau�nih knjiga 2004.
    "
    );
INSERT INTO autor (`Ime`, `Prezime`)
  VALUES ("Simonida", "Milojkovi�"),
      ("Danjan", "�en"),
      ("Bob", "Dilan"),
      ("Dejan", "Stojiljkovi�"),
      ("Vladimir", "Kecmanovi�");
-- -----------------------------------------------------
-- Table `knjizara`.`izdavac`
-- -----------------------------------------------------
INSERT INTO izdavac (`Naziv`, `Adresa`, `Grad`, `Drzava`)
  VALUES ("Laguna", "Resavska 33", "Beograd", "Srbija"),
      ("Geopoetika", "Gospodar Jovanova 65", "Beograd", "Srbija");
-- -----------------------------------------------------
-- Table `knjizara`.`knjiga`
-- ----------------------------------------------------- 
INSERT INTO knjiga (`ISBN`, `Naziv`, `Opis`, `Dostupno_komada`, `Format`, `Broj_strana`, `Godina_izdanja`, `Cena`, `Izdavac_ID_izdavaca`,`pismo_ID_pisma`)
  VALUES (9788661452475, "Hronike", "Prvi deo

    Dogodilo se. Ipak i najzad: Bob Dilan je svoj �ivot i pero uzeo u svoje ruke i dao nam na uvid fragmente svog bogatog stvarala�tva. Posle stotina knjiga i hiljada tekstova koje su o njemu objavili drugi, evo ga u ulozi sopstvenog tuma�a. Hronike nisu standardna autobiografija niti samo ispovest; ve� vrlo va�an dokument o vremenu i �ivotima nekoliko poslednjih generacija druge polovine 20. veka koje su veruju�i u utopiju menjale sve(s)t.

    Dilan nam Hronikama pokazuje kako se istovremeno biva u�esnik i svedok. Koliko je (bio) va�an i jedinstven u�esnik, svi smo znali. Sada vidimo koliko je i va�an hroni�ar; briljantnog pam�enja, istan�anog zapa�anja, knji�evno originalnog jezika, nepateti�ne iskrenosti, zdravog humora i umerenog cinizma.

    Dilan je pisac koji je nau�io kako da isku�ava �itala�ko nestrpljenje: Hronike se �itaju kao najzanimljiviji roman u kojem ni redosled pisanja ni sled doga�aja nisu hronolo�ki pore�ani. Kao da je za�eleo da nam ka�e kako je njegov �ivot niz hronika, ali ne i hronologija. Da li je zato najavio Drugi i Tre�i deo ove knjige?

    Vladislav Bajac

    Ova knjiga ni u kom pogledu ne predstavlja standardnu ili sveobuhvatnu autobiografiju. Hronike su pre epizodno, uz pomo� ve�tih rezova montirano dokumentarno svedo�anstvo o putovanju kroz se�anja najve�eg ameri�kog �ivog pesnika, ispri�ano bogatim i sonornim jezikom, glasom koji je nepogre�ivo Dilanov i ni�iji drugi.

    Hronike zapravo nisu nalik nijednoj odre�enoj vrsti knjige. Jedino s �im ih mo�emo uporediti jeste neka Dilanova pesma � one evociraju prizore i lica i mesta � na rubu izme�u dokumentarnog i nadrealnog, stvaraju�i slojeve zna�enja putem preciznih detalja, ba� kao i njegovi najbolji stihovi.

    Dejan D. Markovi�
    ", 15, "22 cm", 242, "2016-10-01", 841.50, 2,1);
    
INSERT INTO knjiga (`ISBN`, `Naziv`, `Dostupno_komada`, `Format`, `Broj_strana`, `Godina_izdanja`, `Cena`, `Izdavac_ID_izdavaca`,
`pismo_ID_pisma`)
  VALUES (9788652124169, "�angajska princeza", 5, "13x20 cm", 407, "2016-10-22", 899.00, 1,2),
      (9788652124237, "Nemanji�i � Dva orla", 51, "19x19 cm", 72, "2016-10-19", 599, 1,1),
      (9788652123896, "Putovanje u Mali Dribling", 11, "13x20 cm", 448, "2016-09-10", 719.28, 1),
      (9788652113972, "Tamo dole", 0, "13x20 cm", 429, "2014-01-31", 999, 1,1),
      (9788652113972, "Tamo dole", 0, "13x20 cm", 429, "2014-01-31", 999, 1,2),

-- -----------------------------------------------------
-- Table `knjizara`.`potpisane_knjige`
-- -----------------------------------------------------
INSERT INTO potpisane_knjige (`ISBN`, `Komada`)
  VALUES (9788661452475, 2),
      (9788652124237, 3);      
      
-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_pismo`
-- -----------------------------------------------------
--INSERT INTO knjiga_ima_pismo (`ISBN`, `Pismo_ID_pisma`)
--  VALUES (9788661452475, 1),
--      (9788652124169, 2),
--      (9788652124237, 1),
--      (9788652123896, 1),
--      (9788652113972, 1),
--      (9788652113972, 2);
-- -----------------------------------------------------
-- Table `knjizara`.`knjiga_ima_zanr`
-- -----------------------------------------------------
INSERT INTO knjiga_ima_zanr (`ISBN`, `ID_zanra`)
  VALUES (9788661452475, 2),
      (9788652124169, 1),
      (9788652124237, 2),
      (9788652124237, 3),
      (9788652124237, 4),
      (9788652123896, 5),
      (9788652123896, 6),
      (9788652113972, 5),
      (9788652113972, 6);

-- -----------------------------------------------------
-- Table `knjizara`.`potpisane_knjige`
-- -----------------------------------------------------

INSERT INTO potpisane_knjige (`ISBN`, `Komada`)
  VALUES (9788661452475, 2);      

--------------------------------------------------------
-- Table `knjizara`.`knjiga_ima_autor`
-- -----------------------------------------------------
INSERT INTO knjiga_ima_autor (`ISBN`, `ID_autora`)
      VALUES(9788661452475, 2),
      (9788652124237, 5),
      (9788652124237, 6),
      (9788652123896, 1),
      (9788652113972, 1);
-- -----------------------------------------------------
-- Table `knjizara`.`pismo`
-- -----------------------------------------------------
INSERT INTO pismo (`Vrsta`)
  VALUES ("Latinica"),
      ("Cirilica");
            
-- -----------------------------------------------------
-- Table `knjizara`.`zanr`
-- -----------------------------------------------------
INSERT INTO zanr (`Naziv`)
  VALUES ("Autobiografije i biografije"),
      ("Istorijski"),
      ("Doma�i pisci"),
      ("Drama"),
      ("Putopisi"),      
      ("Komedije");
      
      
-- -----------------------------------------------------
-- Table `knjizara`.`users`
-- -----------------------------------------------------
INSERT INTO users (`username`, `password`, `enabled`)
  VALUES ("admin", "admin", 1);
      
      
-- -----------------------------------------------------
-- Table `knjizara`.`zanr`
-- -----------------------------------------------------
INSERT INTO authorities (`username`, `authority`)
  VALUES ("admin", "ROLE_USER");
      
      

