
select * from orders;

#From the following table, write a SQL query to locate the details of customers with grade values above 100. Return customer_id, cust_name, city, grade, and salesman_id.
select * from customer 
where grade>100;

#From the following table, write a SQL query to find all the customers in ‘New York’ city who have a grade value above 100. 
select * from customer
where city='New York' and grade>100;

#From the following table, write a SQL query to find customers who are either from the city 'New York' or who do not have a grade greater than 100. 
select * from customer
where not grade>100 or city='New York';

#From the following table, write a SQL query to find details of all orders excluding those with ord_date equal to '2012-09-10' and salesman_id higher than 5005 or 
#purch_amt greater than 1000.
select * from orders
where (ord_date='2012-09-10' and salesman_id > 5005) or purch_amt > 1000;

#From the following table, write a SQL query to find the details of those salespeople whose commissions range from 0.10 to0.12. 
select * from sales_man
where commission between 0.10 and 0.12;

#From the following table, write a SQL query to find details of all orders with a purchase amount less than 200 or exclude orders with an order date greater than or 
#equal to '2012-02-10' and a customer ID less than 3009.
select * from orders
where purch_amt <= 200 or not (ord_date >= '2012-02-10' and customer_id < 3009);

#From the following table, write a SQL query to find all orders that meet the following conditions. Exclude combinations of order date equal to '2012-08-17' or customer 
#ID greater than 3005 and purchase amount less than 1000.
select * from orders
where not (ord_date = '2012-08-17' or (customer_id > 3005 and purch_amt < 1000));

#Write a SQL query that displays order number, purchase amount, and the achieved and unachieved percentage (%) for those orders that exceed 50% of the target value of 6000.
select ord_no, 
       purch_amt, 
       (purch_amt / 6000) * 100 as achieved_percentage, 
       (100 - ((purch_amt / 6000) * 100)) as unachieved_percentage
from Orders
where purch_amt > (0.5 * 6000);

#From the following table, write a SQL query to find the details of all employees whose last name is ‘Dosni’ or ‘Mardy’. Return emp_idno, emp_fname, emp_lname, and emp_dept.
select * from employee_details
where EMP_LNAME in ('Dosni','Mardy');

#rom the following table, write a SQL query to find the employees who work at depart 47 or 63. Return emp_idno, emp_fname, emp_lname, and emp_dept.
select * from employee_details
where EMP_DEPT in (47,63)
