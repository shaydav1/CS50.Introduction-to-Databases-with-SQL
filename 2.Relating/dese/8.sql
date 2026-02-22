/*
A parent wants to send their child to a district with many other students.
In 8.sql, write a SQL query to display the names of all school districts and the number of pupils enrolled in each.
*/
SELECT name, sum(pupils)
FROM districts d join expenditures e on d.id = e.district_id
GROUP BY name;
