##INTIAL DATA LOAD##
DROP TABLE nba_2017_sample;
CREATE TABLE nba_2017_sample (
game_id int(20) NOT NULL,
data_set text,
match_date date,
a1 text,
a2 text,
a3 text,
a4 text,
a5 text,
h1 text,
h2 text,
h3 text,
h4 text,
h5 text,
period int(1),
away_score int(3),
home_score int(3),
remaining_time time,
elapsed time,
play_length time,
play_id int(11) NOT NULL,
team text,
event_type text,
assist text,
away text,
home text,
blocker text,
entered text,
exited text,
num int(1),
opponent text,
outof int(1),
player text,
points int(1),
possession text,
reason text,
result text,
steal text,
type text,
shot_distance double,
original_x double,
original_y double,
converted_x double,
converted_y double,
load_cycles int(4),
player_id int(10),
home_away_ind char(1),
player_load_cycles int(4));

TRUNCATE TABLE nba_2017_sample;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/NBA/2017_nba_sample.csv' 
INTO TABLE nba_2017_sample
FIELDS TERMINATED BY ','
#OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(game_id, data_set, @match_date, a1, a2, a3, a4, a5, h1, h2, h3, h4, h5, period, away_score,
home_score, remaining_time, elapsed, play_length, play_id, team, event_type, assist, away,
home, blocker, entered, exited, num, opponent, outof, player, points, possession, reason,
result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y) 
SET match_date = STR_TO_DATE(@match_date, '%d/%m/%Y');
;

DROP TABLE nba_2016_sample;
CREATE TABLE nba_2016_sample (
game_id int(20) NOT NULL,
data_set text,
match_date date,
a1 text,
a2 text,
a3 text,
a4 text,
a5 text,
h1 text,
h2 text,
h3 text,
h4 text,
h5 text,
period int(1),
away_score int(3),
home_score int(3),
remaining_time time,
elapsed time,
play_length time,
play_id int(11) NOT NULL,
team text,
event_type text,
assist text,
away text,
home text,
blocker text,
entered text,
exited text,
num int(1),
opponent text,
outof int(1),
player text,
points int(1),
possession text,
reason text,
result text,
steal text,
type text,
shot_distance double,
original_x double,
original_y double,
converted_x double,
converted_y double,
load_cycles int(4),
player_id int(10),
home_away_ind char(1),
player_load_cycles int(4));

TRUNCATE TABLE nba_2016_sample;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/NBA/2016_nba_sample.csv' 
INTO TABLE nba_2016_sample
FIELDS TERMINATED BY ','
#OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(game_id, data_set, @match_date, a1, a2, a3, a4, a5, h1, h2, h3, h4, h5, period, away_score,
home_score, remaining_time, elapsed, play_length, play_id, team, event_type, assist, away,
home, blocker, entered, exited, num, opponent, outof, player, points, possession, reason,
result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y) 
SET match_date = STR_TO_DATE(@match_date, '%d/%m/%Y');
;

DROP TABLE nba_2017;
CREATE TABLE nba_2017 (
game_id int(20) NOT NULL,
data_set text,
match_date date,
a1 text,
a2 text,
a3 text,
a4 text,
a5 text,
h1 text,
h2 text,
h3 text,
h4 text,
h5 text,
period int(1),
away_score int(3),
home_score int(3),
remaining_time time,
elapsed time,
play_length time,
play_id int(11) NOT NULL,
team text,
event_type text,
assist text,
away text,
home text,
blocker text,
entered text,
exited text,
num int(1),
opponent text,
outof int(1),
player text,
points int(1),
possession text,
reason text,
result text,
steal text,
type text,
shot_distance double,
original_x double,
original_y double,
converted_x double,
converted_y double,
load_cycles int(4),
player_id int(10),
home_away_ind char(1),
player_load_cycles int(4));

