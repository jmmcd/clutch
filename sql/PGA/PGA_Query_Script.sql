DELETE FROM pga_single_shot_results; WHERE p_year_id = 2016; AND p_tournament_id IN (10,40,70,100);
COMMIT;	
CREATE TABLE pga_single_shot_results_bkp AS SELECT * FROM pga_single_shot_results;

DROP TABLE pga_2016_clutch_results;
CREATE TABLE pga_2016_clutch_results AS 
SELECT 
	pp.Player_Name,
	ssr.p_player_id, 
	SUM(ssr.vf_clutch_factor) AS summ, 
    AVG(ssr.vf_clutch_factor) as aver,
    COUNT(ssr.vf_clutch_factor) AS total,
    -0.00701792 * ln(COUNT(ssr.vf_clutch_factor)) + 0.625019 AS clutch,
    AVG(ssr.vf_clutch_factor) - (-0.00701792 * ln(COUNT(ssr.vf_clutch_factor)) + 0.625019) aver_over_clutch
FROM pga_single_shot_results ssr
JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID
WHERE ssr.p_year_id = 2016
GROUP BY pp.Player_Name, ssr.p_player_id
ORDER BY aver_over_clutch DESC;

SELECT * FROM pga_2016_clutch_results;

DROP TABLE pga_2017_clutch_results;
CREATE TABLE pga_2017_clutch_results AS 
SELECT 
	pp.Player_Name,
	ssr.p_player_id, 
	SUM(ssr.vf_clutch_factor) AS summ, 
    AVG(ssr.vf_clutch_factor) as aver,
    COUNT(ssr.vf_clutch_factor) AS total,
    -0.00701792 * ln(COUNT(ssr.vf_clutch_factor)) + 0.625019 AS clutch,
    AVG(ssr.vf_clutch_factor) - (-0.00701792 * ln(COUNT(ssr.vf_clutch_factor)) + 0.625019) aver_over_clutch
FROM pga_single_shot_results ssr
JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID
WHERE ssr.p_year_id = 2017
AND p_tournament_id NOT IN (280)
GROUP BY pp.Player_Name, ssr.p_player_id
#ORDER BY aver_over_clutch DESC
;


SELECT COUNT(*) FROM pga_single_shot_results WHERE p_year_id = 2017;
SELECT * FROM pga_single_shot_results WHERE p_year_id = 2017 AND p_player_id = 23633;

SELECT `Player Name`, ` Player Number`, `Finish Position(numeric)`, `Round 1 Score`, `Round 2 Score` , `Round 3 Score` , `Round 4 Score`, `Total Strokes`,`Round 1 Pos`, `Round 2 Pos`, `Round 3 Pos`,`Round 4 Pos`
FROM pga_tournament_results WHERE `Tournament Year` = 2016 AND `Tournament Number` = 10 ORDER BY `Finish Position(numeric)`,`Round 4 Score`;

SELECT pp.Player_Name, ssr.p_player_id, AVG(ssr.vf_clutch_factor) AS average, SUM(ssr.vf_clutch_factor) AS FACTOR, COUNT(*) FROM pga_single_shot_results ssr 
JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID 
JOIN pga_tournaments tour ON ssr.p_tournament_id = tour.Tournament_ID AND ssr.p_year_id = tour.Year
WHERE 
ssr.p_tournament_id = 10 AND 
ssr.p_year_id = 2016 
#AND ssr.p_round IN (4)
GROUP BY pp.Player_Name, ssr.p_player_id ORDER BY average DESC;

