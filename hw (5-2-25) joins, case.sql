use hrdb;

-- write a SQL query to find the first name, last name, department number, and department name for each employee.
select e.first_name, e.last_name, e.department_id, d.department_name
from employees e
join departments d
on e.department_id = d.department_id;

-- write a SQL query to find the first name, last name, department, city, and state province for each employee.
select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;


-- write a SQL query to find the first name, last name, salary, and job grade for all employees.
select first_name, last_name, salary, case
when salary > 15000 then "A"
when salary <= 15000 then "B"
end as job_grade
from employees;

 -- write a SQL query to find all those employees who work in department ID 80 or 40. Return first name, last name, department number and department name
 select e.first_name, e.last_name, e.department_id, d.department_name
 from employees e
join departments d
on e.department_id = d.department_id
where e.department_id in (40,80);
 
 

-- write a SQL query to find those employees whose first name contains the letter ‘z’. Return first name, last name, department, city, and state province.
select e.first_name, e.last_name, d.department_name, l.city, l.state_province
from employees e
join departments d
on e.department_id = d.department_id
join locations l
on d.location_id = l.location_id;

--  write a SQL query to find all departments, including those without employees. Return first name, last name, department ID, department name.
select e.first_name, e.last_name, e.department_id, d.department_name 
from employees e
right join departments d
on  e.department_id = d.department_id;


-- write a SQL query to find the employees who earn less than the employee of ID 182. Return first name, last name and salary.
select first_name, last_name, salary
from employees
where salary < 
(
select salary from employees where employee_id=182
);


-- write a SQL query to find the employees and their managers. Return the first name of the employee and manager.
SELECT 
    e.first_name AS employee_name, 
    m.first_name AS manager_name
FROM employees e
LEFT JOIN employees m ON e.manager_id = m.employee_id;


 -- write a SQL query to display the department name, city, and state province for each department.
 select d.department_name, l.city, l.state_province
 from departments d
 join locations l 
 on d.location_id = l.location_id;
 
 

-- write a SQL query to find out which employees have or do not have a department. Return first name, last name, department ID, department name.
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
left join departments d on e.department_id = d.department_id
union
select e.first_name, e.last_name, e.department_id, d.department_name from employees e
right join departments d on e.department_id = d.department_id;



 -- write a SQL query to find the employees and their managers. Those managers do not work under any manager also appear in the list. Return the first name of the employee
 -- and manager.
 select e.first_name, e.manager_id from employees e
 left join employees m 
 on e.manager_id = m.employee_id
 union
 select e.first_name, e.manager_id from employees e
 right join employees m 
 on e.manager_id = m.employee_id;
 

-- write a SQL query to find the employees who work in the same department as the employee with the last name Taylor. Return first name, last name and department ID.
select first_name, last_name, department_id from employees
where department_id in 
(
select department_id from employees
where last_name='Taylor'
);


-- write a SQL query to find all employees who joined on or after 1st January 1993 and on or before 31 August 1997. Return job title, department name, employee name, and 
-- joining date of the job.
select j.job_title, d.department_name, concat(e.first_name," ",e.last_name) as name, jh.start_date
from employees e
join departments d on e.department_id = d.department_id
join jobs j on e.job_id = j.job_id
join job_history jh on e.employee_id = jh.employee_id
where jh.start_date>='1993-01-01' and jh.start_date<= '1997-08-31';


-- write a SQL query to calculate the difference between the maximum salary of the job and the employee's salary. Return job title, employee name, and salary difference.
select j.job_title, concat(e.first_name," ",e.last_name), (j.max_salary - e.salary) as diff
from employees e
join jobs j on e.job_id = j.job_id;


-- write a SQL query to calculate the average salary, the number of employees receiving commissions in that department. Return department name, average salary and number 
-- of employees.
 select d.department_name, avg(e.salary), sum(e.commission_pct) from employees e
 join departments d on e.department_id = d.department_id
 group by d.department_name;
 