TRUNCATE TABLE nba_2017;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/NBA/2017_nba.csv'
INTO TABLE nba_2017
FIELDS TERMINATED BY ','
#OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(game_id, data_set, @match_date, a1, a2, a3, a4, a5, h1, h2, h3, h4, h5, period, away_score,
home_score, remaining_time, elapsed, play_length, play_id, team, event_type, assist, away,
home, blocker, entered, exited, num, opponent, outof, player, points, possession, reason,
result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y) 
SET match_date = STR_TO_DATE(@match_date, '%d/%m/%Y');
;

DROP TABLE nba_2016;
CREATE TABLE nba_2016 (
game_id int(20) NOT NULL,
data_set text,
match_date date,
a1 text,
a2 text,
a3 text,
a4 text,
a5 text,
h1 text,
h2 text,
h3 text,
h4 text,
h5 text,
period int(1),
away_score int(3),
home_score int(3),
remaining_time time,
elapsed time,
play_length time,
play_id int(11) NOT NULL,
team text,
event_type text,
assist text,
away text,
home text,
blocker text,
entered text,
exited text,
num int(1),
opponent text,
outof int(1),
player text,
points int(1),
possession text,
reason text,
result text,
steal text,
type text,
shot_distance double,
original_x double,
original_y double,
converted_x double,
converted_y double,
load_cycles int(4),
player_id int(10),
home_away_ind char(1),
player_load_cycles int(4));

TRUNCATE TABLE nba_2016;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/NBA/2016_nba.csv' 
INTO TABLE nba_2016
FIELDS TERMINATED BY ','
#OPTIONALLY ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(game_id, data_set, @match_date, a1, a2, a3, a4, a5, h1, h2, h3, h4, h5, period, away_score,
home_score, remaining_time, elapsed, play_length, play_id, team, event_type, assist, away,
home, blocker, entered, exited, num, opponent, outof, player, points, possession, reason,
result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y) 
SET match_date = STR_TO_DATE(@match_date, '%d/%m/%Y');
;

#ALTER TABLE nba_2016 ADD COLUMN player_load_cycles int(4) DEFAULT 0;
#ALTER TABLE nba_2017 ADD COLUMN player_load_cycles int(4) DEFAULT 0;


##DATA LOAD COUNT CHECK##
SELECT COUNT(*) FROM nba_2017_sample;
SELECT COUNT(*) FROM nba_2016_sample;
SELECT COUNT(*) FROM nba_2017;
SELECT COUNT(*) FROM nba_2016;

##CREATE PLAYER TABLE#
DROP TABLE nba_players;
CREATE TABLE nba_players(
 player_id INT(10) AUTO_INCREMENT PRIMARY KEY,
 player_name VARCHAR(50)
);

INSERT INTO nba_players (player_name) 
SELECT DISTINCT(player) FROM nba_2017 WHERE LENGTH(player) > 1
UNION
SELECT DISTINCT(player) FROM nba_2016 WHERE LENGTH(player) > 1;

CREATE INDEX nba_players_player_name ON nba_players (player_name);

##CUSTOM TABLE CREATION##
#DROP TABLE nba_2017_sample_shots;
#CREATE TABLE nba_2017_sample_shots AS 
#SELECT * FROM nba_2017_sample WHERE event_type IN ('shot', 'miss', 'free throw');

#DROP TABLE nba_2016_sample_shots;
#CREATE TABLE nba_2016_sample_shots AS 
#SELECT * FROM nba_2016_sample WHERE event_type IN ('shot', 'miss', 'free throw');

#DROP TABLE nba_2017_shots;
#CREATE TABLE nba_2017_shots AS 
#SELECT * FROM nba_2017 WHERE event_type IN ('shot', 'miss', 'free throw');

#DROP TABLE nba_2016_shots;
#CREATE TABLE nba_2016_shots AS 
#SELECT * FROM nba_2016 WHERE event_type IN ('shot', 'miss', 'free throw');

##SHOTS DATA LOAD COUNT CHECK##
#SELECT COUNT(*) FROM nba_2017_sample_shots;
#SELECT COUNT(*) FROM nba_2016_sample_shots;
#SELECT COUNT(*) FROM nba_2017_shots;
#SELECT COUNT(*) FROM nba_2016_shots;

