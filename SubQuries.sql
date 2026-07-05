-- select * from employees
-- where salary > (select avg(salary) from employees);

SELECT 
    *
FROM
    employees
WHERE
    salary > (SELECT 
            AVG(salary)
        FROM
            employees);
     
     
SELECT * FROM hosp_employees;
-- when you know ur team lead e_id and name but you dont who is reporting to 
SELECT * FROM hosp_employees
WHERE e_id = (SELECT manager_id FROM hosp_employees
        WHERE e_name = 'Priya');
        
-- when you know ur team lead e_id and name but you dont who all reporting to your team lead
SELECT * FROM hosp_employees
WHERE manager_id = (SELECT e_id FROM hosp_employees
        WHERE e_name = 'Priya');
        
        
-- who all are reproting to suresh and priya
select * from hosp_employees
where manager_id in (select e_id from hosp_employees
	where e_name = "Suresh" or e_name = "Priya");
    
-- if who all are having the morethan 75K salary return their manager name
select e_name from hosp_employees
where e_id in (select manager_id from hosp_employees
	where salary > 75000);