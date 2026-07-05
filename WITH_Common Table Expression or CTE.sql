How WITH Works
Temporary view: The result of the subquery inside WITH exists only for the duration of the main query.

Readable structure: Instead of nesting subqueries, you can name them and reuse them.

Scope: The CTE is valid only for the query it belongs to — it’s not stored permanently in the database.

✅ Syntax
sql
WITH cte_name (column1, column2, ...) AS (
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition
)
SELECT *
FROM cte_name;
cte_name → name of the temporary result set.

AS (...) → defines the subquery.

Main query → references the CTE like a table.

📊 Examples
1. Above-average salary
sql
WITH AvgSalaryCTE AS (
    SELECT AVG(salary) AS avg_salary
    FROM Employees
)
SELECT EmployeeID, Name, Salary
FROM Employees
WHERE Salary > (SELECT avg_salary FROM AvgSalaryCTE);
👉 Finds employees earning more than the average salary.

2. Branch totals in your D_mart table
sql
WITH BranchTotals AS (
    SELECT branch, SUM(amount) AS total_sales
    FROM D_mart
    GROUP BY branch
)
SELECT d.cus_name, d.branch, d.amount, b.total_sales
FROM D_mart d
JOIN BranchTotals b ON d.branch = b.branch;
👉 Shows each customer’s purchase along with their branch’s total sales.

3. Recursive CTE (advanced)
sql
WITH RECURSIVE Numbers AS (
    SELECT 1 AS n
    UNION ALL
    SELECT n + 1 FROM Numbers WHERE n < 10
)
SELECT * FROM Numbers;