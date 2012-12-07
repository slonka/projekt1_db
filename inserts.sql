------------------------------------------------

/*
 * Uzywanie danych z bazy ExampleData:
 * Tworzymy sobie zapytanie
 * select 'insert into tabela ([kolumna1], [kolumna2], ...) values (''' + wartosc_typu_varchar +''', '+ wartosc_int +', ...); from GeneralData '
 * wybierajac w nim dane jakie nam sa potrzebne
 * to tworzy nam polecenia kt�re wystarczy przekopiowa� do edytora i wykona� (F5)
 * trzeba tylko pami�ta� aby zaznaczy� "Results to text" na pasku
 * przyklad
*/

use ExampleData
select 'insert into tabela ([id], [City], [ZipCode], [Street], [Phone]) values (' + cast(id as varchar(10)) +', '''+ City+''', '''+ ZipCode+''', '''+ Street+''', '''+ Phone+''');' from GeneralData 

------------------------------------------------

use test1

-- venue
insert into Venue (Name, City, ZipCode, Street, Phone) values('Budynek1', 'NYC', '43-300', 'Wall', '509111111');
insert into Venue (Name, City, ZipCode, Street, Phone) values('Budynek 2', 'Bielsko-Biala', '38-364', 'Warszawska', '+48509144555');

-- conference
insert into Conference (Name, VenueID, [Date]) values ('Moja konferencja', 1, GETDATE())