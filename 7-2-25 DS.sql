-- write a SQL query to find all employees who joined on or after 1st January 1993 
-- and on or before 31 August 1997.
--  Return job title, department name, employee name, and joining date of the job.

use hrdb;

select * from jobs;
select job_title, department_name, concat(first_name, " " , last_name) as employee_name, start_date
from job_history 
join jobs using(job_id)
join departments using(department_id)
join employees using(employee_id)
where start_date>= '1993-01-01' and start_date<='1197-08-31';

select j.job_title, d.department_name, concat(e.first_name, " " , e.last_name) as employee_name, jh.start_date
from job_history jh
join jobs j on j.job_id = jh.job_id
join departments d  on d.department_id=jh.department_id
join employees e on e.employee_id = jh.employee_id
where jh.start_date>= '1993-01-01' and jh.start_date<='1997-08-31';

-- create a view to count the number of unique customers, compute the average  
-- and the total purchase amount of customer orders by each date.

create or replace view totalforday as 
select ord_date, count(distinct customer_id), avg(purch_amt), sum(purch_amt)
from orders
group by ord_date;

select * from totalforday;

--  create a view to get the salesperson and customer by name. 
--  Return order name, purchase amount, salesperson ID, name, customer name.

create or replace view nameorders as 
select ord_no, purch_amt, a.salesman_id, name, cust_name
from  orders a, customer b, salesman c
where a.customer_id = b.customer_id
and a.salesman_id = c.salesman_id;

 select * from nameorders;
CREATE TABLE Salesman (
    salesman_id INT,
    name VARCHAR(100),
    city VARCHAR(100) ,
    commission Int
);

INSERT INTO Salesman (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);


-- create a view to find the salesperson who handles a customer who makes the 
-- highest order of the day. Return order date, salesperson ID, name.

create view e as
select b.ord_date, a.salesman_id, a.name
from salesman a, orders b
where a.salesman_id=b.salesman_id
and b.purch_amt = (
select max(purch_amt)
from orders c
where c.ord_date=b.ord_date);
select * from e;

create or replace view we as
select o.purch_amt, o.ord_date, s.salesman_id, s.name from salesman s
join orders o on o.salesman_id = s.salesman_id
where o.purch_amt=(
select max(purch_amt)
from orders o1
where o1.ord_date=o.ord_date);
select * from we;

select * from we;


create view i as
select distinct salesman_id, name
from we a
where 3<=(select count(*)
from we b
where a.salesman_id = b.salesman_id);
select * from i;