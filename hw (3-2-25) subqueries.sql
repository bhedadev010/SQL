use hrdb;

-- write a SQL query to find those employees who do not work in the departments where managers’ IDs are between 100 and 200 (Begin and end values are included.). 
-- Return all the fields of the employeess
select * from employees
where manager_id between 100 and 200;


-- write a SQL query to find those employees who get second-highest salary. Return all the fields of the employees.
select * from employees
where salary = (
    SELECT MAX(salary)   
    FROM employees  
    WHERE salary < (SELECT MAX(salary) FROM employees)
);

-- write a SQL query to find those employees who work in the same department as ‘Clara’. Exclude all those records where first name is ‘Clara’. Return first name, 
-- last name and hire date.
select first_name, last_name,hire_date
from employees
where department_id = 
(
select department_id from employees
where first_name = 'Clara'
) 
and not( first_name = 'Clara' );

-- write a SQL query to find those employees who work in a department where the employee’s first name contains the letter 'T'. Return employee ID, first name and last name.
select employee_id, first_name, last_name
from employees
where department_id in
(
select department_id from employees
where first_name like '%T%'
);


-- write a SQL query to find those employees who earn more than the average salary and work in the same department as an employee whose first name contains the letter 
-- 'J'. Return employee ID, first name and salary
select employee_id, first_name, salary 
from employees
where salary >
(
select avg(salary) from employees
)
and department_id in
(
select department_id from employees
where first_name like '%J%'
);


-- write a SQL query to find those employees whose department is located at ‘Toronto’. Return first name, last name, employee ID, job ID.
select first_name, last_name, employee_id, job_id
from employees
where department_id = 
(
select department_id from departments
where location_id = 
(
select location_id from locations
where city = 'Toronto'
)
);

-- write a SQL query to find those employees whose salary is lower than that of employees whose job title is ‘MK_MAN’. Return employee ID, first name, last name, job ID.
select employee_id, first_name, last_name, job_id
from employees
where salary < 
(
select min(salary) from employees
where job_id = 'MK_MAN'
);


-- write a SQL query to find those employees whose salary is lower than that of employees whose job title is "MK_MAN". Exclude employees of Job title ‘MK_MAN’. Return 
-- employee ID, first name, last name, job ID.
select employee_id, first_name, last_name, job_id
from employees
where salary < 
(
select min(salary) from employees
where job_id = 'MK_MAN'
) and not(job_id = 'MK_MAN');


-- write a SQL query to find those employees whose salary exceeds the salary of all those employees whose job title is "PU_MAN". Exclude job title ‘PU_MAN’. Return 
-- employee ID, first name, last name, job ID.
SELECT employee_id,first_name, last_name, job_id
from employees
where salary > 
(
select max(salary) from employees where job_id = 'MK_MAN'
);


-- write a SQL query to find those employees whose salaries are higher than the average for all departments. Return employee ID, first name, last name, job ID.
select employee_id, first_name, last_name, job_id
from employees
where salary > all
(
select avg(salary) from employees
group by department_id
);


-- write a SQL query to check whether there are any employees with salaries exceeding 3700. Return first name, last name and department ID.
select first_name, last_name, department_id
from employees
where salary > 3700;


-- write a SQL query to calculate total salary of the departments where at least one employee works. Return department ID, total salary.
select department_id, sum(salary) as total_salary
from employees
where department_id is not null
group by department_id;


-- Write a query to display the employee id, name ( first name and last name ) and the job id column with a modified title SALESMAN for those employees whose job title 
-- is ST_MAN and DEVELOPER for whose job title is IT_PROG.
select employee_id, concat(first_name,last_name) as name, 
		CASE 
		WHEN job_id = 'ST_MAN' THEN 'SALESMAN'
		WHEN job_id = 'IT_PROG' THEN 'DEVELOPER'
		ELSE job_id 
       END AS modified_job_id
from employees;

-- Write a query to display the employee id, name ( first name and last name ), salary and the SalaryStatus column with a title HIGH and LOW respectively for those 
-- employees whose salary is more than and less than the average salary of all employees.
SELECT employee_id, 
       CONCAT(first_name, ' ', last_name) AS name, 
       salary, 
       CASE 
           WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'HIGH'
           WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'LOW'
           ELSE 'AVERAGE'
       END AS SalaryStatus
FROM employees;


-- Write a query to display the employee id, name ( first name and last name ), SalaryDrawn, AvgCompare (salary - the average salary of all employees) and the SalaryStatus 
-- column with a title HIGH and LOW respectively for those employees whose salary is more than and less than the average salary of all employees.

SELECT employee_id, 
       CONCAT(first_name, ' ', last_name) AS full_name, 
       salary, 
       CASE 
           WHEN salary > (SELECT AVG(salary) FROM employees) THEN 'HIGH'
           WHEN salary < (SELECT AVG(salary) FROM employees) THEN 'LOW'
           ELSE 'AVERAGE'
       END AS status
FROM employees;
