-- -----------------------------------------------------
-- Table `knjizara`.`autor`
-- -----------------------------------------------------
INSERT INTO autor (`Ime`, `Prezime`, `Opis`)
  VALUES ("Bil", "Brajson", "Bil Brajson roðen je 1951. godine u De Moinu u Ajovi. Na svom prvom putovanju po Evropi, s rancem na leðima 1973, dospeo je i u Englesku, gde je upoznao ženu koja æe mu postati supruga i rešio da se skrasi. Piše putopisne èlanke za Tajms i Indipendent. Do 1995. živeo je sa ženom i èetvoro dece u Severnom Jorkširu, a potom odluèio da se vrati u Sjedinjene Države i preselio se s porodicom u Hanover u Nju Hempširu. Osam godina kasnije rešio se na još jedan povratak, i Brajsonovi od 2003. ponovo žive u Engleskoj.

    Prva Brajsonova knjiga bio je urnebesni putopis The Lost Continent (Izgubljeni kontinent), u kome je opisao putovanja po malim amerièkim gradovima u starom ševroletu svoje majke. Od tada je objavio, izmeðu ostalog, A Walk in the Woods (Šetnja po šumi), I`m a Stranger Here Myself (I ja sam ovde stranac), The Mother Tongue (Maternji jezik) i Bill Bryson`s African Diary (Afrièki dnevnik Bila Brajsona). Pored duhovitog putopisa Ni ovde ni tamo: putešestvija po Evropi, Laguna je objavila i A short History of Nearly Everything (Kratka istorija bezmalo svaèega).

    Bil Brajson je za Kratku istoriju bezmalo svaèega dobio 2005. Dekartovu nagradu koju EU dodeljuje za izuzetna meðunarodna ostvarenja u oblasti nauke. Kratka istorija bezmalo svaèega je takoðe dobila nagradu Aventis u kategoriji nauènih knjiga 2004.
    "
    );
INSERT INTO autor (`Ime`, `Prezime`)
  VALUES ("Simonida", "Milojkoviæ"),
      ("Danjan", "Èen"),
      ("Bob", "Dilan"),
      ("Dejan", "Stojiljkoviæ"),
      ("Vladimir", "Kecmanoviæ");
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

    Dogodilo se. Ipak i najzad: Bob Dilan je svoj život i pero uzeo u svoje ruke i dao nam na uvid fragmente svog bogatog stvaralaštva. Posle stotina knjiga i hiljada tekstova koje su o njemu objavili drugi, evo ga u ulozi sopstvenog tumaèa. Hronike nisu standardna autobiografija niti samo ispovest; veæ vrlo važan dokument o vremenu i životima nekoliko poslednjih generacija druge polovine 20. veka koje su verujuæi u utopiju menjale sve(s)t.

    Dilan nam Hronikama pokazuje kako se istovremeno biva uèesnik i svedok. Koliko je (bio) važan i jedinstven uèesnik, svi smo znali. Sada vidimo koliko je i važan hronièar; briljantnog pamæenja, istanèanog zapažanja, književno originalnog jezika, nepatetiène iskrenosti, zdravog humora i umerenog cinizma.

    Dilan je pisac koji je nauèio kako da iskušava èitalaèko nestrpljenje: Hronike se èitaju kao najzanimljiviji roman u kojem ni redosled pisanja ni sled dogaðaja nisu hronološki poreðani. Kao da je zaželeo da nam kaže kako je njegov život niz hronika, ali ne i hronologija. Da li je zato najavio Drugi i Treæi deo ove knjige?

    Vladislav Bajac

    Ova knjiga ni u kom pogledu ne predstavlja standardnu ili sveobuhvatnu autobiografiju. Hronike su pre epizodno, uz pomoæ veštih rezova montirano dokumentarno svedoèanstvo o putovanju kroz seæanja najveæeg amerièkog živog pesnika, isprièano bogatim i sonornim jezikom, glasom koji je nepogrešivo Dilanov i nièiji drugi.

    Hronike zapravo nisu nalik nijednoj odreðenoj vrsti knjige. Jedino s èim ih možemo uporediti jeste neka Dilanova pesma – one evociraju prizore i lica i mesta – na rubu izmeðu dokumentarnog i nadrealnog, stvarajuæi slojeve znaèenja putem preciznih detalja, baš kao i njegovi najbolji stihovi.

    Dejan D. Markoviæ
    ", 15, "22 cm", 242, "2016-10-01", 841.50, 2,1);
    
INSERT INTO knjiga (`ISBN`, `Naziv`, `Dostupno_komada`, `Format`, `Broj_strana`, `Godina_izdanja`, `Cena`, `Izdavac_ID_izdavaca`,
`pismo_ID_pisma`)
  VALUES (9788652124169, "Šangajska princeza", 5, "13x20 cm", 407, "2016-10-22", 899.00, 1,2),
      (9788652124237, "Nemanjiæi – Dva orla", 51, "19x19 cm", 72, "2016-10-19", 599, 1,1),
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
      ("Domaæi pisci"),
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
      
      

