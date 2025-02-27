use hrdb;

create view sa_rep as
select first_name,salary
from employees
where job_id = 'SA_REP';

select * from sa_rep;

create or replace view sa_rep as
select first_name,job_id,salary
from employees
where job_id = 'SA_REP';


select * from sa_rep;

drop view sa_rep;


use ds;
create table teachers(
id int primary key,
name varchar(25),
age int);

insert into teachers
values 
(1,'Prem', 25),
(2,'Meghana', 43),
(3, 'rose', 36),
(4,'Mishika',29),
(5,'Reshma',45);

create table students(
id int,
name varchar(25),
age int);

insert into  students
values
(1,'Harry',23),
(2,'Josh',42),
(3,'Jenny', 32),
(4, "Denish", 23),
(5,'Brinda',40);
insert into students
values
(6,'Ram',43);


select * from Teachers
where age = any(select age from students);

select * from Teachers
where age > any(select age from students);
select * from Teachers
where age > all(select age from students);


use hrdb;

select *,
case
when salary <=7000 then 'Low Salary'
when salary <=17000 and salary>7000 then 'Average Salary'
when salary >17000 then 'high salary'
end as 'salary_status'
from employees;

select avg(salary),department_id
from employees
group by department_id
having avg(salary)>10000;

select * from job_history;


select first_name, salary from employees e
where exists(
select * from job_history jh
where e.employee_id=jh.employee_id);

select first_name, salary from employees e
where not exists(
select * from job_history jh
where e.employee_id=jh.employee_id);



select e.first_name, e.job_id, e.department_id, d.department_name
from employees e
join departments d
on e.department_id  = d.department_id;

select e.first_name, e.job_id, e.department_id, d.department_name
from employees e
left join departments d
on e.department_id  = d.department_id;

select e.first_name, e.job_id, e.department_id, d.department_name
from employees e
right join departments d
on e.department_id  = d.department_id;

select e.first_name, e.job_id, e.department_id, d.department_name
from employees e
outer join departments d
on e.department_id  = d.department_id;