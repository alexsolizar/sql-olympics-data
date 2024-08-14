/* Query for determining total medals won by each country
according to type of medal arranged in descending order */

/*create extension tablefunc;*/

SELECT country
, COALESCE(gold, 0) AS gold
, COALESCE(silver, 0) AS silver
, COALESCE(bronze, 0) AS bronze
FROM CROSSTAB('SELECT nr.region as country, medal, count(1) as total_medals
	FROM OLYMPICS_HISTORY oh
	JOIN OLYMPICS_HISTORY_noc_regions nr ON nr.noc = oh.noc
	WHERE medal <> ''NA''
	GROUP BY 1,2
	ORDER BY 1,2',
	'values (''Bronze''), (''Gold''), (''Silver'')'
	) AS result(country varchar, bronze bigint, gold bigint, silver bigint)
ORDER BY gold DESC, silver DESC, bronze DESC;
