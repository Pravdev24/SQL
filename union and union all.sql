
create table bills(
	id int primary key auto_increment,
    p_name varchar(20),
    amount int
);

insert into bills (p_name, amount) values
	("Meera", 8450),
	("Ravi", 1200),
	("Ananya", 9999),
	("Kiran", 4300),
	("Sneha", 2750),
	("Vikram", 6800),
	("Lakshmi", 520),
	("Rahul", 8700),
	("Priya", 3100),
	("Arjun", 4500),
	("Suresh", 2200),
	("Divya", 7600),
	("Naveen", 1500),
	("Pooja", 980),
	("Manoj", 6400);
select * from bills;

create table expenses (
	id int primary key auto_increment,
    expenses varchar(50),
    amount int
);
alter table expenses
modify expenses varchar(50);
drop table expenses; 
INSERT INTO expenses (expenses, amount) VALUES
	("Staff Salaries", 95500),
	("Medical Supplies", 7200),
	("Equipment Maintenance", 4300),
	("Utilities", 2100),
	("Cleaning Services", 1800),
	("Food Services", 3500),
	("Pharmacy Stock", 8800),
	("Security", 2600),
	("Administrative Costs", 4000),
	("Training & Education", 2900);
    
select * from expenses -- only work number of column should be same
union
select * from bills;

select e_name from hosp_employees -- this way will work if the table have diff no of columns
union -- union only show non duplicate values but union all does
select expenses from expenses;

select e_name from hosp_employees -- this way will work if the table have diff no of columns
union all -- shows with duplicate values
select expenses from expenses;