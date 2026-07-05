-- If we need a back up the code form the DB

set autocommit = 0; -- it allow the changes in DB but it wont allow to save 

delete from employees; 

select * from employees;

update employees
set salary =10; -- for example if we give like this evryone salary will be changed 

rollback; -- it will go back to the previous record like undo

select * from employees; 

-- set autocommit = 0; -- it allow the changes in DB but it wont allow to save 
-- if you want save the changes in DB use the below query
commit; -- we should use this only finalyze the changes 

