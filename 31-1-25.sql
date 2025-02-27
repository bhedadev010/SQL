select *  from employees
where last_name = 'Baer';

select first_name, department_id
from employees
where department_id > 70;

select first_name, department_id
from employees
where department_id >= 50 and department_id<=80;

select * from employees;

select * from employees
where department_id >=50 and salary >5000;


select concat(first_name, ' ', last_name) as full_name
from employees
limit 5 offset 4;

select first_name,salary,job_id
from employees
where salary >10000 or job_id = 'SA_REP';

select first_name,salary,job_id
from employees
where salary >5000 and  not job_id = 'SA_REP';

select first_name,salary,job_id
from employees
where not job_id = 'SA_REP';

select distinct(job_id)
from employees;


select distinct(job_id) as Unique_job
from employees;

select first_name, job_id
from employees
where job_id in ('AD_PRES','AD_VP');

select first_name, job_id
from employees
where job_id not  in ('AD_PRES','AD_VP');


select first_name, salary, job_id
from employees
where salary between 5000 and 10000;

select max(salary)
from employees;
select min(salary)
from employees;

select avg(salary)
from employees;


select count(*) from employees;

select first_name,salary, job_id
from employees
order by job_id ASC;

select first_name,salary, job_id
from employees
order by job_id DESC, first_name DESC;