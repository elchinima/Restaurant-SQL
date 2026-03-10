create database Restoraunt;

use Restoraunt;

drop table if exists [Tables];
drop table if exists Meals;
drop table if exists Orders;

create table [Tables] (
	TableId int primary key identity,
	Number nvarchar(100) not null
); 

create table Meals (
	MealId int primary key identity,
	[Name] nvarchar(100) not null,
	Price decimal(10,2) not null
);

create table Orders (
	OrderId int primary key identity,
	MealId int foreign key (MealId) references Meals(MealId) not null,
	TableId int foreign key (TableId) references [Tables](TableId) not null,
	OrderDate datetime default getdate() not null
);

insert into [Tables] (Number) values ('T1');
insert into [Tables] (Number) values ('T2');
insert into [Tables] (Number) values ('T3');
insert into [Tables] (Number) values ('T4');

insert into Meals ([Name], Price) values ('Dönər', '2.5');
insert into Meals ([Name], Price) values ('Tantuni', '4');
insert into Meals ([Name], Price) values ('Ayran', '1');
insert into Meals ([Name], Price) values ('Içki', '1.5');

