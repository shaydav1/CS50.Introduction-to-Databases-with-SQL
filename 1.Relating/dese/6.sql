/*DESE wants to assess which schools achieved a 100% graduation rate.
In 6.sql, write a SQL query to find the names of schools (public or charter!) that reported a 100% graduation rate.*/
SELECT name
FROM schools s join graduation_rates gr on s.id = gr.school_id
WHERE graduated = 100;
