
WITH advent_challenge AS (
	SELECT city, country, AVG(naughty_nice_score) AS average, COUNT(city) AS num_children
	FROM children
    INNER JOIN christmaslist ON children.child_id = christmaslist.child_id
	GROUP BY city, country
	ORDER BY (country) DESC
	)
SELECT *
FROM advent_challenge
WHERE num_children >= 5