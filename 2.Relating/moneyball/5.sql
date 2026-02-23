/*It’s a bit of a slow day in the office. Though Satchel no longer plays,
in 5.sql, write a SQL query to find all teams that Satchel Paige played for.

Your query should return a table with a single column, one for the name of the teams.*/
SELECT distinct t.name
FROM teams t join performances pe on t.id=pe.team_id
join players pl on pe.player_id=pl.id
WHERE first_name='Satchel' and last_name='Paige';
