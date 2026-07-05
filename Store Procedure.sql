-- Store Procedure
-- MySQL → Yes, delimiter change is required when defining stored procedures.
-- SQL Server, Oracle, PostgreSQL → No delimiter change needed.
select * from hosp_employees;

delimiter //
create procedure get_employees_by_id(in id int, in ename varchar(20))
begin
	select * from hosp_employees
    where e_id = id or e_name = ename;
end //
delimiter ;

call get_employees_by_id(3, "Meera");

drop procedure get_employees_by_id;
