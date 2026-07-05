-- (INNER) JOIN: Returns only rows that have matching values in both tables
-- LEFT (OUTER) JOIN: Returns all rows from the left table, and only the matched rows from the right table
-- RIGHT (OUTER) JOIN: Returns all rows from the right table, and only the matched rows from the left table
-- FULL (OUTER) JOIN: Returns all rows when there is a match in either the left or right table

select * from customers;

select * from customers inner join transactions
on customers.cus_id = transactions.customer_id;

select * from customers left join transactions
on customers.cus_id = transactions.customer_id;

select * from customers right join transactions
on customers.cus_id = transactions.customer_id;


-- Self table join

CREATE TABLE hosp_employees (
    e_id INT AUTO_INCREMENT PRIMARY KEY,   -- unique employee ID
    e_name VARCHAR(100) NOT NULL,          -- employee name
    age INT,                               -- age in years
    salary DECIMAL(10,2),                  -- salary with 2 decimal places
    join_date DATE,                        -- date of joining
    role VARCHAR(50),                      -- job role
    manager_id INT,                        -- references another employee
    FOREIGN KEY (manager_id) REFERENCES hosp_employees(e_id)
);

INSERT INTO hosp_employees (e_name, age, salary, join_date, role, manager_id) VALUES
	("Arjun SM", 22, 100000, "2024-02-23", "Senior Manager", null),   -- top-level
	("Suresh Reddy", 28, 56000, "2023-03-22", "Manager", 1),          -- reports to Arjun
	("Priya M", 23, 80000, "2023-11-13", "Team Lead", 2),             -- reports to Suresh
	("Rahul Iyer", 25, 75000, "2022-02-03", "Doctor", 3),              -- reports to Priya
	("Sneha Kapoor", 27, 50000, "2024-08-04", "Nurse", 3),             -- reports to Priya
	("Meera Nair", 29, 72000, "2023-05-19", "Pharmacist", 3),          -- reports to Priya
	("Kiran Patel", 26, 64000, "2022-09-07", "Lab Assistant", 3),      -- reports to Priya
	("Divya Menon", 31, 91000, "2024-12-15", "Administrator", 3),      -- reports to Priya
	("Vikram Rao", 32, 67000, "2025-01-11", "Technician", 3),          -- reports to Priya
	("Pooja Singh", 24, 47000, "2025-02-10", "Receptionist", 3);       -- reports to Priya
    

SELECT * FROM hosp_employees a INNER JOIN hosp_employees b 
ON a.manager_id = b.e_id;

SELECT a.e_name AS EmployeeName,
       b.e_name AS ManagerName,
       a.age, a.salary
FROM hosp_employees a INNER JOIN hosp_employees b
ON a.manager_id = b.e_id;

SELECT * FROM hosp_employees a left JOIN hosp_employees b 
ON a.manager_id = b.e_id;

SELECT * FROM hosp_employees a right JOIN hosp_employees b 
ON a.manager_id = b.e_id;







