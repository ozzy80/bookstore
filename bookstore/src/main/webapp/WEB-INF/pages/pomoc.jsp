<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all" />	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/cartController.js" />"></script>
<title>Pomoć</title>
</head>
<body>
	<br/><br/>
	<div class="container-wrapper3">
		<div class="container">
			<div >
				<div class="loginlinkovi">
					<a href="#" class="pomoclinkpocetna">Vrati se na početnu</a>
				</div>
				<div id="loginlogo"><h1><a href="<c:url value="/" />">BeanBook</a></h1></div>
				
				<h2>Pomoć</h2>
				
				<h3>Registracija</h3><br/>
				<div style="width:670px;height:170px;">
				<b>Da li je neophodna?</b><br/>

				Ne morate da se registrujete da bi kupovali na našim stranicama. Ali, to je potrebno ako želite da dodajete artikle na Vašu listu želja. Pored toga, sam proces kupovine je brži za registrovane korisnike. <br/><br/>

				<b>Kako se registruje?</b><br/>

				Proces registracije je jednostavan:
				Kliknite na "Registracija" u gornjem desnom uglu stranice.
 
				Upišite tražene podatke u za to predviđene rubrike.

				Kliknite na "Pošalji"

				Nakon toga na Vas e-mail biće prosleđeni Vaši korisnički podaci za logovanje. Kada <br/> ponovno posetite naše stranice, dovoljno je samo da se ulogujete. 

				Logujete se pritiskom na "Prijava" - poterebno je samo da unesete svoj članski broj i lozinku koji ste prilikom registracije dobili na mejl. 
				
				</div>
				
				<h3>Kupovina</h3>
				<div style="width:670px;height:600px;"><br/>
				<b>Kako kupujem?</b><br/><br/>
				Odaberite artikle koje želite da kupite. Pored svakog artikla nalazi se dugme "Dodaj u korpu" – kliknite na njega i artikal će automatski biti dodat u Vašu korpu.
				Artikle u korpi možete na isti način dodati i sa svoje liste želja. U svakom trenutku pogledom na korpu u gornjem desnom uglu ekrana možete da vidite koliko artikala imate u korpi i koja je njihova ukupna cena.
				Kada ste odabrali sve artikle koje želite da kupite, kliknite na korpu u gornjem desnom uglu ekrana i otvori će Vam se obrazac za kupovinu.
				 Možete birati između plaćanja:
				- Karticom
				- Pouzećem
				- Uplatom na račun 
				Pregledajte svoju porudžbinu. Ako su svi podaci tačni, kliknite na dugme "Potvrdi kupovinu".
				Delfi knjižare vrše predugovorno obaveštavanje svojih kupaca na način da prikazuju specifikaciju celokupne porudžbine kao i prikaz svih uslova kupovine neposredno pre ulaska kupca u proces poručiuvanja tj. plaćanja.
				<br/><br/><br/>
				<b>Načini plaćanja</b> <br/><br/>
Pouzećem:<br/> Naručene artikle dobijate na kućnu adresu, a troškove narudžbine plaćate kuriru. <br/><br/>
Uplatom na račun:<br/>Novac nam uplaćujete na naš tekući račun. Nakon što evidentiramo uplatu, u roku od 24 sata knjige će vam biti poslate a isporučene u skladu sa rokom za dostavu. Rok za uplatu je sedam dana.<br/><br/>
Platnim karticama:<br/> Ako izaberete plaćanje platnim karticama, tokom procesa naručivanja bićete automatski preusmereni na sajt Banca Intesa Beograd. Banka Intesa Beograd vrši procesuiranje kartica na internetu. Na sajtu Banca Intesa Beograd unosite broj svoje kartice i ostale potrebne podatke. Banka vrši proveru vaše kartice i raspoloživost sredstava na računu, i ako imate uslove za plaćanje, rezerviše sredstva na vašem tekućem računu u vrednosti iznosa porudžbine. U slučaju uspešne rezervacije automatski vam se prosleđuje email sa svim detaljima vaše narudžbenice i detaljima transakcije. Nakon završetka plaćanja sa sajta Banca Intesa Beograd bićete ponovo prosleđeni na delfi.rs gde se kupovina završava. Podaci sa platne kartice od vašeg računara do sajta banke se prenose u zaštićenoj formi upotrebom SSL protokola, kao trenutno najsavremenije tehnologije. Sigurnost podataka prilikom plaćanja garantuje Banca Intesa Beograd i podaci o platnoj kartici niti u jednom trenutku nisu dostupni delfi.rs prodajnom mestu. Ceo sistem je organizovan u cilju maksimalne zaštite vaših poverljivih podataka i predstavalja standard za plaćanje preko interneta širom sveta.				
				</div>
			</div>
		</div>		
	</div>


</body>