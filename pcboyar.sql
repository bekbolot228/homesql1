SELECT * FROM PC
    -> UNION
    -> SELECT * FROM Laptop;
+------+-------+-------+-----+----+---------+--------+
| code | model | speed | ram | hd | cd      | price  |
+------+-------+-------+-----+----+---------+--------+
|    1 | 1232  |   500 |  64 |  5 | 12x     | 600.00 |
|    2 | 1121  |   750 | 128 | 14 | 40x     | 850.00 |
|    3 | 1233  |   500 |  64 |  5 | 12x     | 600.00 |
|    4 | 1121  |   600 | 128 | 14 | 40x     | 850.00 |
|    5 | 1121  |   600 | 128 |  8 | 40x     | 850.00 |
|    6 | 1233  |   750 | 128 | 20 | 50x     | 950.00 |
|    7 | 1232  |   500 |  32 | 10 | 12x     | 400.00 |
|    8 | 1232  |   450 |  64 |  8 | 24x     | 350.00 |
|    9 | 1232  |   450 |  32 | 10 | 24x     | 350.00 |
|   10 | 1260  |   500 |  32 | 10 | 12x     | 350.00 |
|   11 | 1233  |   900 | 128 | 40 | 40x     | 980.00 |
|   12 | 1233  |   800 | 128 | 20 | 50x     | 970.00 |
|    1 | 1298  |   350 |  32 |  4 | 700.00  |  11.00 |
|    2 | 1321  |   500 |  64 |  8 | 970.00  |  12.00 |
|    3 | 1750  |   750 | 128 | 12 | 1200.00 |  14.00 |
|    4 | 1298  |   600 |  64 | 10 | 1050.00 |  15.00 |
|    5 | 1752  |   750 | 128 | 10 | 1150.00 |  14.00 |
|    6 | 1298  |   450 |  64 | 10 | 950.00  |  12.00 |
+------+-------+-------+-----+----+---------+--------+
18 rows in set (0.00 sec)


SELECT hd  FROM PC
    -> UNION
    -> SELECT hd FROM Laptop;
+----+
| hd |
+----+
|  5 |
| 14 |
|  8 |
| 20 |
| 10 |
| 40 |
|  4 |
| 12 |
+----+
8 rows in set (0.00 sec)


 SELECT speed, COUNT(speed) AS count, AVG(price) FROM PC GROUP BY speed
    -> UNION
    -> SELECT speed, COUNT(speed) AS count, AVG(price) FROM Laptop GROUP BY speed;
+-------+-------+-------------+
| speed | count | AVG(price)  |
+-------+-------+-------------+
|   450 |     2 |  350.000000 |
|   500 |     4 |  487.500000 |
|   600 |     2 |  850.000000 |
|   750 |     2 |  900.000000 |
|   800 |     1 |  970.000000 |
|   900 |     1 |  980.000000 |
|   350 |     1 |  700.000000 |
|   450 |     1 |  950.000000 |
|   500 |     1 |  970.000000 |
|   600 |     1 | 1050.000000 |
|   750 |     2 | 1175.000000 |
+-------+-------+-------------+
11 rows in set (0.00 sec)

 SELECT ram, COUNT(ram) AS count, AVG(price) AS avg_price FROM PC GROUP BY ram
    -> UNION
    -> SELECT ram, COUNT(ram) AS count, AVG(price) AS avg_price FROM Laptop GROUP BY ram
    -> HAVING avg_price > 500;
+-----+-------+-------------+
| ram | count | avg_price    |
+-----+-------+-------------+
|  32 |     3 |  366.666667 |
|  64 |     3 |  516.666667 |
| 128 |     6 |  908.333333 |
|  32 |     1 |  700.000000 |
|  64 |     3 |  990.000000 |
| 128 |     2 | 1175.000000 |
+-----+-------+-------------+
6 rows in set (0.00 sec)



hom work

   -1-  SELECT first_name,last_name,to_date FROM employees JOIN titles ON employees.emp_no = titles.emp_no WHERE to_date > "2000-01-01" ;

   -2- SELECT gender, COUNT(gender)  FROM employees GROUP BY gender;
+--------+---------------+
| gender | COUNT(gender) |
+--------+---------------+
| M      |        179973 |
| F      |        120051 |
+--------+---------------+
2 rows in set (0.20 sec)

   -3-  SELECT gender, COUNT(gender), AVG(salary)  
    -> FROM employees 
    -> LEFT JOIN salaries ON employees.emp_no=salaries.emp_no 
    -> GROUP BY gender;
+--------+---------------+-------------+
| gender | COUNT(gender) | AVG(salary) |
+--------+---------------+-------------+
| M      |       1706321 |  63838.1769 |
| F      |       1137726 |  63769.6032 |
+--------+---------------+-------------+
2 rows in set (3.36 sec)

    -4-  SELECT YEAR(hire_date) as year, COUNT(YEAR(hire_date)) FROM employees GROUP BY year HAVING year > 1992;
+------+------------------------+
| year | COUNT(YEAR(hire_date)) |
+------+------------------------+
| 1993 |                  17772 |
| 1994 |                  14835 |
| 1995 |                  12115 |
| 1996 |                   9574 |
| 1997 |                   6669 |
| 1998 |                   4155 |
| 1999 |                   1514 |
| 2000 |                     13 |
+------+------------------------+
8 rows in set (0.25 sec)

    -5-  SELECT birth_date, COUNT(birth_date) FROM employees GROUP BY birth_date;


