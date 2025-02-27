create database students;

create table if not exists info
(
name char(40),
id int primary key,
info varchar(50)
);

insert into info values ("dev",12,"excellent");

show databases;

use students;

select * from info;

select name from info;

insert into info values ("wow",10,"bad");

select * from info where name="wow";

