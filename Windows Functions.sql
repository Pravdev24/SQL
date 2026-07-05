

select *, sum(amount) over(partition by p_name order by bill_date) as "if the same name comes it will sum" from bills2;
select *, sum(amount) over(partition by p_name) as "if the same name comes it will sum" from bills2;
select *, sum(amount) over() as "sum the all the amount" from bills2;


create table D_mart(
	trans_id int primary key auto_increment,
    cus_name varchar(20),
    branch varchar(20),
    amount int
);

INSERT INTO D_mart (cus_name, branch, amount) VALUES
    ("Meera", "Velachery", 4500),
    ("Ravi", "Perumbakkam", 2200),
    ("Ananya", "Kovilambakkam", 3100),
    ("Kiran", "Velachery", 5200),
    ("Sneha", "Perumbakkam", 2750),
    ("Vikram", "Kovilambakkam", 6800),
    ("Lakshmi", "Velachery", 1200),
    ("Rahul", "Perumbakkam", 8700),
    ("Priya", "Kovilambakkam", 3100),
    ("Arjun", "Velachery", 4500),
    ("Suresh", "Perumbakkam", 2200),
    ("Divya", "Kovilambakkam", 7600),
    ("Naveen", "Velachery", 1500),
    ("Pooja", "Perumbakkam", 980),
    ("Manoj", "Kovilambakkam", 6400),
    ("Meera", "Velachery", 3200),       -- repeat customer
    ("Ravi", "Perumbakkam", 1800),      -- repeat customer
    ("Sneha", "Kovilambakkam", 4100),   -- repeat customer
    ("Rahul", "Velachery", 2300),       -- repeat customer
    ("Priya", "Perumbakkam", 5600);     -- repeat customer
    
select * from d_mart;

select *, sum(amount) over() from d_mart; -- sum all the amount
select *, sum(amount) over(partition by branch) from d_mart; -- sum by Branch use min, max, sum, avg, count
select *, sum(amount) over(partition by branch order by trans_id desc) from d_mart; -- sum by one by one

select *, row_number() over(order by amount desc) from d_mart;
select *, row_number() over(partition by branch order by amount desc) from d_mart;



create table emp_dup(
	emp_id int,
    emp_name varchar(30),
    emp_DOJ date,
    salary decimal(7,2)    
);

INSERT INTO emp_dup (emp_id, emp_name, emp_DOJ, salary) VALUES
    (101, "Meera", "2020-01-15", 45000.00),
    (101, "Meera", "2022-05-10", 47000.00),   -- duplicate emp_id with new DOJ
    (102, "Ravi", "2021-03-22", 38000.00),
    (102, "Ravi", "2023-02-18", 40000.00),    -- duplicate emp_id with new DOJ
    (103, "Ananya", "2019-07-09", 52000.00),
    (103, "Ananya", "2022-08-03", 55000.00),  -- duplicate emp_id with new DOJ
    (104, "Kiran", "2020-11-30", 41000.00),
    (104, "Kiran", "2023-10-14", 43000.00),   -- duplicate emp_id with new DOJ
    (105, "Sneha", "2021-04-25", 39000.00),
    (106, "Rahul", "2021-09-21", 60000.00);
    
select * from emp_dup;
-- we doing DeDuplication here elimating the duplicate employess showing only who joins first

with deDup as (
select *, row_number() over(partition by emp_id order by emp_DOJ) as rownums from emp_dup
)

select * from deDup
where rownums = 1;

select * from bills2;

select *, row_number() over(order by bill_date) as "Row NO",
		rank() over(order by bill_date) as "rank it will skip rank if the have same rank like 1,1 next will be 3",
		dense_rank() over(order by bill_date) as "it will show as school rank system like 1,1,2"
from bills2;

