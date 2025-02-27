use hrdb;

select *  from employees;

select job_id, max(salary)
from employees
group by job_id;

select * from countries;

select region_id, count(country_name)
from countries
group by region_id;



create database Practice;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(100) NOT NULL,
    city VARCHAR(100) NOT NULL,
    grade INT,
    salesman_id INT NOT NULL
);

INSERT INTO Customer (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003),
(3003, 'Jozy Altidor', 'Moscow', 200, 5007),
(3001, 'Brad Guzan', 'London', NULL, 5005);

CREATE TABLE Orders (
    ord_no INT PRIMARY KEY,
    purch_amt Int,
    ord_date DATE,
    customer_id INT,
    salesman_id INT 
);

INSERT INTO Orders (ord_no, purch_amt, ord_date, customer_id, salesman_id) VALUES
(70001, 150.50, '2012-10-05', 3005, 5002),
(70009, 270.65, '2012-09-10', 3001, 5005),
(70002, 65.26, '2012-10-05', 3002, 5001),
(70004, 110.50, '2012-08-17', 3009, 5003),
(70007, 948.50, '2012-09-10', 3005, 5002),
(70005, 2400.60, '2012-07-27', 3007, 5001),
(70008, 5760.00, '2012-09-10', 3002, 5001),
(70010, 1983.43, '2012-10-10', 3004, 5006),
(70003, 2480.40, '2012-10-10', 3009, 5003),
(70012, 250.45, '2012-06-27', 3008, 5002),
(70011, 75.29, '2012-08-17', 3003, 5007),
(70013, 3045.60, '2012-04-25', 3002, 5001);

-- write a SQL query to find the highest grade of the customers in each city.
--  Return city, maximum grade

use hrdb;
select city, max(grade)
from Customer
group by city;

select * from employees
where first_name like 'J__n';
select * from employees
where first_name like 'J%';

select * from countries;

select * from countries
where country_name LIKE 'A%';


select col1, col2 from table_1 
union
select col3,col4 from table_2;



--  write a SQL query to find those employees who receive a higher salary 
--  than  the employee with ID 163. Return first name, last name

select * from employees;

select first_name, last_name,salary
from employees
where salary > 
(select salary 
from employees
where employee_id = 163);

select salary from employees
where employee_id=163;


-- find out which employees have the same designation as the employee 
-- whose ID is 169. 
-- Return first name, last name, department ID and job ID.

select first_name,last_name,department_id, job_id
from employees
where job_id = 
(select job_id from employees
where employee_id = 169);


--  find those employees whose salary matches the lowest salary
--  of any of the departments. 
--  Return first name, last name and department ID.

select first_name, last_name, department_id, salary
from employees
where salary in (
select min(salary) from employees
group by department_id);

-- Write a SQL query to find all those employees who work
--  in the Finance department.
--  Return department ID, name (first), job ID and department name.
select * from departments;

select e.department_id, e.first_name, e.job_id, d.department_name
from employees e, departments d
where e.department_id = d.department_id
and d.department_name = 'Finance';