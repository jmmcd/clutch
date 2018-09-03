#CREATE DATABASE clutch;

DROP TABLE pga_tour_2016_sample;
CREATE TABLE pga_tour_2016_sample (
Tour_Code int(11),
Tour_Description text,
Year int(4),
Tournament_ID bigint(20),
Player_ID bigint(20),
Course_ID int(11),
Permanent_Tournament_ID int(11),
Player_First_Name text,
Player_Last_Name text,
Round bigint(20),
Tournament_Name text,
Course_Name text,
Hole bigint(20),
Hole_Score int(11),
Par_Value bigint(20),
Yardage int(11),
Shot bigint(20),
Shot_Type text,
Num_Strokes int(11),
From_Location_Scorer text,
From_Location_Enhanced text,
To_Location_Scorer text,
To_Location_Enhanced text,
Distance_Ft bigint(20),
Distance_To_Pin_Ft bigint(20),
In_The_Hole_Flag text,
Around_The_Green_Flag text,
First_Putt_Flag text,
Distance_To_Hole_After_Shot_Ft bigint(20),
Time bigint(20),
Lie text,
Elevation text,
Slope text,
X_Coordinate double,
Y_Coordinate double,
Z_Coordinate double,
Distance_From_Center bigint(20),
Distance_From_Edge bigint(20),
Date text,
Left_Right text,
Strokes_Gained_Over_Baseline double,
Strokes_Gained_Category text,
Recovery_Shot text);

TRUNCATE TABLE pga_tour_2016_sample;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/PGA/2016_rshot_sample.csv' 
INTO TABLE pga_tour_2016_sample
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP TABLE pga_tour_2017_sample;
CREATE TABLE pga_tour_2017_sample (
Tour_Code text,
Tour_Description text,
Year int(4),
Tournament_ID bigint(20),
Player_ID bigint(20),
Course_ID int(11),
Permanent_Tournament_ID int(11),
Player_First_Name text,
Player_Last_Name text,
Round bigint(20),
Tournament_Name text,
Course_Name text,
Hole bigint(20),
Hole_Score int(11),
Par_Value bigint(20),
Yardage int(11),
Shot bigint(20),
Shot_Type text,
Num_Strokes int(11),
From_Location_Scorer text,
From_Location_Enhanced text,
To_Location_Scorer text,
To_Location_Enhanced text,
Distance_Ft bigint(20),
Distance_To_Pin_Ft bigint(20),
In_The_Hole_Flag text,
Around_The_Green_Flag text,
First_Putt_Flag text,
Distance_To_Hole_After_Shot_Ft bigint(20),
Time bigint(20),
Lie text,
Elevation text,
Slope text,
X_Coordinate double,
Y_Coordinate double,
Z_Coordinate double,
Distance_From_Center bigint(20),
Distance_From_Edge bigint(20),
Date text,
Left_Right text,
Strokes_Gained_Over_Baseline double,
Strokes_Gained_Category text,
Recovery_Shot text);

TRUNCATE TABLE pga_tour_2017_sample;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/PGA/2017_rshot_sample.csv' 
INTO TABLE pga_tour_2017_sample
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP TABLE pga_tour_2016;
CREATE TABLE pga_tour_2016 (
Tour_Code text,
Tour_Description text,
Year int(4),
Tournament_ID bigint(20),
Player_ID bigint(20),
Course_ID int(11),
Permanent_Tournament_ID int(11),
Player_First_Name text,
Player_Last_Name text,
Round bigint(20),
Tournament_Name text,
Course_Name text,
Hole bigint(20),
Hole_Score int(11),
Par_Value bigint(20),
Yardage int(11),
Shot bigint(20),
Shot_Type text,
Num_Strokes int(11),
From_Location_Scorer text,
From_Location_Enhanced text,
To_Location_Scorer text,
To_Location_Enhanced text,
Distance_Ft bigint(20),
Distance_To_Pin_Ft bigint(20),
In_The_Hole_Flag text,
Around_The_Green_Flag text,
First_Putt_Flag text,
Distance_To_Hole_After_Shot_Ft bigint(20),
Time bigint(20),
Lie text,
Elevation text,
Slope text,
X_Coordinate double,
Y_Coordinate double,
Z_Coordinate double,
Distance_From_Center bigint(20),
Distance_From_Edge bigint(20),
Date text,
Left_Right text,
Strokes_Gained_Over_Baseline double,
Strokes_Gained_Category text,
Recovery_Shot text);

