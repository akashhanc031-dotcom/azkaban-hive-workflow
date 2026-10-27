
SELECT department,
       COUNT(*) AS employee_count,
       AVG(salary) AS average_salary
FROM company_db.employees
GROUP BY department;
