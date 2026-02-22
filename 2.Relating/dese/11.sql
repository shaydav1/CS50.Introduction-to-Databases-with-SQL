/*Is there a relationship between school expenditures and graduation rates?
In 11.sql, write a SQL query to display the names of schools, their per-pupil expenditure, and their graduation rate.
Sort the schools from greatest per-pupil expenditure to least. If two schools have the same per-pupil expenditure, sort by school name.
You should assume a school spends the same amount per-pupil their district as a whole spends.
*/
SELECT s.name, per_pupil_expenditure, graduated
FROM schools s join districts d on s.district_id=d.id
join graduation_rates gr on s.id=gr.school_id
join expenditures e on d.id=e.district_id
ORDER BY per_pupil_expenditure desc, s.name;
