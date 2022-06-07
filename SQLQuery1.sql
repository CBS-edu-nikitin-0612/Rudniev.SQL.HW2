CREATE DATABASE AdventureWorks2012_Data
ON (FILENAME = N'D:\hardWork\courses\SQL\adventure-works-2012-oltp-data-file.mdf')
FOR ATTACH_REBUILD_LOG
Go

use AdventureWorks2012_Data
/* aditional task */

select ProductID, Name, StandardCost from Production.Product
where StandardCost > 100
go

select ProductId, Name, ProductNumber from Production.Product
where Name like 'ML%' and ProductNumber like 'RM%'
go

--FoR check 
select ProductID, Name, ProductNumber, StandardCost from Production.Product
go

/* task 2 */
create database HomeWork
on
(
	name = 'HomeWork',
	fileName = 'D:\hardWork\courses\SQL\lesson2\HomeWork.mdf',
	size = 5mb,
	maxsize = 20mb,
	filegrowth = 5mb
)
log on
(
	name = 'LogHomeWork',
	fileName = 'D:\hardWork\courses\SQL\lesson2\HomeWork.ldf',
	size = 5mb,
	maxsize = 20mb,
	filegrowth = 5mb
)
collate cyrillic_general_ci_as
go

use HomeWork
go

create table Product
(
	ProductId smallint identity not null,
	Name nvarchar(20) not null,
	ProductNumber char(8) not null,
	Cost smallmoney not null,
	Count int null,
	SellStartDate Date null
)
go

insert into Product
values
('Корона', 'AK-53818', 5, 50, '2011-08-15'),
('Милка', 'AM-51122', 6.1, 50, '15/07/2011'),
('Аленка', 'AA-52211', 2.5, 20, '15/06/2011'),
('Snickers', 'BS-32118', 2.8, 50, '15/08/2011'),
('Snickers', 'BSL-3818', 5, 100, '20/08/2011'),
('Bounty', 'BB-38218', 3, 100, '01/08/2011'),
('Nuts', 'BN-37818', 3, 100, '21/08/2011'),
('Mars', 'BM-3618', 2.5, 50, '24/08/2011'),
('Свиточ', 'AS-54181', 5, 100, '12/08/2011'),
('Свиточ', 'AS-54182', 5, 100, '12/08/2011');
go

--FoR check 
select * from Product;
go

/* task 3 */
select * from Product
where count > 59;
go

select * from Product
where Cost > 3 and SellStartDate = '20/08/2011';
go

/* task 4 */
update Product
set Cost = ((select Cost from Product where ProductId = 11) + 0.25)
where Name = 'Свиточ'
go

--FoR check 
select * from Product;
go

/* aditional */

use HomeWork
go

select * from Product
order by Name
go

select ProductId, Name, Count, Cost from Product
where Cost in (3, 2.5, 5, 6.1)
order by Cost
go

select SellStartDate as Date, sum(Count) as TotalCount
from Product
group by SellStartDate
go

select SellStartDate as Date, sum(Count) as TotalCount
from Product
group by SellStartDate
having sum(Count) >= 100
go