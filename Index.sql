-- indexes are special data structures that improve the speed of data retrieval operations on a table. 
-- Think of them like the index in a book — instead of scanning every page to find a topic, 
-- you jump straight to the right page using the index.

-- primary key, unique and foreign key these sql automatically creates the indexes for better search
-- This is because indexes are essential for enforcing those constraints efficiently.
-- Sql uses BTREE index type
show indexes from hosp_employees;

-- "If we create an index for e_name, it will build a separate B-tree structure. 
-- Since this requires extra storage and maintenance, 
-- we should only create it when we frequently query or perform tasks on e_name.”
create index name_idx -- index sorts/organizes values behind the table to give speed, but it comes with storage and maintenance costs.
on hosp_employees(e_name);

select * from hosp_employees -- it took so fast we cannot see this we dont have lakhs of data
where e_name = "Rahul";

alter table hosp_employees
drop index name_idx;