##INDEX CREATION##
ALTER TABLE nba_2017_sample ADD PRIMARY KEY pk_nba_2017_sample (`game_id`, `play_id`);
ALTER TABLE nba_2017_sample ADD FULLTEXT INDEX idx_nba_2017_sample_pl(a1,a2,a3,a4,a5,h1,h2,h3,h4,h5);
ALTER TABLE nba_2017_sample ADD FULLTEXT INDEX idx_nba_2017_sample_pl_home (h1,h2,h3,h4,h5);
ALTER TABLE nba_2017_sample ADD FULLTEXT INDEX idx_nba_2017_sample_pl_away (a1,a2,a3,a4,a5);

CREATE INDEX n17_samp_player ON nba_2017_sample (player(20));
CREATE INDEX n17_samp_player_id ON nba_2017_sample (player_id);

ALTER TABLE nba_2016_sample ADD PRIMARY KEY (`game_id`, `play_id`);
ALTER TABLE nba_2016_sample ADD FULLTEXT INDEX (a1,a2,a3,a4,a5,h1,h2,h3,h4,h5);
ALTER TABLE nba_2016_sample ADD FULLTEXT INDEX idx_nba_2016_sample_pl_home (h1,h2,h3,h4,h5);
ALTER TABLE nba_2016_sample ADD FULLTEXT INDEX idx_nba_2016_sample_pl_away (a1,a2,a3,a4,a5);

CREATE INDEX n16_samp_player ON nba_2016_sample (player(20));
CREATE INDEX n16_samp_player_id ON nba_2016_sample (player_id);

ALTER TABLE nba_2017 ADD PRIMARY KEY (`game_id`, `play_id`);
ALTER TABLE nba_2017 ADD FULLTEXT INDEX (a1,a2,a3,a4,a5,h1,h2,h3,h4,h5);
ALTER TABLE nba_2017 ADD FULLTEXT INDEX idx_nba_2017_pl_home (h1,h2,h3,h4,h5);
ALTER TABLE nba_2017 ADD FULLTEXT INDEX idx_nba_2017_pl_away (a1,a2,a3,a4,a5);

CREATE INDEX n17_player ON nba_2017 (player(20));
CREATE INDEX n17_player_id ON nba_2017 (player_id);

ALTER TABLE nba_2016 ADD PRIMARY KEY (`game_id`, `play_id`);
ALTER TABLE nba_2016 ADD FULLTEXT INDEX (a1,a2,a3,a4,a5,h1,h2,h3,h4,h5);
ALTER TABLE nba_2016 ADD FULLTEXT INDEX idx_nba_2016_pl_home (h1,h2,h3,h4,h5);
ALTER TABLE nba_2016 ADD FULLTEXT INDEX idx_nba_2016_pl_away (a1,a2,a3,a4,a5);

CREATE INDEX n16_player ON nba_2016 (player(20));
CREATE INDEX n16_player_id ON nba_2016 (player_id);

#ALTER TABLE nba_2017_sample_shots ADD PRIMARY KEY (`game_id`, `play_id`);
#CREATE INDEX n17_samp_shot_player_id ON nba_2017_sample_shots (player_id);

#ALTER TABLE nba_2016_sample_shots ADD PRIMARY KEY (`game_id`, `play_id`);
#CREATE INDEX n16_samp_shot_player_id ON nba_2016_sample_shots (player_id);

#ALTER TABLE nba_2017_shots ADD PRIMARY KEY (`game_id`, `play_id`);
#CREATE INDEX n17_shot_player_id ON nba_2017_shots (player_id);

#ALTER TABLE nba_2016_shots ADD PRIMARY KEY (`game_id`, `play_id`);
#CREATE INDEX n16_shot_player_id ON nba_2016_shots (player_id);

