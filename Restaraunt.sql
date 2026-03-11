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
	MealId int not null,
	TableId int not null,
	OrderDate datetime default getdate() not null,

	foreign key (MealId) references Meals(MealId),
	foreign key (TableId) references [Tables](TableId)
);

insert into [Tables] (Number) values ('T1');
insert into [Tables] (Number) values ('T2');
insert into [Tables] (Number) values ('T3');
insert into [Tables] (Number) values ('T4');

insert into Meals ([Name], Price) values ('Döner', 2.5);
insert into Meals ([Name], Price) values ('Tantuni', 4);
insert into Meals ([Name], Price) values ('Ayran', 1);
insert into Meals ([Name], Price) values ('Içki', 1.5);

insert into Orders (MealId, TableId) values (2, 1);
insert into Orders (MealId, TableId) values (2, 2);
insert into Orders (MealId, TableId) values (4, 2);
insert into Orders (MealId, TableId) values (1, 3);
insert into Orders (MealId, TableId) values (3, 1);

select datediff(day,'2026-01-01', getdate()) as GunFerqi,
dateadd(day,5,getdate()) as BesGunSonra;

select 
t.TableId,
t.Number,
count(o.OrderId) as OrderCount
from [Tables] t
left join Orders o on t.TableId = o.TableId
group by t.TableId, t.Number;

select
m.MealId,
m.Name,
count(o.OrderId) as OrderCount
from Meals m
left join Orders o on m.MealId = o.MealId
group by m.MealId, m.Name;

select
o.OrderId,
o.OrderDate,
m.Name
from Orders o
join Meals m on o.MealId = m.MealId;

select
o.OrderId,
o.OrderDate,
m.Name,
t.Number
from Orders o
join Meals m on o.MealId = m.MealId
join [Tables] t on o.TableId = t.TableId;

select
t.TableId,
t.Number,
sum(m.Price) as TotalAmount
from [Tables] t
left join Orders o on t.TableId = o.TableId
left join Meals m on o.MealId = m.MealId
group by t.TableId, t.Number;

select 
datediff(hour, min(OrderDate), max(OrderDate)) as HourDifference
from Orders
where TableId = 1;

select *
from Orders
where OrderDate < dateadd(minute,-30,getdate());

select *
from [Tables] t
where not exists (
	select 1
	from Orders o
	where o.TableId = t.TableId
);

select *
from [Tables] t
where not exists (
	select 1
	from Orders o
	where o.TableId = t.TableId
	and o.OrderDate >= dateadd(minute,-60,getdate())
);