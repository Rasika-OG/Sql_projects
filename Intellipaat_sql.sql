--SQL basics

--create database
create database retail;

--selection of retail database
use retail;

--creating table using DDL(create,drop, truncate,alter)
--dbo means database owner
CREATE TABLE salespeople (
snum INT NOT NULL,
sname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
comm DECIMAL(4,2) NOT NULL,
PRIMARY KEY (snum)
);

--view data in table DQL-data query lang
select * from salespeople;

--inserting data in table DML- data manipulation lang (insert, update, delete)

INSERT INTO salespeople VALUES (1001, 'Peel', 'London', 0.12);
INSERT INTO salespeople VALUES (1002, 'Serres', 'San Jose', 0.13);

--add multiple records in a single command
INSERT INTO salespeople VALUES (1004, 'Motika', 'London', 0.11), 
(1007, 'Rifkin', 'Barcelona', 0.15),
(1003, 'AxelRod', 'New York', 0.10), (1005, 'Fran', 'London', 0.26);

--selecting specific columns:
select snum, sname from salespeople;

--coditional search on column -where clause:
--not case sensitive sql
select * from salespeople where city='london';

--multiple conditions using and/or
--people living in london and comm is less than0.15
select * from salespeople where city='london' and comm < 0.15 ;

--find people living in london and new york
select * from salespeople where city='london' or city='new york';

--in clause
select * from salespeople where city in ('london', 'new york');

--find people whose comm is between 10 & 20 percent(including 10 & 20)
select * from salespeople where comm >=0.1 and comm<=0.2;

select * from salespeople where comm <=0.1 or comm>=0.2;

--between clause
select * from salespeople where comm between 0.1 and 0.2;

--not equal to:
select * from salespeople where city!='london';

--modify peel's city:
update salespeople
set city='Berlin'
where snum= 1001;

--modify peel's city to london and comm to 20 perc
update salespeople
set city='London', comm=0.2
where snum= 1001;

update salespeople
set comm=0.12
where snum= 1001;

--delete operation
insert into salespeople values (1050, 'John', 'London', 0.15);
select * from salespeople;

delete from salespeople
where snum = 1050;

---------------------------------------------------------------------------------------
--28-11-2025

create database bank;
use bank;

CREATE TABLE account (
account_id VARCHAR(30) NOT NULL,
name VARCHAR(30) NOT NULL,
addr VARCHAR(30) NOT NULL,
pincode int NOT NULL,
contact VARCHAR(20) NOT NULL,
acc_type VARCHAR(20) NOT NULL,
balance decimal(15,2) NOT NULL
PRIMARY KEY (account_id)
);

insert into account values ('100-201-356','Mark','abc','123456','9876543210','Savings',0);

use bank
select * from account;

--drop table account;
--drop database bank;