UPDATE nba_2017_sample nba JOIN
(SELECT DISTINCT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2016_sample nba JOIN
(SELECT DISTINCT nba.player, np.player_name, np.player_id
FROM nba_2016_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2017 nba JOIN
(SELECT DISTINCT nba.player, np.player_name, np.player_id
FROM nba_2017 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2016 nba JOIN
(SELECT DISTINCT nba.player, np.player_name, np.player_id
FROM nba_2016 nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

##MAX LOAD CYCLES COLUMN POPULATION##
UPDATE nba_2017_sample nba JOIN (
	SELECT a.play_id, b.game_id, b.max_load_cycles from nba_2017_sample a 
	INNER JOIN (
		SELECT game_id, MAX(play_id) AS max_load_cycles
		FROM nba_2017_sample
		GROUP BY game_id) 
        AS b ON a.game_id = b.game_id) AS load_cycles
	ON nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id
SET load_cycles = load_cycles.max_load_cycles
WHERE nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id; 
    
UPDATE nba_2016_sample nba JOIN (
	SELECT a.play_id, b.game_id, b.max_load_cycles from nba_2016_sample a 
	INNER JOIN (
		SELECT game_id, MAX(play_id) AS max_load_cycles
		FROM nba_2016_sample
		GROUP BY game_id) 
        AS b ON a.game_id = b.game_id) AS load_cycles
	ON nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id
SET load_cycles = load_cycles.max_load_cycles
WHERE nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id; 
    
UPDATE nba_2017 nba JOIN (
	SELECT a.play_id, b.game_id, b.max_load_cycles from nba_2017 a 
	INNER JOIN (
		SELECT game_id, MAX(play_id) AS max_load_cycles
		FROM nba_2017
		GROUP BY game_id) 
        AS b ON a.game_id = b.game_id) AS load_cycles
	ON nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id
SET load_cycles = load_cycles.max_load_cycles
WHERE nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id;
    
UPDATE nba_2016 nba JOIN (
	SELECT a.play_id, b.game_id, b.max_load_cycles from nba_2016 a 
	INNER JOIN (
		SELECT game_id, MAX(play_id) AS max_load_cycles
		FROM nba_2016
		GROUP BY game_id) 
        AS b ON a.game_id = b.game_id) AS load_cycles
	ON nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id
SET load_cycles = load_cycles.max_load_cycles
WHERE nba.game_id = load_cycles.game_id
	AND nba.play_id = load_cycles.play_id;

#HOME / AWAY INDICATOR POPULATION
UPDATE nba_2017_sample nba JOIN nba_2017_sample nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.home_away_ind = fn_nba_get_home_away_flag(nba2.game_id, nba2.play_id, 2017)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id;

UPDATE nba_2016_sample nba JOIN nba_2016_sample nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.home_away_ind = fn_nba_get_home_away_flag(nba2.game_id, nba2.play_id, 2016)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id;   

UPDATE nba_2017 nba JOIN nba_2017 nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.home_away_ind = fn_nba_get_home_away_flag(nba2.game_id, nba2.play_id, 2017)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id;      

UPDATE nba_2016 nba JOIN nba_2016 nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.home_away_ind = fn_nba_get_home_away_flag(nba2.game_id, nba2.play_id, 2016)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id;   

#PLAYER LOAD CYCLES DATA CREATION
UPDATE nba_2017_sample nba JOIN nba_2017_sample nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.player_load_cycles = fn_nba_get_player_load_cycles(nba2.game_id, nba2.play_id, nba2.player, 2017)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
AND nba.event_type IN ('shot', 'miss', 'free throw');

UPDATE nba_2016_sample nba JOIN nba_2016_sample nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.player_load_cycles = fn_nba_get_player_load_cycles(nba2.game_id, nba2.play_id, nba2.player, 2016)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
AND nba.event_type IN ('shot', 'miss', 'free throw');

#UPDATE nba_2017 nba JOIN nba_2017 nba2
#ON nba.game_id = nba2.game_id
#AND nba.play_id = nba2.play_id
#SET nba.player_load_cycles = fn_nba_get_player_load_cycles(nba2.game_id, nba2.play_id, nba2.player, 2017)
#WHERE nba.game_id = nba2.game_id
#AND nba.play_id = nba2.play_id
#AND nba.event_type IN ('shot', 'miss', 'free throw');

#UPDATE nba_2016 nba JOIN nba_2016 nba2
#ON nba.game_id = nba2.game_id
#AND nba.play_id = nba2.play_id
#SET nba.player_load_cycles = fn_nba_get_player_load_cycles(nba2.game_id, nba2.play_id, nba2.player, 2016)
#WHERE nba.game_id = nba2.game_id
#AND nba.play_id = nba2.play_id
#AND nba.event_type IN ('shot', 'miss', 'free throw');

#CREATE RESULTS TABLE
DROP TABLE nba_single_shot_results;
CREATE TABLE nba_single_shot_results (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    game_id INT(20),
    play_id INT(11),
    player TEXT,
    year_id INT(4),
	vf_load_cycle_factor FLOAT,
	vf_scoring_diff_factor FLOAT,
	vf_stakes_factor FLOAT,
    vf_accuracy_factor FLOAT,
	vf_fatigue_factor FLOAT,
	vf_clutch_factor FLOAT,
    vi_points INT
);

#CREATE TABLE nba_2016_bkp AS SELECT * FROM nba_2016;
#CREATE TABLE nba_2017_bkp AS SELECT * FROM nba_2017;

UPDATE nba_2016 SET game_id = game_id - 21500000 WHERE game_id < 21510000;
UPDATE nba_2016 SET game_id = game_id - 41498500 WHERE game_id > 21510000;
COMMIT;

UPDATE nba_2017 SET game_id = game_id - 21600000 WHERE game_id < 21610000;
UPDATE nba_2017 SET game_id = game_id - 41598500 WHERE game_id > 21610000;
COMMIT;

ALTER TABLE nba_2016 ADD COLUMN original_game_id int(20) NOT NULL;
UPDATE nba_2016 SET original_game_id = game_id + 21500000 WHERE game_id < 1500;
UPDATE nba_2016 SET original_game_id = game_id + 41498500 WHERE game_id > 1500;
COMMIT;

ALTER TABLE nba_2017 ADD COLUMN original_game_id int(20) NOT NULL;
UPDATE nba_2017 SET original_game_id = game_id + 21500000 WHERE game_id < 1500;
UPDATE nba_2017 SET original_game_id = game_id + 41498500 WHERE game_id > 1500;
COMMIT;

#Creating results of clutch approximation variation from the curve (clutch parameter)
DROP TABLE nba_2016_clutch_results;
#CREATE TABLE nba_2016_clutch_results AS
SELECT 
	player, 
    SUM(vf_clutch_factor) AS summ, 
    AVG(vf_clutch_factor) as aver,
    COUNT(vf_clutch_factor) AS total,
    (-0.00000194353 * COUNT(vf_clutch_factor)) + 0.497814 AS clutch,
    AVG(vf_clutch_factor) - ( (-0.00000194353 * COUNT(vf_clutch_factor)) + 0.497814) aver_over_clutch
FROM nba_single_shot_results
WHERE year_id = 2016
AND vi_points > 0
GROUP BY player
ORDER BY aver_over_clutch DESC;

DROP TABLE nba_2017_clutch_results;
#CREATE TABLE nba_2017_clutch_results AS
SELECT 
	player, 
    SUM(vf_clutch_factor) AS summ, 
    AVG(vf_clutch_factor) as aver,
    COUNT(vf_clutch_factor) AS total,
    (-0.00000194353 * COUNT(vf_clutch_factor)) + 0.497814 AS clutch,
    AVG(vf_clutch_factor) - ( (-0.00000194353 * COUNT(vf_clutch_factor)) + 0.497814) aver_over_clutch
FROM nba_single_shot_results
WHERE year_id = 2017
AND vi_points > 0
GROUP BY player
ORDER BY aver_over_clutch DESC;