TRUNCATE TABLE pga_tour_2016;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/PGA/2016_rshot.csv' 
INTO TABLE pga_tour_2016
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP TABLE pga_tour_2017;
CREATE TABLE pga_tour_2017 (
Tour_Code text,
Tour_Description text,
Year int(4),
Tournament_ID bigint(20),
Player_ID bigint(20),
Course_ID int(11),
Permanent_Tournament_ID int(11),
Player_First_Name text,
Player_Last_Name text,
Round bigint(20),
Tournament_Name text,
Course_Name text,
Hole bigint(20),
Hole_Score int(11),
Par_Value bigint(20),
Yardage int(11),
Shot bigint(20),
Shot_Type text,
Num_Strokes int(11),
From_Location_Scorer text,
From_Location_Enhanced text,
To_Location_Scorer text,
To_Location_Enhanced text,
Distance_Ft bigint(20),
Distance_To_Pin_Ft bigint(20),
In_The_Hole_Flag text,
Around_The_Green_Flag text,
First_Putt_Flag text,
Distance_To_Hole_After_Shot_Ft bigint(20),
Time bigint(20),
Lie text,
Elevation text,
Slope text,
X_Coordinate double,
Y_Coordinate double,
Z_Coordinate double,
Distance_From_Center bigint(20),
Distance_From_Edge bigint(20),
Date text,
Left_Right text,
Strokes_Gained_Over_Baseline double,
Strokes_Gained_Category text,
Recovery_Shot text);

TRUNCATE TABLE pga_tour_2017;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/PGA/2017_rshot.csv' 
INTO TABLE pga_tour_2017
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

DROP TABLE pga_tournaments;
CREATE TABLE pga_tournaments (
Year int(4),
Tournament_ID int(3),
Tournament_Name text,
Ranking_Points int(4),
Par INT(2),
Max_Ranking_Points int(4)
);

TRUNCATE TABLE pga_tournaments;
LOAD DATA LOCAL INFILE '/home/mis/Downloads/Datasets/PGA/pga_tournaments.csv' 
INTO TABLE pga_tournaments
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

ALTER TABLE `clutch`.`pga_tour_2016_sample` 
CHANGE COLUMN `Year` `Year` INT(11) NOT NULL ,
CHANGE COLUMN `Tournament_ID` `Tournament_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Player_ID` `Player_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Course_ID` `Course_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Permanent_Tournament_ID` `Permanent_Tournament_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Round` `Round` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Hole` `Hole` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Shot` `Shot` BIGINT(20) NOT NULL ,
ADD PRIMARY KEY (`Year`, `Tournament_ID`, `Player_ID`, `Permanent_Tournament_ID`, `Course_ID`, `Round`, `Hole`, `Shot`);

CREATE INDEX p16_samp_player ON `clutch`.`pga_tour_2016_sample` (`Player_ID`);

ALTER TABLE `clutch`.`pga_tour_2017_sample` 
CHANGE COLUMN `Year` `Year` INT(11) NOT NULL ,
CHANGE COLUMN `Tournament_ID` `Tournament_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Player_ID` `Player_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Course_ID` `Course_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Permanent_Tournament_ID` `Permanent_Tournament_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Round` `Round` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Hole` `Hole` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Shot` `Shot` BIGINT(20) NOT NULL ,
ADD PRIMARY KEY (`Year`, `Tournament_ID`, `Player_ID`, `Permanent_Tournament_ID`, `Course_ID`, `Round`, `Hole`, `Shot`);

CREATE INDEX p17_samp_player ON `clutch`.`pga_tour_2017_sample` (`Player_ID`);

ALTER TABLE `clutch`.`pga_tour_2016` 
CHANGE COLUMN `Year` `Year` INT(11) NOT NULL ,
CHANGE COLUMN `Tournament_ID` `Tournament_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Player_ID` `Player_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Course_ID` `Course_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Permanent_Tournament_ID` `Permanent_Tournament_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Round` `Round` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Hole` `Hole` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Shot` `Shot` BIGINT(20) NOT NULL ,
ADD PRIMARY KEY (`Year`, `Tournament_ID`, `Player_ID`, `Permanent_Tournament_ID`, `Course_ID`, `Round`, `Hole`, `Shot`);

CREATE INDEX p16_player ON `clutch`.`pga_tour_2016` (`Player_ID`);