#AVERAGE ?? FACTOR PER ROUND
SELECT SUM(rounds.FACTOR), SUM(rounds.FACTOR_Per_Shot)  /  COUNT(*) AS FACTOR_Per_Round,rounds.p_round FROM (
	SELECT ssr.p_round, SUM(ssr.vf_accuracy_factor) AS FACTOR, SUM(ssr.vf_accuracy_factor)  /  COUNT(*) AS FACTOR_Per_Shot, COUNT(*) AS shot_count FROM pga_single_shot_results ssr 
	JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID 
	JOIN pga_tournaments tour ON ssr.p_tournament_id = tour.Tournament_ID AND ssr.p_year_id = tour.Year
	WHERE 1=1 
    #AND pp.Player_Name = 'Dustin Johnson'
    #AND ssr.p_tournament_id = 10 
    AND ssr.p_year_id = 2016 #AND ssr.p_round IN (4)
    GROUP BY ssr.p_round
) AS rounds
GROUP BY rounds.p_round
ORDER BY FACTOR_Per_Round DESC;

#AVERAGE FACTOR PER PLAYER PER ROUND
SELECT rounds.Player_Name, rounds.p_player_id, SUM(rounds.FACTOR), SUM(rounds.FACTOR_Per_Shot)  /  COUNT(*) AS FACTOR_Per_Round, rounds.shot_count, rounds.p_round FROM (
	SELECT pp.Player_Name, ssr.p_round, ssr.p_player_id, SUM(ssr.vf_clutch_factor) AS FACTOR, SUM(ssr.vf_clutch_factor)  /  COUNT(*) AS FACTOR_Per_Shot, COUNT(*) AS shot_count FROM pga_single_shot_results ssr 
	JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID 
	JOIN pga_tournaments tour ON ssr.p_tournament_id = tour.Tournament_ID AND ssr.p_year_id = tour.Year
	WHERE 1=1 AND ssr.p_tournament_id = 10 AND ssr.p_year_id = 2016 #AND ssr.p_round IN (4)
    GROUP BY pp.Player_Name, ssr.p_player_id, ssr.p_round
) AS rounds
GROUP BY rounds.Player_Name, rounds.p_player_id, rounds.shot_count, rounds.p_round
ORDER BY FACTOR_Per_Round DESC;




SELECT pp.Player_Name, ssr.p_player_id, SUM(ssr.vf_clutch_factor) AS FACTOR, SUM(ssr.vf_clutch_factor)  /  COUNT(*) AS FACTOR_Per_Shot, COUNT(*) FROM pga_single_shot_results ssr 
	JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID 
	JOIN pga_tournaments tour ON ssr.p_tournament_id = tour.Tournament_ID AND ssr.p_year_id = tour.Year
	WHERE ssr.p_tournament_id = 40 AND ssr.p_year_id = 2016 #AND ssr.p_round IN (1)
    GROUP BY pp.Player_Name, ssr.p_player_id#, ssr.p_round
    ORDER BY FACTOR_Per_Shot DESC;

SELECT pga.*, ( ((pga.round - 1) * 70) + ((pga.hole - 1) * 4) + pga.Shot) FROM pga_tour_2016 pga WHERE Player_ID;

SELECT p_tournament_id, vt_player_name, COUNT(*),
SUM(vf_load_cycle_factor),SUM(vf_scoring_diff_factor),SUM(vf_stakes_factor),SUM(vf_accuracy_factor),SUM(vf_fatigue_factor),SUM(vf_clutch_factor),
AVG(vf_load_cycle_factor),AVG(vf_scoring_diff_factor),AVG(vf_stakes_factor),AVG(vf_accuracy_factor),AVG(vf_fatigue_factor),AVG(vf_clutch_factor)  
FROM pga_single_shot_results
WHERE p_Tournament_ID IN (10)
AND p_Player_ID IN (26331,28132,31646,29518)
AND p_year_id = 2016
GROUP BY p_tournament_id, vt_player_name;

SELECT * FROM pga_single_shot_results
WHERE p_Tournament_ID IN (10)
AND p_Player_ID IN (29518)#(23800,32200)
#AND p_Round = 4
#AND p_Hole = 1810
#AND vt_player_name = 'Hudson Swafford'
AND p_year_id = 2016
#ORDER BY vf_clutch_factor DESC
ORDER BY p_round, p_hole, p_shot, p_player_id
;

