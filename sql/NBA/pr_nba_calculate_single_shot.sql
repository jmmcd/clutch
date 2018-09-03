DROP PROCEDURE IF EXISTS pr_nba_calculate_single_shot;
DELIMITER //
CREATE PROCEDURE pr_nba_calculate_single_shot (
    game_id INT(20),
    play_id INT(11),
    player TEXT,
    year_id INT(4)) #RETURNS FLOAT
	
    BEGIN
        
        DECLARE vf_load_cycle FLOAT;
        DECLARE vf_scoring_diff FLOAT;
        DECLARE vf_stakes FLOAT;
        DECLARE vf_accuracy FLOAT;
        DECLARE vf_fatigue FLOAT;
        DECLARE vf_max_load_cycle FLOAT;
        DECLARE vi_points INT;
        
        DECLARE vf_load_cycle_factor FLOAT;
        DECLARE vf_scoring_diff_factor FLOAT;
        DECLARE vf_stakes_factor FLOAT;
        DECLARE vf_accuracy_factor FLOAT;
        DECLARE vf_fatigue_factor FLOAT;
        DECLARE vf_clutch_factor FLOAT;
        
        
        DECLARE cf_max_scoring_margin INT DEFAULT 53; # Highest scoring differential in both datasets combined
        DECLARE cf_max_accuracy_range INT DEFAULT 88;
        DECLARE cf_max_fatigue_secs INT DEFAULT 3586;
        DECLARE ci_max_game_id INT DEFAULT 1907; #19 signifies playoff finals, 7 potential games;
        
        DECLARE cf_load_cycle_baseline FLOAT DEFAULT 0.5;
        DECLARE cf_scoring_diff_multiplier FLOAT DEFAULT 0.5;
        DECLARE cf_stakes_baseline FLOAT DEFAULT 0.4;
        DECLARE cf_accuracy_baseline FLOAT DEFAULT 0.4;
        DECLARE cf_difficulty_baseline FLOAT DEFAULT 0.2;
        DECLARE cf_fatigue_baseline FLOAT DEFAULT 0.5;
        
        #MUST SUM TO 1.0 
        DECLARE cf_load_cycle_importance FLOAT DEFAULT 0.20;
        DECLARE cf_scoring_diff_importance FLOAT DEFAULT 0.20;
        DECLARE cf_stakes_importance FLOAT DEFAULT 0.20;
        DECLARE cf_accuracy_importance FLOAT DEFAULT 0.20;
        DECLARE cf_fatigue_importance FLOAT DEFAULT 0.20;
    
		IF (year_id = 2016) THEN
			SELECT 
				play_id,
                CASE WHEN home_away_ind = 'H' THEN (home_score - away_score)
                WHEN home_away_ind = 'A' THEN (away_score - home_score) END,
                game_id / ci_max_game_id,
				shot_distance,
                player_load_cycles,
                load_cycles,
                points
            INTO vf_load_cycle, vf_scoring_diff, vf_stakes, vf_accuracy, vf_fatigue, vf_max_load_cycle, vi_points 
			FROM nba_2016 nba
			WHERE nba.game_id = game_id
			#AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST (player)
			AND nba.play_id = play_id;
		ELSEIF (year_id = 2017) THEN 
			SELECT
				play_id,
                CASE WHEN home_away_ind = 'H' THEN (home_score - away_score)
                WHEN home_away_ind = 'A' THEN (away_score - home_score) END,
				game_id / ci_max_game_id,
				shot_distance,
                player_load_cycles,
                load_cycles,
                points
            INTO vf_load_cycle, vf_scoring_diff, vf_stakes, vf_accuracy, vf_fatigue, vf_max_load_cycle, vi_points 
			FROM nba_2017 nba
			WHERE nba.game_id = game_id
			#AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST (player)
			AND nba.play_id = play_id;
			END IF;
        
        SET vf_load_cycle_factor = (cf_load_cycle_baseline / 2) + (POWER( (vf_load_cycle / vf_max_load_cycle), 2) * (1 - cf_load_cycle_baseline) );
        #Setting min / max difficulty of shot at +/- 30, beyond that less critical as gap is too wide 
		SET vf_scoring_diff_factor =  cf_scoring_diff_multiplier - vf_scoring_diff / (cf_max_scoring_margin * (1 / cf_scoring_diff_multiplier));
        #Max. shot distance is 88
        SET vf_stakes_factor = cf_stakes_baseline + (vf_stakes * (1 - cf_stakes_baseline) );
        SET vf_accuracy_factor = cf_accuracy_baseline + ((vf_accuracy / cf_max_accuracy_range) * (1 - cf_accuracy_baseline));
        SET vf_fatigue_factor = (cf_fatigue_baseline / 2) + ( (vf_fatigue / cf_max_fatigue_secs) * (1 - cf_fatigue_baseline) );
        #SET vf_clutch_factor = vf_load_cycle_factor * vfd_scoring_diff_factor / vf_max_load_cycle;
        SET vf_clutch_factor = ( 
			(cf_load_cycle_importance * vf_load_cycle_factor) + 
            (cf_scoring_diff_importance * vf_scoring_diff_factor) + 
            (cf_stakes_importance * vf_stakes_factor) + 
            (cf_accuracy_importance * vf_accuracy_factor) + 
            (cf_fatigue_importance * vf_fatigue_factor) );

		INSERT INTO nba_single_shot_results (game_id, play_id, player, year_id, vf_load_cycle_factor, vf_scoring_diff_factor,
			vf_stakes_factor, vf_accuracy_factor, vf_fatigue_factor, vf_clutch_factor, vi_points)
		VALUES (game_id, play_id, player, year_id, vf_load_cycle_factor, vf_scoring_diff_factor, vf_stakes_factor, 
			vf_accuracy_factor, vf_fatigue_factor, vf_clutch_factor, vi_points);
        
		#RETURN vf_clutch_factor;
	END;