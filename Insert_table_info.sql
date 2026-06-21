use sql_class;

-- select * from store;
-- rename table store to employees;

select * from employees;

insert into employees -- adding single value
values (00, "sample", "2026-06-21", 75000.50, "1234567890");

insert into employees values -- adding multiple values
	(01, "Praveen", "2026-06-21", 75000.50, "1234567890"),
	(02, "sudhar", "2026-06-22", 85000.50, "1234567891"),
	(03, "raj", "2026-06-23", 45000.50, "1234567892"),
	(04, "reshma", "2026-06-24", 65000.50, "1234567893"),
	(05, "kavi", "2026-06-25", 95000.50, "1234567894");

delete from employees -- delete single values
where emp_id = 01;

delete from employees -- delete  multiple values
where emp_id in (01,02);


