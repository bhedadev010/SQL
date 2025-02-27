create database TOPS;
use tops;

create table customer(
customer_id int,
cust_name varchar(50),
city varchar(30),
grade int,
salesman_id int
);

create table Orders(
ord_no int,
purch_amt float,
ord_date datetime,
customer_id int,
salesman_id int
);

create table Sales_man(
salesman_id int,
name varchar(60),
city varchar(50),
commission float
);

CREATE TABLE employee_details (
    EMP_IDNO INT,
    EMP_FNAME VARCHAR(50),
    EMP_LNAME VARCHAR(50),
    EMP_DEPT INT
);
