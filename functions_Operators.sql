create table hosp_employees(
	e_id int primary key auto_increment,
    e_name varchar(20) not null,
    age int not null,
    salary decimal(10,2)
);
drop table hosp_employees;
describe hosp_employees;
select * from hosp_employees;
insert into hosp_employees (e_name, age, salary) values
	("ab", 22, 100000),
    ("bc", 23, 80000),
    ("cd", 25, 75000),
    ("ef", 27, 50000),
    ("gh", 32, 67000);
    
select count(e_name) as countofname from hosp_employees;

select count(e_name) as countofname from hosp_employees
where age >25;

select max(salary) as highsalary from hosp_employees;

select max(salary) as highsalary from hosp_employees
where age > 25;

select min(age) as youngest from hosp_employees;

select sum(salary) as total_salary_for_employees from hosp_employees;

select avg(age) as average_age_for_employees from hosp_employees;
    
select concat(e_name, "_", age) as username from hosp_employees;

-- Operator	Description	Example
-- =	Equal to	
-- >	Greater than	
-- <	Less than	
-- >=	Greater than or equal to	
-- <=	Less than or equal to	
-- <>	Not equal to

select * from hosp_employees
where age = 27;

select * from hosp_employees
where age != 27; -- where not age = 27;

select * from hosp_employees
where age between 20 and 25;

select * from hosp_employees
where age in (23, 32, 22); -- gives the output if the age criteria met


select * from hosp_employees
where age > 25 and salary < 100000;

select * from hosp_employees
where age > 27 or salary > 50000;

