-- a view is essentially a saved query that acts like a virtual table. 
-- It doesn’t store data itself but dynamically pulls results from the underlying tables whenever you query it. 
-- Views are used to simplify complex queries, enforce security, and present customized subsets of data.

create view Employees_salary_view as	
select e_name, salary from hosp_employees;

select * from Employees_salary_view;

-- self join -- in self join duplicate column name doesn't so i given name for a table
CREATE VIEW reports_to AS
SELECT 
    a.e_id AS employee_id,
    a.e_name AS employee_name,
    a.role AS employee_role,
    b.e_id,
    b.e_name,
    b.role 
FROM hosp_employees a
INNER JOIN hosp_employees b  
ON a.manager_id = b.e_id;

-- same as above code 
create view reports_to as
select a.e_id AS employee_id, a.e_name AS employee_name, a.role AS employee_role, b.e_id, b.e_name as "reports to", b.role from hosp_employees a inner join hosp_employees b  -- without a and b it wont run because 
on a.manager_id = b.e_id;

drop view reports_to;

select * from reports_to;


