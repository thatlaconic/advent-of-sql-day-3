# [The Great Christmas Analytics Crisis of 2024](https://adventofsql.com/challenges/example)
## Description

Santa's team is in crisis! Last year's Christmas delivery exposed inefficiencies in Santa's logistics, including skipped towns, overloaded reindeer, and delivery mistakes. To prevent a repeat, Santa has ordered an overhaul of the delivery system with a focus on data-driven decision-making. The elves have digitized years of delivery data but need help analyzing it.

## Challenge
[Download Challenge Data](https://github.com/thatlaconic/advent-of-sql-day-3/blob/main/advent_of_sql_day_0.sql)

Find the top cities in each country (max top 3 cities for each country) with the highest average naughty_nice_score for children who received gifts, but only include cities with at least 5 children. 

## Dataset
This dataset contains 4 tables however only 2 tables were used. 
### Using PostgreSQL:
**input**
```sql
SELECT *
FROM children ;
```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day-3/blob/main/children3.PNG)

**input**
```sql
SELECT *
FROM christmaslist ;
```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day-3/blob/main/xmaslist.PNG)

## Solution
[Download Solution Code](https://github.com/thatlaconic/advent-of-sql-day-3/blob/main/advent_answer_day3.sql)

**input** 
```sql
WITH advent_challenge AS (
	SELECT city, country, AVG(naughty_nice_score) AS average, COUNT(city) AS num_children
	FROM children
    INNER JOIN christmaslist ON children.child_id = christmaslist.child_id
	GROUP BY city, country
	ORDER BY country DESC
	)
SELECT *
FROM advent_challenge
WHERE num_children >= 5 ;

```
**output**
![](https://github.com/thatlaconic/advent-of-sql-day-3/blob/main/D3.PNG)
