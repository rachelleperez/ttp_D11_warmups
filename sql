-- On which day of the month are the most *orders* being placed (use only the 2 most recent years of data)?
-- which day has the lowest number of orders? Are you suprised? Why would this day have the least?



-- On which day of the WEEK are the most *orders* being placed (use only the most recent year of data)?
-- What can you say about any trends in orders being placed? 



--How out of date is this database (ie the last order compared to today's date)
SELECT age(MAX(order_date)) FROM orders;
SELECT date_part('day', now() - MAX(order_date)) as days FROM orders;