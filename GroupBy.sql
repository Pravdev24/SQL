CREATE TABLE bills2 (
    id INT PRIMARY KEY AUTO_INCREMENT,
    p_name VARCHAR(20),
    amount INT,
    bill_date DATE
);

INSERT INTO bills2 (p_name, amount, bill_date) VALUES
    ("Meera", 8450, "2024-01-15"),
    ("Ravi", 1200, "2024-01-15"),
    ("Ananya", 9999, "2024-07-09"),
    ("Meera", 3200, "2024-07-09"),   -- repeat customer
    ("Rahul", 8700, "2025-03-05"),
    ("Priya", 3100, "2025-09-21"),
    ("Ananya", 2200, "2025-11-05"),  -- repeat customer
    ("Divya", 7600, "2025-12-19"),
    ("Ravi", 1800, "2026-01-07"),    -- repeat customer
    ("Pooja", 980, "2026-02-15"),
    ("Manoj", 6400, "2026-02-15"),
    ("Sneha", 4100, "2026-02-15");   -- repeat customer
    
Select * from bills2;
drop table bills2;


select bill_date, count(amount) from bills2
group by bill_date;

select count(amount), p_name from bills2 -- Overall, how many times have the same customers purchased from the store
group by p_name;

select sum(amount), p_name from bills2 -- who all are purchased morethan 10K 
group by p_name
having sum(amount) > 10000; -- we using having instead where, group by query doen't support where

-- HAVING clause only works in combination with GROUP BY. But the key difference is:

-- WHERE filters rows before grouping.

-- HAVING filters groups after grouping.

SELECT P_name, COUNT(amount) 
FROM bills2
WHERE p_name <> 'Ananya'
GROUP BY p_name;