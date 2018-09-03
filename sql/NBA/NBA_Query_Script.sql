SELECT * FROM nba_2016_clutch_results WHERE total >= 260 ORDER BY aver_over_clutch DESC; #2,599 max attempts for 2016
SELECT * FROM nba_2017_clutch_results WHERE total >= 300 ORDER BY aver_over_clutch DESC; #3,003 max attempts for 2017
SELECT cr16.player,  FROM nba_2016_clutch_results cr16 JOIN nba_2017_clutch_results cr17 ON cr16.player = cr17.player
ORDER BY ;
SELECT MAX(total) FROM nba_2017_clutch_results;
SELECT COUNT(*) FROM nba_single_shot_results WHERE year_id = 2017;


#DELETE FROM nba_single_shot_results WHERE year_id = 2016; AND game_id > 1900;
CALL pr_nba_calculate_single_shot(21600003, 184, 'Stephen Curry', 2017);
CALL pr_nba_calculate_single_shot(21600003, 532, 'Ian Clark', 2017);

SELECT fn_nba_get_home_away_flag(21500003,  184, 2016) FROM DUAL;
SELECT fn_nba_get_home_away_flag(21500003,  184, 2016) FROM DUAL;
SELECT fn_nba_get_player_load_cycles(21600003, 532, 'Ian Clark', 2017);
SELECT fn_nba_get_player_fatigue(21600003, 532, 'Ian Clark', 2017);
SELECT fn_nba_get_player_fatigue(21600003, 184, 'Stephen Curry', 2017);

SELECT MAX() FROM nba_2016;
SELECT * FROM nba_single_shot_results WHERE year_id = 2017;
AND game_id > 1900 
ORDER BY vf_clutch_factor DESC;

SELECT *
#MAX(load_cycles) 
FROM nba_2016 nba WHERE 1=1
#AND nba.game_id = 21600005
AND player = 'James Harden'
#AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST ('Ian Clark')
#AND nba.play_id = 451
AND event_type IN ('shot', 'miss', 'free throw')
;
            
SELECT SUM(play_length) FROM nba_2016_sample;

#TRUNCATE nba_single_shot_results;
SELECT COUNT(*) FROM nba_single_shot_results; ORDER BY id DESC; 
SELECT COUNT(*) FROM nba_2016;
CALL pr_run_nba_cycles_batch_2016();
CALL pr_run_nba_cycles_batch_2017();
CALL pr_run_nba_batch();
#mysql --user=mis -p --execute "CALL pr_run_nba_cycles_batch_2017()" clutch
SELECT COUNT(*) FROM nba_2016 WHERE player_load_cycles > 0;
SELECT COUNT(*) FROM nba_2017 WHERE player_load_cycles > 0;

SELECT DISTINCT(game_id) FROM nba_2017; WHERE player_load_cycles > 0;
SELECT MAX(game_id) FROM nba_2016 WHERE player_load_cycles > 0;

#TRUNCATE nba_single_shot_results;
SELECT fn_nba_get_home_away_flag(21500003,  184, 2016) FROM DUAL;

SELECT fn_nba_get_player_load_cycles(21600003, 532, 'Stephen Curry', 2017);
SELECT fn_nba_get_player_load_cycles(21600003, 532, 'Ian Clark', 2017);

SELECT game_id, play_id, player, 2017 FROM nba_2017 WHERE game_id = 21600003 AND event_type IN ('shot', 'miss', 'free throw');
     
SELECT 0.2 + ( (139 / 532) * (1 - 0.2) ) FROM DUAL;     
#Individual player / game data query
SELECT * 
#COUNT(*)
#game_id, period, away_score,
#home_score, remaining_time, elapsed, play_id, team, event_type, num, opponent, outof, player, points, reason,
#result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y
FROM nba_2017
WHERE game_id = 21600003
#AND player = 'Stephen Curry'
#AND event_type IN ('shot', 'miss', 'free throw')
#AND shot_distance > 0
AND play_id = 532
;

SELECT MAX(shot_distance) FROM nba_2017;
SELECT MAX(shot_distance) FROM nba_2016;

SELECT DISTINCT
	play_id,
	CASE WHEN home_away_ind = 'H' THEN (home_score - away_score)
	WHEN home_away_ind = 'A' THEN (away_score - home_score) END,
	CASE WHEN data_set = '2016-2017 Regular Season' THEN 0.25
	WHEN data_set = '2017 Playoff' THEN 0.5 END,
	shot_distance,
	play_length,
	load_cycles
FROM nba_2017 nba
WHERE nba.game_id = 21600003
AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST ('Stephen Curry')
#AND event_type IN ('shot', 'miss', 'free throw')	#AND shot_distance > 0
AND nba.play_id <= 184;

