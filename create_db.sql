/* Configuration 
declare @DB_NAME varchar */

create database test1
use test1

-- identity(1,1) auto increment from 1 by 1
create table Venue
(
 id int not null identity(1,1) primary key,
 Name varchar(50),
 City varchar(50),
 ZipCode varchar(6) CONSTRAINT CheckZipCode CHECK (ZipCode like '[0-9][0-9]-[0-9][0-9][0-9]'),
 Street varchar(50),
 Phone varchar(15) CONSTRAINT CheckPhone CHECK (Phone like '[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												or Phone like '+48[0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9][0-9]'
												)
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