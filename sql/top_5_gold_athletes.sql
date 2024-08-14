WITH t1 as(
	SELECT name, count(1) as total_medals 
	FROM OLYMPICS_HISTORY
	WHERE medal = 'Gold'
	GROUP BY name
	ORDER BY total_medals DESC
),
t2 as(
	SELECT *, DENSE_RANK() OVER (ORDER BY total_medals DESC) as rank
	FROM t1
)
SELECT * FROM t2
WHERE rank <= 5;