SELECT COUNT(*)
#INTO vn_cycles
FROM nba_2017 nba
WHERE nba.game_id = 21600003
AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST ('Stephen Curry')
AND nba.play_id <= 184;

SELECT 
#COUNT(*)
game_id, period, away_score,
home_score, remaining_time, elapsed, play_id, team, event_type, num, opponent, outof, player, points, reason,
result, steal, type, shot_distance, original_x, original_y, converted_x, converted_y
FROM nba_2017
WHERE game_id = 21600003
AND MATCH (a1,a2,a3,a4,a5,h1,h2,h3,h4,h5) AGAINST ('Stephen Curry')
#AND event_type IN ('shot', 'miss', 'free throw')
#AND shot_distance > 0
AND play_id < 45
;

SELECT SUM(rounds.FACTOR), SUM(rounds.FACTOR_Per_Shot)  /  COUNT(*) AS FACTOR_Per_Round,rounds.p_round FROM (
	SELECT ssr.p_round, SUM(ssr.vf_clutch_factor) AS FACTOR, SUM(ssr.vf_clutch_factor)  /  COUNT(*) AS FACTOR_Per_Shot, COUNT(*) AS shot_count FROM pga_single_shot_results ssr 
	JOIN pga_players pp ON ssr.p_player_id = pp.Player_ID 
	JOIN pga_tournaments tour ON ssr.p_tournament_id = tour.Tournament_ID AND ssr.p_year_id = tour.Year
	WHERE 1=1 
    #AND ssr.p_tournament_id = 10 
    AND ssr.p_year_id = 2017 #AND ssr.p_round IN (4)
    GROUP BY ssr.p_round
) AS rounds
GROUP BY rounds.p_round
ORDER BY FACTOR_Per_Round DESC;

#AVERAGE FACTOR PER QUARTER
SELECT n16.period, SUM(ssr.vf_clutch_factor), SUM(ssr.vf_clutch_factor)  /  COUNT(*) AS Clutch_Per_Quarter FROM nba_single_shot_results ssr
JOIN nba_2016 n16 ON ssr.game_id = n16.game_id AND ssr.play_id = n16.play_id
WHERE 1=1
AND year_id = 2016
GROUP BY n16.period;

SELECT n17.period, SUM(ssr.vf_clutch_factor), SUM(ssr.vf_clutch_factor)  /  COUNT(*) AS Clutch_Per_Quarter FROM nba_single_shot_results ssr
JOIN nba_2017 n17 ON ssr.game_id = n17.game_id AND ssr.play_id = n17.play_id
WHERE 1=1
AND year_id = 2017
GROUP BY n17.period;

SELECT * from nba_2016_sample;
SELECT DISTINCT(data_set) from nba_2017;

UPDATE nba_2017_sample a SET load_cycles = (SELECT MAX(b.play_id) FROM nba_2017_sample b WHERE b.game_id = a.game_id);
SELECT DISTINCT(MAX(play_id)) FROM nba_2017_sample WHERE game_id = 21600001;

UPDATE nba_2017_sample nba JOIN
(SELECT a.play_id, b.game_id, b.max_load_cycles from nba_2017 a 
INNER JOIN (
SELECT game_id, MAX(play_id) AS max_load_cycles
FROM nba_2017_sample
GROUP
BY game_id) AS b ON a.game_id = b.game_id) AS load_cycles
ON nba.game_id = load_cycles.game_id
AND nba.play_id = load_cycles.play_id
SET load_cycles = load_cycles.max_load_cycles
WHERE nba.game_id = load_cycles.game_id
AND nba.play_id = load_cycles.play_id; 

UPDATE nba_2017_sample nba JOIN
(SELECT nba.player, np.player_name, np.player_id
FROM nba_2017_sample nba
JOIN nba_players np ON nba.player = np.player_name) AS player_join
ON nba.player = player_join.player_name
SET nba.player_id = player_join.player_id
WHERE nba.player = player_join.player_name;

UPDATE nba_2017_sample nba JOIN nba_2017_sample nba2
ON nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id
SET nba.home_away_ind = fn_nba_get_home_away_flag(nba2.game_id, nba2.play_id, 2017)
WHERE nba.game_id = nba2.game_id
AND nba.play_id = nba2.play_id;

SELECT * FROM nba_2017;
SELECT * FROM nba_2016_sample;

SELECT * FROM nba_2017 WHERE load_cycles IS NULL;    
 
SELECT * FROM nba_2016 WHERE event_type = 'miss' AND shot_distance = 0;
SELECT COUNT(*) FROM nba_2017 WHERE event_type = 'miss' AND shot_distance = 0 AND type LIKE '%Dunk%';

SELECT * FROM nba_2017_sample;

SELECT * FROM nba_players;

SELECT DISTINCT game_id FROM nba_2017;