SELECT fn_pga_get_current_score(70, 21731, 3, 9, 2016) FROM DUAL;
SELECT fn_pga_get_current_score(10, 34264, 3, 18, 2016) FROM DUAL;
CALL pr_pga_calculate_single_shot(10, 36801, 4, 11, 3, 2016);
CALL pr_pga_calculate_single_shot(10, 10213, 1, 14, 3, 2016);
CALL pr_pga_clean_pr_shots_2016();
CALL pr_pga_clean_pr_shots_2017();

SELECT * FROM pga_single_shot_results 
WHERE p_year_id = 2017
AND P
#AND vf_scoring_diff_factor IS NULL 
ORDER BY id;

SELECT COUNT(*) FROM pga_tour_2016
WHERE Shot_Type NOT IN ('P', 'D', 'Pr', 'C')
#AND Tournament_ID = 40
#AND Round = 4
#AND Hole = 2
#AND Shot = 1
#AND Player_ID IN (23800,32200)
AND Distance_To_Pin_Ft > 0
;

        
SELECT DISTINCT(Tournament_ID) FROM pga_tour_2016 ORDER BY Tournament_ID; 
SELECT * FROM pga_single_shot_results WHERE p_year_id = 2016 ORDER BY p_tournament_id; 
#WHERE p_player_id = 29518
WHERE p_player_id >= 49964
#AND p_round = 3
#AND p_hole = 10
ORDER BY VF_CLUTCH_FACTOR DESC
;





SELECT * FROM pga_tournaments WHERE Year =  2016; WHERE Tournament_ID IN(280);
SELECT * FROM pga_players;
SELECT * FROM pga_tournaments WHERE Year =  2017 AND Ranking_Points < 100; Tournament_ID NOT IN (
	SELECT Tournament_ID FROM pga_tournaments WHERE Year = 2016);

SELECT MAX(Distance_Ft) FROM pga_tour_2016;	
SELECT MAX(Distance_Ft) FROM pga_tour_2017;	
SELECT DISTINCT Tournament_ID, Tournament_Name FROM pga_tour_2016;
SELECT * FROM pga_tournaments WHERE Year =  2017 ORDER BY Ranking_Points;
SELECT DISTINCT pga.Tournament_ID, pga.Tournament_Name FROM pga_tour_2017 pga
INNER JOIN pga_tournaments tour ON pga.Tournament_ID = tour.Tournament_ID AND pga.`Year` = tour.`Year` ORDER BY pga.Tournament_ID;

SELECT DISTINCT(Shot_Type) FROM pga_tour_2016;
SELECT DISTINCT(Num_Strokes) FROM pga_tour_2016;
SELECT COUNT(*) FROM pga_tour_2017 WHERE Shot_Type = 'C';
SELECT * FROM pga_tour_2016 WHERE Num_Strokes = 0;

SELECT * FROM pga_tour_2017 
WHERE Shot_Type NOT IN ('P', 'D', 'Pr', 'C') 
AND Tournament_ID NOT IN (220) # Match Play Exemption
AND Distance_To_Pin_Ft > 0
AND Hole_Score > 0
ORDER BY Strokes_Gained_Over_Baseline;

SELECT MAX(Strokes_Gained_Over_Baseline) FROM pga_tour_2016;
SELECT MIN(Strokes_Gained_Over_Baseline) FROM pga_tour_2016;

SELECT *
#tour.*, pga.*
#INTO vf_load_cycle, vf_scoring_diff, vf_stakes, vf_accuracy, vf_fatigue, vf_max_load_cycle
FROM pga_tour_2016 pga
INNER JOIN pga_tournaments tour ON pga.Tournament_ID = tour.Tournament_ID AND pga.Year = tour.Year
WHERE pga.Tournament_ID = 40
AND Player_ID = 49191
#AND Round = 3
#AND Hole = 10
#AND Shot = 3
;

