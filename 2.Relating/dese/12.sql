/*A parent asks you for advice on finding the best public school districts in Massachusetts.
In 12.sql, write a SQL query to find public school districts with above-average per-pupil expenditures and an above-average percentage of teachers rated “exemplary”.
Your query should return the districts’ names, along with their per-pupil expenditures and percentage of teachers rated exemplary.
Sort the results first by the percentage of teachers rated exemplary (high to low), then by the per-pupil expenditure (high to low).*/
SELECT d.name, e.per_pupil_expenditure, se.exemplary
FROM districts d join expenditures e on d.id=e.district_id
 join staff_evaluations se on d.id=se.district_id
WHERE state = 'MA' and
      type like '%Public%' and
      per_pupil_expenditure > (SELECT avg(per_pupil_expenditure) FROM expenditures) and
      exemplary > (SELECT avg(exemplary) FROM staff_evaluations)
ORDER BY exemplary desc, per_pupil_expenditure desc;
