/*In 13.sql, write a SQL query to answer a question you have about the data! The query should:
Involve at least one JOIN or subquery*/
SELECT d.name, s.name
FROM districts d join schools s on d.id=s.district_id
WHERE district_id = (SELECT district_id FROM graduation_rates WHERE graduated = 100);
