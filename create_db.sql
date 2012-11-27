/* Configuration 
declare @DB_NAME varchar */

create database test1
use test1

-- identity(1,1) auto increment from 1 by 1
create table Venue
(
 id int not null identity(1,1) primary key,
 Name varchar(50),
 ContactID int,
 foreign key ( ContactID ) references Contact(id),									
);

create table Agenda
(
 ConferenceId int not null,
 LectureName varchar(255),
 TimeFrom time,
 TimeTo time
);

create table Conference
(
 id int not null identity(1,1) primary key,
 Name varchar(50),
 VenueID int not null,
 [Date] date,
 AgendaID int,
 foreign key ( VenueID ) references Venue(id),
 foreign key ( AgendaID ) references Agenda(ConferenceId)
);

create table UserGroup
(
 id int not null,
 UserID int
);

create table Company
(
 id int not null identity(1,1) primary key,
 Name varchar(50),
 ContactID int,
 Username varchar(50) unique, -- potrzebny bedzie trigger aby sprawdzal aby czy Customer nie chce takiego samego Username
 [Password] varchar(40) not null,      -- lub przy logowaniu bedzie wybor: Customer / Company
 foreign key ( ContactID ) references Contact(id)		
);

create table Customer
(
 id int not null identity(1,1) primary key,
 FirstName varchar(50),
 LastName varchar(50),
 Email varchar(50) constraint CheckEmail check (Email like '%@%.[a-z][a-z]'
												or Email like '%@%.[a-z][a-z]'),
 CompanyID int default null,
 Username varchar(50) unique,
 [Password] varchar(40) not null, -- sha1
 --nie jestem pewien czy moze tu byc skoro moze byc null, to sie jakos triggerem zalatwi
 --foreign key ( CompanyID ) references Company(id)
);

create table Contact
(
 id int not null identity(1,1) primary key,
 City varchar(50),
 ZipCode varchar(6) constraint CheckZipCode check (ZipCode like '[0-9][0-9]-[0-9][0-9][0-9]'),
 Street varchar(50),
 Phone varchar(15) constraint CheckPhone check (Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												or Phone like '+48[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												)
);

create table Workshop
(
 id int not null identity(1,1) primary key,
 Price smallmoney,
 ConferenceID int,
 TimeFrom time,
 TimeTo time,
 Limit int, -- potrzebny bedzie trigger aby liczyc ilosc osob ktore sie zapisaly aby nie przekroczyc limitu
 foreign key ( ConferenceID ) references Conference(id)
);

create table Discount
(
 DateFrom date,
 Discount int constraint CheckDiscount check (Discount >= 0 and Discount <= 100),
 ConferenceID int,
 StudentID int, -- id uzytkownika odnoszace sie do do tabeli customer
 foreign key ( ConferenceID ) references Conference(id)
);

create table WorkshopGroup
(
 UserID int not null,
 WorkshopID int not null,
 foreign key (UserID) references Customer(id),
 foreign key (WorkshopID) references Workshop(id)
);

create table Registration
(
 id int not null identity(1,1) primary key,
 ConferenceID int,
 CustomerID int,
 CompanyID int,
 [Date] date,
 ReservedSeats int constraint CheckReservedSeats check (ReservedSeats <= Limit or ReservedSeats is null),
 Limit int,
 Price smallmoney,
 constraint CheckCustomerOrCompany check ( (CustomerID is null and CompanyID is not null and ReservedSeats is not null) or
											CustomerID is not null and CompanyID is null and ReservedSeats is null)

);