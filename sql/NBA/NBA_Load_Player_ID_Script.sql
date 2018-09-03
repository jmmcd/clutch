##UPDATE PLAYER_ID COLUMN##
UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

SELECT COUNT(*) FROM nba_2017 WHERE player_id IS NOT NULL;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;


##UPDATE A/H_ID COLUMN NBA_2017_SAMPLE##
UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a1 = player_join.player_name
SET nba.a1_id = player_join.player_id
WHERE nba.a1 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a2 = player_join.player_name
SET nba.a2_id = player_join.player_id
WHERE nba.a2 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a3 = player_join.player_name
SET nba.a3_id = player_join.player_id
WHERE nba.a3 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a4 = player_join.player_name
SET nba.a4_id = player_join.player_id
WHERE nba.a4 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a5 = player_join.player_name
SET nba.a5_id = player_join.player_id
WHERE nba.a5 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h1 = player_join.player_name
SET nba.h1_id = player_join.player_id
WHERE nba.h1 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h2 = player_join.player_name
SET nba.h2_id = player_join.player_id
WHERE nba.h2 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h3 = player_join.player_name
SET nba.h3_id = player_join.player_id
WHERE nba.h3 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h4 = player_join.player_name
SET nba.h4_id = player_join.player_id
WHERE nba.h4 = player_join.player_name;

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h5 = player_join.player_name
SET nba.h5_id = player_join.player_id
WHERE nba.h5 = player_join.player_name;


##UPDATE A/H_ID COLUMN nba_2016_sample##
UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a1 = player_join.player_name
SET nba.a1_id = player_join.player_id
WHERE nba.a1 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a2 = player_join.player_name
SET nba.a2_id = player_join.player_id
WHERE nba.a2 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a3 = player_join.player_name
SET nba.a3_id = player_join.player_id
WHERE nba.a3 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a4 = player_join.player_name
SET nba.a4_id = player_join.player_id
WHERE nba.a4 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a5 = player_join.player_name
SET nba.a5_id = player_join.player_id
WHERE nba.a5 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h1 = player_join.player_name
SET nba.h1_id = player_join.player_id
WHERE nba.h1 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h2 = player_join.player_name
SET nba.h2_id = player_join.player_id
WHERE nba.h2 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h3 = player_join.player_name
SET nba.h3_id = player_join.player_id
WHERE nba.h3 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h4 = player_join.player_name
SET nba.h4_id = player_join.player_id
WHERE nba.h4 = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h5 = player_join.player_name
SET nba.h5_id = player_join.player_id
WHERE nba.h5 = player_join.player_name;


##UPDATE A/H_ID COLUMN NBA_2017##
UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a1 = player_join.player_name
SET nba.a1_id = player_join.player_id
WHERE nba.a1 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a2 = player_join.player_name
SET nba.a2_id = player_join.player_id
WHERE nba.a2 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a3 = player_join.player_name
SET nba.a3_id = player_join.player_id
WHERE nba.a3 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a4 = player_join.player_name
SET nba.a4_id = player_join.player_id
WHERE nba.a4 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a5 = player_join.player_name
SET nba.a5_id = player_join.player_id
WHERE nba.a5 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h1 = player_join.player_name
SET nba.h1_id = player_join.player_id
WHERE nba.h1 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h2 = player_join.player_name
SET nba.h2_id = player_join.player_id
WHERE nba.h2 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h3 = player_join.player_name
SET nba.h3_id = player_join.player_id
WHERE nba.h3 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h4 = player_join.player_name
SET nba.h4_id = player_join.player_id
WHERE nba.h4 = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h5 = player_join.player_name
SET nba.h5_id = player_join.player_id
WHERE nba.h5 = player_join.player_name;


##UPDATE A/H_ID COLUMN nba_2016##
UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a1 = player_join.player_name
SET nba.a1_id = player_join.player_id
WHERE nba.a1 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a2 = player_join.player_name
SET nba.a2_id = player_join.player_id
WHERE nba.a2 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a3 = player_join.player_name
SET nba.a3_id = player_join.player_id
WHERE nba.a3 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a4 = player_join.player_name
SET nba.a4_id = player_join.player_id
WHERE nba.a4 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.a5 = player_join.player_name
SET nba.a5_id = player_join.player_id
WHERE nba.a5 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h1 = player_join.player_name
SET nba.h1_id = player_join.player_id
WHERE nba.h1 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h2 = player_join.player_name
SET nba.h2_id = player_join.player_id
WHERE nba.h2 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h3 = player_join.player_name
SET nba.h3_id = player_join.player_id
WHERE nba.h3 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h4 = player_join.player_name
SET nba.h4_id = player_join.player_id
WHERE nba.h4 = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.h5 = player_join.player_name
SET nba.h5_id = player_join.player_id
WHERE nba.h5 = player_join.player_name;