ALTER TABLE `clutch`.`pga_tour_2017` 
CHANGE COLUMN `Year` `Year` INT(11) NOT NULL ,
CHANGE COLUMN `Tournament_ID` `Tournament_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Player_ID` `Player_ID` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Course_ID` `Course_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Permanent_Tournament_ID` `Permanent_Tournament_ID` INT(11) NOT NULL ,
CHANGE COLUMN `Round` `Round` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Hole` `Hole` BIGINT(20) NOT NULL ,
CHANGE COLUMN `Shot` `Shot` BIGINT(20) NOT NULL ,
ADD PRIMARY KEY (`Year`, `Tournament_ID`, `Player_ID`, `Permanent_Tournament_ID`, `Course_ID`, `Round`, `Hole`, `Shot`);

CREATE INDEX p17_player ON `clutch`.`pga_tour_2017` (`Player_ID`);

ALTER TABLE `clutch`.`pga_tournaments`
CHANGE COLUMN `Year` `Year` int(4) NOT NULL ,
CHANGE COLUMN `Tournament_ID` `Tournament_ID` int(3) NOT NULL ,
ADD PRIMARY KEY (`Year`, `Tournament_ID`);

DROP TABLE pga_players;
CREATE TABLE pga_players AS
SELECT DISTINCT CONCAT(Player_First_Name, " ", Player_Last_Name) AS Player_Name, Player_ID AS Player_ID FROM pga_tour_2016
UNION
SELECT DISTINCT CONCAT(Player_First_Name, " ", Player_Last_Name) AS Player_Name, Player_ID AS Player_ID FROM pga_tour_2017;
DELETE FROM pga_players WHERE PLayer_Name IN ('Dru Love','Willy Wilcox','S.J. Park','Thorbjorn Olesen','ALex Noren','Soren Kjeldsen');

CREATE INDEX idx_pp_playerid ON pga_players (Player_ID);

SELECT COUNT(*) FROM pga_tour_2016_sample;
SELECT COUNT(*) FROM pga_tour_2017_sample;
SELECT COUNT(*) FROM pga_tour_2016;
SELECT COUNT(*) FROM pga_tour_2017;
SELECT COUNT(*) FROM pga_tournaments;
SELECT COUNT(*) FROM pga_players;

DROP TABLE IF EXISTS pga_single_shot_results;
CREATE TABLE pga_single_shot_results (
	id INTEGER AUTO_INCREMENT PRIMARY KEY,
    date_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    p_tournament_id INT, 
    p_player_id INT, 
    p_round INT, 
    p_hole INT, 
    p_shot INT, 
    p_year_id INT,
	vf_load_cycle_factor FLOAT,
	vf_scoring_diff_factor FLOAT,
	vf_stakes_factor FLOAT,
    vf_accuracy_factor FLOAT,
	vf_fatigue_factor FLOAT,
	vf_clutch_factor FLOAT,
    vt_player_name TEXT,
    p_par INT
);

#Creating results of clutch approximation variation from the curve (clutch parameter)
CREATE TABLE pga_2016_clutch_results AS 
SELECT 
	pp.Player_Name,
	ssr.p_player_id, 
	SUM(ssr.vf_clutch_factor) AS summ, 
    AVG(ssr.vf_clutch_factor) as aver,
    COUNT(ssr.vf_clutch_factor) AS total,
    -0.00837004 * ln(COUNT(ssr.vf_clutch_factor)) + 0.631507 AS clutch,
    AVG(ssr.vf_clutch_factor) - (-0.00837004 * ln(COUNT(ssr.vf_clutch_factor)) + 0.631507) aver_over_clutch
FROM pga_single_shot_results ssr
JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID
WHERE ssr.p_year_id = 2016
GROUP BY pp.Player_Name, ssr.p_player_id
ORDER BY aver_over_clutch DESC;

CREATE TABLE pga_2017_clutch_results AS 
SELECT 
	pp.Player_Name,
	ssr.p_player_id, 
	SUM(ssr.vf_clutch_factor) AS summ, 
    AVG(ssr.vf_clutch_factor) as aver,
    COUNT(ssr.vf_clutch_factor) AS total,
    -0.00837004 * ln(COUNT(ssr.vf_clutch_factor)) + 0.631507 AS clutch,
    AVG(ssr.vf_clutch_factor) - (-0.00837004 * ln(COUNT(ssr.vf_clutch_factor)) + 0.631507) aver_over_clutch
FROM pga_single_shot_results ssr
JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID
WHERE ssr.p_year_id = 2017
GROUP BY pp.Player_Name, ssr.p_player_id
ORDER BY aver_over_clutch DESC;