/*Your team is going to need a great home run hitter. Ken Griffey Jr., a long-time Silver Slugger and Gold Glove award winner, might be a good prospect.
In 3.sql, write a SQL query to find Ken Griffey Jr.’s home run history.

Sort by year in descending order.
Note that there may be two players with the name “Ken Griffey.” This Ken Griffey was born in 1969.
Your query should return a table with two columns, one for year and one for home runs.*/
SELECT year, HR
FROM players pl join performances pe on pe.player_id=pl.id
WHERE first_name='Ken' and last_name='Griffey' and birth_year=1969
GROUP BY year
ORDER BY year desc;
