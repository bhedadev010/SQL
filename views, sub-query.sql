use tops;

-- create a view for those salespeople who belong to the city of New York.
create view new_york as
select * from sales_man
where city='New York'; 

select * from new_york;

-- create a view for all salespersons. Return salesperson ID, name, and city.
create view wow as 
select salesman_id, name, city from sales_man;

select * from wow;

-- create a view for those salespeople who belong to the city of New York.
create view x as
select * from sales_man
where  city not in ("New York");

select * from x;

-- create a view that counts the number of customers in each grade.
create or replace view ok as 
select count(customer_id), grade from customer
group by grade;

select * from ok;

-- create a view to count the number of unique customers, compute the average and the total purchase amount of customer orders by each date.
create or replace view woww as
select ord_date ,count(distinct(customer_id)), avg(purch_amt), sum(purch_amt) from orders
group by ord_date;

select * from woww;

-- create a view to get the salesperson and customer by name. Return order name, purchase amount, salesperson ID, name, customer name.
create or replace view qw as
select o.ord_no, o.purch_amt, o.salesman_id, c.cust_name as customer_name, s.name as salesman_name from orders o
join customer c on c.salesman_id = o.salesman_id
join sales_man s on s.salesman_id = o.salesman_id;

select * from qw;

-- create a view to find the salesperson who handles a customer who makes the highest order of the day. Return order date, salesperson ID, name. 
create or replace view we as
select o.purch_amt, o.ord_date, s.salesman_id, s.name from salesman s
join orders o on o.salesman_id = s.salesman_id
where o.purch_amt=(
select max(purch_amt)
from orders o1
where o1.ord_date=o.ord_date);
select * from we;

-- create a view to find the salesperson who deals with the customer with the highest order at least three times per day. Return salesperson ID and name. 

create view i as
select distinct salesman_id, name
from we a
where 3<=(select count(*)
from we b
where a.salesman_id = b.salesman_id);
select * from i;