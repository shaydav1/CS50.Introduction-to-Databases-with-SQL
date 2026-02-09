--In 9.sql, write a query that counts the number of episodes released in Cyberchase’s first 6 years, from 2002 to 2007, inclusive.
SELECT count(episode_in_season)
FROM episodes
WHERE air_date between '2002-01-01' and '2008-01-01';
