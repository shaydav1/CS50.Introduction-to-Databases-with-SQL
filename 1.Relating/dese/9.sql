/*Another parent wants to send their child to a district with few other students.
In 9.sql, write a SQL query to find the name (or names) of the school district(s) with the single least number of pupils. Report only the name(s).*/
SELECT name
FROM districts d join expenditures e on d.id=e.district_id
ORDER BY pupils
LIMIT 1;
