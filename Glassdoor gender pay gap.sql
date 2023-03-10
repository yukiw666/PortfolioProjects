 --add salary column
 UPDATE ['Glassdoor Gender Pay Gap']
 SET Salary=BasePay+Bonus
 
 --Is there pay disparities beteen the same job for different gender?
 SELECT JobTitle, Gender, AVG(Salary) AS avg_salary
 FROM ['Glassdoor Gender Pay Gap'] 
 GROUP BY JobTitle, gender
 ORDER BY JobTitle

 --what is the gender breakdown in each department?
 SELECT Dept, Gender, COUNT(*) AS NumEmployees,
COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (PARTITION BY Dept) AS PercentEmployees
FROM ['Glassdoor Gender Pay Gap']
GROUP BY Dept, Gender

--if there any age or gender biases in salary distribution?
SELECT Gender, Age, COUNT(*) AS NumEmployees,
AVG(Salary) AS AvgSalary,
MIN(Salary) AS MinSalary,
MAX(Salary) AS MaxSalary
FROM ['Glassdoor Gender Pay Gap']
GROUP BY Gender, Age;








