-- Order By

select * from hosp_employees -- ascending
order by e_name; -- order by e_name asc; also works

select * from hosp_employees 
order by e_name, join_date; -- If the e_name values are the same, then we choose salary as the second option, ordering by salary in ascending order.

select * from hosp_employees -- 
order by salary, join_date;

select * from hosp_employees -- descending
order by e_name desc;

-- LIMIT clause is used to restrict the number of rows returned by a query.
select * from hosp_employees -- ascending
order by salary desc
limit 3;

-- OFFSET 
-- LIMIT → how many rows you want to see.
-- OFFSET → how many rows to skip before starting.
select * from hosp_employees
LIMIT 1 OFFSET 2;  

select * from hosp_employees
LIMIT 1,2;  -- 1 will be offset and 2 will be limit

select * from hosp_employees
order by salary
limit 3,2;


