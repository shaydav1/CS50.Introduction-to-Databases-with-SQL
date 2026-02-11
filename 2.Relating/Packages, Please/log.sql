
-- *** The Lost Letter ***
/*Your first report of a missing package comes from Anneke. Anneke walks up to your counter and tells you the following:
Clerk, my name’s Anneke. I live over at 900 Somerville Avenue.
Not long ago, I sent out a special letter. It’s meant for my friend Varsha.
She’s starting a new chapter of her life at 2 Finnegan Street, uptown.
(That address, let me tell you: it was a bit tricky to get right the first time.)
The letter is a congratulatory note—a cheery little paper hug from me to her, to celebrate this big move of hers.
Can you check if it’s made its way to her yet?

In log.sql, underneath -- *** The Lost Letter ***, keep track of the SQL queries you use to find Anneke’s lost letter.
Once you’ve found it, describe it per the questions in answers.txt.
*/
SELECT id
FROM addresses
WHERE address = '900 Somerville Avenue';

SELECT *
FROM addresses
WHERE id  = 854;

SELECT id
FROM packages
WHERE contents like '%congratulatory%';

SELECT *
FROM scans
WHERE package_id = 384;

SELECT *
FROM addresses
WHERE id  = (SELECT address_id
             FROM scans
             WHERE action = 'Pick' and package_id = (SELECT id
                                                     FROM packages
                                                     WHERE contents like '%congratulatory%')
                                                     );

-- *** The Devious Delivery ***
/*
Afraid there’s no “From” address.
*/

SELECT *
FROM packages
WHERE from_address_id IS NULL;

SELECT *
FROM scans
WHERE package_id = 5098;

SELECT *
FROM addresses
WHERE id = 348;

SELECT type
FROM addresses
WHERE id = (SELECT address_id
            FROM packages p join scans s on p.id = s.package_id
            WHERE from_address_id IS NULL and action='Drop');

SELECT contents
FROM packages
WHERE from_address_id IS NULL;

-- *** The Forgotten Gift ***

/*

I had sent a mystery gift, you see, to my wonderful granddaughter, off at 728 Maple Place. That was about two weeks ago.
Now the delivery date has passed by seven whole days. I did send it from my home at 109 Tileston Street.
*/
SELECT *
FROM addresses
WHERE address = '728 Maple Place';

SELECT *
FROM packages
WHERE to_address_id = 4983;

SELECT contents
FROM packages
WHERE to_address_id = (SELECT id
                       FROM addresses
                       WHERE address = '728 Maple Place');

SELECT *
FROM scans
WHERE package_id = 9523
ORDER BY timestamp DESC
LIMIT 1;

SELECT name
FROM drivers
WHERE id = (SELECT driver_id
            FROM scans
            WHERE package_id = (SELECT id
                                FROM packages
                                WHERE to_address_id = (SELECT id
                                                       FROM addresses
                                                       WHERE address = '728 Maple Place')
            )
            ORDER BY timestamp DESC
            LIMIT 1
            );
