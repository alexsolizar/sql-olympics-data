/*
PROBLEM: 
Find which sports are played in all summer games
APPROACH: 
1. total number of summer games
2. find number of summer games for each sport
3. compare 1 and 2
*/

WITH t1 AS (
	SELECT COUNT(DISTINCT games) AS total_games
	FROM olympics_history
	WHERE season = 'Summer'
),
t2 AS  (
	SELECT DISTINCT sport, games
	FROM olympics_history
	WHERE season = 'Summer'
),
t3 AS (
	SELECT sport, COUNT(games) as no_of_games
	FROM t2
	GROUP BY sport
)
SELECT * FROM t3
INNER JOIN t1 ON t3.no_of_games = t1.total_games;
