--Write a SQL query to find, for each year, the first day of the year that PBS released a Cyberchase episode.
--Your query should output a table with two columns, one for the year and one for the earliest month and day an episode was released that year.
SELECT strftime('%Y', air_date), air_date
FROM episodes
GROUP BY strftime('%Y', air_date)
ORDER BY strftime('%Y', air_date) asc, air_date asc;
