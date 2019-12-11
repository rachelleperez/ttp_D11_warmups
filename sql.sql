-- (northwind database)
-- 1) On which day of the month are the most *orders* being placed (use only the 2 most recent years of data)?

SELECT EXTRACT(DAY FROM OrderDate) as day, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day
ORDER BY order_count DESC 
LIMIT 1;

-- Answer #1: 6

 day | order_count
-----+-------------
   6 |          33
(1 row)


-- 2) which day has the lowest number of orders? 

SELECT EXTRACT(DAY FROM OrderDate) as day, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day
ORDER BY order_count 
LIMIT 1;

-- Answer #2: 31

 day | order_count
-----+-------------
  31 |          14
(1 row)

-- 3) Are you suprised? Why would this day have the least?

-- Answer #3: NO, half of the months don't have a day 31. This makes a lot of sense.

-- 4) On which day of the WEEK are the most *orders* being placed (use only the most recent year of data)?

-- Query for data #1
SELECT EXTRACT(DOW FROM OrderDate) as day_of_the_week, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day_of_the_week
ORDER BY order_count;

-- Query for data #2
-- Example: SQL> SELECT TO_CHAR(date '1982-03-09', 'DAY') day FROM dual;

SELECT TO_CHAR(OrderDate,'DAY') AS day_of_the_week, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day_of_the_week
ORDER BY order_count DESC;

-- Answer #4: Friday

SELECT TO_CHAR(OrderDate,'DAY') AS day_of_the_week, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day_of_the_week
ORDER BY order_count DESC
LIMIT 1;

 day_of_the_week | order_count
-----------------+-------------
 FRIDAY          |         172
(1 row)

-- 5) What can you say about any trends in orders being placed? 

SELECT TO_CHAR(OrderDate,'DAY') AS day_of_the_week, COUNT(OrderID) AS order_count
FROM Orders
WHERE (SELECT MAX(OrderDate) FROM Orders) - OrderDate < INTERVAL '2 years'
GROUP BY day_of_the_week
ORDER BY order_count DESC;

 day_of_the_week | order_count
-----------------+-------------
 FRIDAY          |         172
 WEDNESDAY       |         167
 THURSDAY        |         165
 SATURDAY        |         164
 TUESDAY         |         132
 SUNDAY          |          30
(6 rows)

-- Answer #5
----1) No orders on Monday! 
----2)Sunday + Monday+ Tuesday are the lowest days so people are least likely to order at the beginning of the week.
--- 3)Wednesday - Saturday the order count is much higher with Friday being the mot popular day to make orders

-- Answer - Part 1

 day_of_the_week | order_count
-----------------+-------------
 FRIDAY          |         172
 WEDNESDAY       |         167
 THURSDAY        |         165
 SATURDAY        |         164
 TUESDAY         |         132
 SUNDAY          |          30
(6 rows)


--6) How out of date is this database (ie the last order compared to today's date)

-- Answer #6: 3.5 years

SELECT EXTRACT(DAY FROM MAX(OrderDate) - NOW())/365 as number_of_years
FROM Orders;

 number_of_years
------------------
 -3.5972602739726
(1 row)
