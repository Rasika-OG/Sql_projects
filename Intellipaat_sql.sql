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

use retail;
CREATE TABLE customer (
cnum INT NOT NULL,
cname VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
rating int not null,
snum int NOT NULL,
PRIMARY KEY (cnum), -- in case of composite primary key primary key (cnum,cname)
FOREIGN KEY (snum) REFERENCES salespeople(snum)
);

select * from customer;

exec sp_help customer; --to get information about table, sp_help is stored procedure

INSERT INTO customer VALUES (2001, 'Hoffman', 'London',100, 1001);

INSERT INTO customer VALUES (2002, 'Giovanni', 'Rome',200, 1003);
INSERT INTO customer VALUES (2003, 'Liu', 'San Jose',200, 1002);
INSERT INTO customer VALUES (2004, 'Grass', 'Berlin',300, 1002);
INSERT INTO customer VALUES (2006, 'Clemens', 'London',100, 1001);
INSERT INTO customer VALUES (2008, 'Cisneros', 'San Jose',300, 1007);
INSERT INTO customer VALUES (2007, 'Pereira', 'Rome',100, 1004);

select count(cnum) from customer;

select city,count(cnum) from customer group by city;

--count of cust based on rating
select rating,count(cnum) from customer group by rating;

--count of cnum based on city and rating:
select city,rating,count(cnum) from customer group by city,rating;

--where used for original table columns
--having is used for aggregated data
select city,count(cnum) from customer 
group by city having count(cnum)>1;

/* order of execution:
where on raw data
group by for aggrgation
having for grouping aggregatd  data
*/

select city,count(snum) from salespeople where comm<=0.2
group by city having count(snum)=1

--order by
select city from salespeople order by city asc;

select comm from salespeople order by comm desc;

--selecting city in descending order with comm less tham 0.2 and salepeople count equal to 1
select city, count(snum) as count from salespeople where comm<=0.2
group by city
having count(snum)=1
order by city desc;

--Assignment:
create database bank;
use bank;

--age tinyint since uses less space
--exclude date column for now

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





