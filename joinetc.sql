use hrdb;

#1. Display all information in the tables EMP and DEPT. 
select * from employees e
left join
departments d on e.department_id = d.department_id
union
select * from employees e
right join
departments d on e.department_id = d.department_id;

#2. Display only the hire date and employee name for each employee. 
select j.start_date, concat(e.first_Name,' ',e.last_name) as name from job_history j
left join employees e on e.employee_id = j.employee_id;

#3. Display the ename concatenated with the job ID, separated by a comma and space, and
-- name the column Employee and Title
select concat(first_name,last_name,', ',job_id) as employee_and_title from employees;

#4. Display the hire date, name and department number for all clerks. 
select hire_date, first_name, department_id from employees
where job_id like '___CLERK';

#5. Create a query to display all the data from the EMP table. Separate each column by a
-- comma. Name the column THE OUTPUT 
select concat(employee_id,',',first_name,','`)