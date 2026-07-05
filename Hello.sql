show databases;
create database sql_class;
use sql_class;

-- alter database read only =0;
alter table store
rename column id_emp to emp_id;

Create table store (
	emp_id int,
    emp_name varchar(30),
    emp_DOJ date,
    salary decimal(7, 2)
);

select * from store;

rename table emp to store;

select emp_id from store;

drop table store;

alter table store
modify column phone_no varchar(12);

alter table store
drop phone_nok;
 
alter table store
modify column emp_id int
first;




