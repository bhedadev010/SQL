use hrdb;
select sum(salary), job_id
from employees
group by job_id;


select employee_id, first_name, salary,job_id,
row_number() over(partition by job_id order by salary desc) 
as row_num
from employees;


CREATE TABLE sales_data (
    sale_id INT PRIMARY KEY,
    salesman VARCHAR(50),
    region VARCHAR(50),
    sale_amount INT,
    sale_date DATE
);

INSERT INTO sales_data (sale_id, salesman, region, sale_amount, sale_date) VALUES
-- 1, 'Alice', 'North', 500, '2024-01-10'),
-- (2, 'Bob', 'North', 700, '2024-01-15'),
-- (3, 'Charlie', 'North', 800, '2024-01-20'),
-- (4, 'David', 'South', 400, '2024-01-08'),
-- (5, 'Eve', 'South', 600, '2024-01-12'),
-- (6, 'Frank', 'South', 750, '2024-01-18'),
-- (7, 'Grace', 'East', 900, '2024-01-05'),
-- (8, 'Hank', 'East', 650, '2024-01-14'),
-- (9, 'Ivy', 'West', 550, '2024-01-09'),
-- (10, 'Jack', 'West', 620, '2024-01-11');

(11,'Rani',"West",550,'2024-03-05'),
(12,'Raj',"East",650,'2025-01-01');


select * from sales_data;

select sale_id, salesman, region,sale_amount,
row_number() over(partition by region order by sale_amount) as r
from sales_data;

select sale_id, salesman, region,sale_amount,
rank() over(partition by region order by sale_amount ) as r
from sales_data;


select first_name, salary, job_id,
rank() over(partition by job_id order by salary) as rnk_no
from employees;

select sale_id, salesman, region,sale_amount,
dense_rank() over(partition by region order by sale_amount ) as r
from sales_data;


select sale_id,salesman,region,sale_amount,
lead(sale_amount) over (partition by region order by sale_amount) as nxt_sale
from sales_data;

select sale_id,salesman,region,sale_amount,
lag(sale_amount) over (partition by region order by sale_amount) as nxt_sale
from sales_data;

select sale_id,salesman,region,sale_amount,
first_value(sale_amount) over (partition by region order by sale_amount desc) as highest_Sal
from sales_data;

select sale_id,salesman,region,sale_amount,
last_value(sale_amount) over (partition by region 
order by sale_amount desc
range between unbounded preceding and unbounded following) as highest_Sal
from sales_data;

select employee_id, first_name, salary, job_id,
lead(salary) over(order by salary desc) as n_s
from employees;

select count(distinct (job_id)) from employees;

select first_name, salary, department_id,
first_value(salary) over(partition by department_id order by salary desc) as h_s
from employees;

select first_name, salary, department_id,
last_value(salary) over(partition by department_id 
order by salary desc
range between unbounded preceding and unbounded following
) as h_s
from employees;