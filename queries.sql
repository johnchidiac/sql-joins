-- Join the two tables so that every column and record appears, regardless of if there is not an owner_id
SELECT * FROM owners LEFT JOIN vehicles ON owners.id = vehicles.owner_id;

-- Count the number of cars for each owner. Display the owners first_name, last_name and count of vehicles. 
-- The first_name should be ordered in ascending order.
SELECT first_name, last_name, COUNT(*) FROM owners JOIN vehicles ON owners.id = vehicles.owner_id GROUP BY owners.id ORDER BY first_name;

-- Count the number of cars for each owner and display the average price for each of the cars as integers. 
-- Display the owners first_name , last_name, average price and count of vehicles. 
-- The first_name should be ordered in descending order. 
-- Only display results with more than one vehicle and an average price greater than 10000.
SELECT first_name, last_name, ROUND(AVG(v.price)), COUNT(*) FROM owners JOIN vehicles v ON owners.id = v.owner_id GROUP BY owners.id HAVING ROUND(AVG(v.price)) > 10000 ORDER BY first_name DESC;


-- SQL Zoo

-- 1.
SELECT matchid, player 
FROM goal 
WHERE teamid = 'GER';

-- 2.
SELECT id, stadium, team1, team2 
FROM game 
WHERE id = 1012;

-- 3.
SELECT player, teamid, stadium, mdate 
FROM game 
JOIN goal ON (game.id = goal.matchid) 
WHERE teamid = 'GER';

-- 4.
SELECT team1, team2, player 
FROM game 
JOIN goal ON (game.id = goal.matchid) 
WHERE player LIKE 'Mario%';

-- 5.
SELECT player, teamid, coach, gtime 
FROM goal 
JOIN eteam ON eteam.id = goal.teamid 
WHERE gtime <= 10;

-- 6.
SELECT mdate, teamname 
FROM game 
JOIN eteam ON (team1 = eteam.id) 
WHERE coach LIKE 'Fernando Santos';

-- 7.
SELECT DISTINCT player 
FROM goal 
JOIN game ON goal.matchid = game.id 
WHERE stadium = 'National Stadium, Warsaw';

-- 8.
SELECT DISTINCT player 
FROM game 
JOIN goal ON matchid = id 
WHERE (team1='GER' OR team2='GER') AND (goal.teamid <> 'GER');

-- 9.
SELECT teamname, COUNT(*) 
FROM eteam 
JOIN goal ON id=teamid 
GROUP BY teamname 
ORDER BY teamname;

-- 10.
SELECT stadium, COUNT(*) 
FROM goal 
JOIN game ON game.id = goal.matchid 
GROUP BY stadium;

-- 11.
SELECT matchid, mdate, COUNT(*) 
FROM game 
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL') 
GROUP BY matchid;

-- 12.
SELECT matchid, mdate, COUNT(*) 
FROM goal 
JOIN game ON goal.matchid = game.id 
WHERE goal.teamid = 'GER' 
GROUP BY goal.matchid;

-- 13.
SELECT mdate, team1, 
  SUM(CASE 
    WHEN teamid = team1 THEN 1 
    ELSE 0 
  END) AS score1,
  team2,
  SUM(CASE 
    WHEN teamid = team2 THEN 1 
    ELSE 0 
  END) AS score2
FROM game 
JOIN goal ON game.id = goal.matchid
GROUP BY game.id
ORDER BY mdate, matchid, team1, team2;
