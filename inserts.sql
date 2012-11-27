use test1

-- venue
insert into Venue (Name, City, ZipCode, Street, Phone) values('Budynek1', 'NYC', '43-300', 'Wall', '509111111');
insert into Venue (Name, City, ZipCode, Street, Phone) values('Budynek 2', 'Bielsko-Biala', '38-364', 'Warszawska', '+48509144555');

-- conference
insert into Conference (Name, VenueID, [Date]) values ('Moja konferencja', 1, GETDATE())