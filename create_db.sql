/* Configuration 
declare @DB_NAME varchar */

create database test1

use test1

-- identity(1,1) auto increment from 1 by 1


create table Venue
(
 id int not null identity(1,1) primary key,
 City varchar(50),
 ZipCode varchar(6),
 Street varchar(50),
 CONSTRAINT ZipCode CHECK (ZipCode like '[0-9][0-9]-[0-9][0-9][0-9]')
);

create table Conference
(
 id int not null identity(1,1) primary key,
 [Date] date,
 Name varchar,
 VenueID int not null,
 foreign key ( VenueID ) references Venue(id)
);

-- cleanup
use Northwind
drop database test1
drop table Venue