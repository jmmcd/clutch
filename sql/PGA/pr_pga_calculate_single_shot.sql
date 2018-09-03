DROP PROCEDURE IF EXISTS pr_pga_calculate_single_shot;
DELIMITER //
CREATE PROCEDURE pr_pga_calculate_single_shot (
    p_tournament_id INT(20),
    p_player_id TEXT,
    p_round INT,
    p_hole INT,
    p_shot INT,
    p_year_id INT(4)) #RETURNS FLOAT
	
    BEGIN
        
        DECLARE vf_load_cycle FLOAT;
        DECLARE vf_scoring_diff FLOAT;
        DECLARE vf_stakes FLOAT;
        DECLARE vf_accuracy FLOAT;
        DECLARE vf_distance FLOAT;
        DECLARE vf_shots_gained FLOAT;
        DECLARE vf_max_load_cycle FLOAT;
        DECLARE vi_par INT;
        DECLARE vt_player_name TEXT;
        DECLARE vi_shot INT;
        DECLARE vb_in_hole_flag TEXT;
        
        DECLARE vf_load_cycle_factor FLOAT;
        DECLARE vf_scoring_diff_factor FLOAT;
        DECLARE vf_stakes_factor FLOAT;
        DECLARE vf_accuracy_factor FLOAT;
        DECLARE vf_fatigue_factor FLOAT;
        DECLARE vf_clutch_factor FLOAT;
        
        DECLARE cf_max_scoring_margin INT DEFAULT 11;
        
        DECLARE cf_max_distance_2016 INT DEFAULT 14892;
        DECLARE cf_max_distance_2017 INT DEFAULT 16000;
        
        DECLARE cf_load_cycle_baseline FLOAT DEFAULT 0.5;
        DECLARE cf_scoring_diff_baseline FLOAT DEFAULT 0.5;
        DECLARE cf_stakes_baseline FLOAT DEFAULT 0.5;
        DECLARE cf_fatigue_baseline FLOAT DEFAULT 0.5;
        DECLARE cf_accuracy_baseline FLOAT DEFAULT 0.5;
        
        #MUST SUM TO 1.0 
        DECLARE cf_accuracy_multiplier FLOAT DEFAULT 0.2;
        DECLARE cf_difficulty_multiplier FLOAT DEFAULT 0.2;
		DECLARE cf_shots_gained_multiplier FLOAT DEFAULT 0.6;
        
        #USED TO REWARD UNDER PAR SCORES AND PENALISE OVER PAR SCORES
        DECLARE cf_par_multiplier FLOAT DEFAULT 0.7;
        
        #MUST SUM TO 1.0         
        DECLARE cf_load_cycle_importance FLOAT DEFAULT 0.20;
        DECLARE cf_scoring_diff_importance FLOAT DEFAULT 0.20;
        DECLARE cf_stakes_importance FLOAT DEFAULT 0.20;
        DECLARE cf_accuracy_importance FLOAT DEFAULT 0.20;
        DECLARE cf_fatigue_importance FLOAT DEFAULT 0.20;
    
		IF (p_year_id = 2016) THEN
            SELECT 
				LEAST( ( ( (pga.round - 1) * tour.Par) + ((pga.hole - 1) * 4) + pga.Shot),  tour.Par * 4),
                fn_pga_get_current_score (p_tournament_id, p_player_id, p_round, p_hole, p_year_id),
                tour.Ranking_Points / tour.Max_Ranking_Points,
				GREATEST(0, 1 - ( pga.Distance_To_Hole_After_Shot_Ft / pga.Distance_To_Pin_Ft)),
                pga.Distance_To_Pin_Ft / cf_max_distance_2016,
                Strokes_Gained_Over_Baseline / 3, #Realistic Min & Max Gain or loss is +/- 3 shots
				tour.Par * 4,
                play.Player_Name,
                pga.Par_Value,
                pga.In_The_Hole_Flag,
                pga.Shot
			INTO vf_load_cycle, vf_scoring_diff, vf_stakes, vf_accuracy, vf_distance, vf_shots_gained, vf_max_load_cycle, vt_player_name, vi_par, vb_in_hole_flag, vi_shot
			FROM pga_tour_2016 pga
			INNER JOIN pga_tournaments tour ON pga.Tournament_ID = tour.Tournament_ID AND pga.Year = tour.Year
            INNER JOIN pga_players play ON pga.Player_ID = play.Player_ID
			WHERE pga.Tournament_ID = p_tournament_id
			AND pga.Player_ID = p_player_id
			AND pga.Round = p_round
			AND pga.Hole = p_hole
			AND pga.Shot = p_shot;
		ELSEIF (p_year_id = 2017) THEN 
			SELECT 
                LEAST( ( ( (pga.round - 1) * tour.Par) + ((pga.hole - 1) * 4) + pga.Shot),  tour.Par * 4),
                fn_pga_get_current_score (p_tournament_id, p_player_id, p_round, p_hole, p_year_id),
                tour.Ranking_Points / tour.Max_Ranking_Points,
				GREATEST(0, 1 - ( pga.Distance_To_Hole_After_Shot_Ft / pga.Distance_To_Pin_Ft)),
                pga.Distance_To_Pin_Ft / cf_max_distance_2017,
                Strokes_Gained_Over_Baseline / 3, #Realistic Min & Max Gain or loss is +/- 3 shots
				tour.Par * 4,
                play.Player_Name,
                pga.Par_Value,
                pga.In_The_Hole_Flag,
                pga.Shot
			INTO vf_load_cycle, vf_scoring_diff, vf_stakes, vf_accuracy, vf_distance, vf_shots_gained, vf_max_load_cycle, vt_player_name, vi_par, vb_in_hole_flag, vi_shot
			FROM pga_tour_2017 pga
			INNER JOIN pga_tournaments tour ON pga.Tournament_ID = tour.Tournament_ID AND pga.Year = tour.Year
            INNER JOIN pga_players play ON pga.Player_ID = play.Player_ID
			WHERE pga.Tournament_ID = p_tournament_id
			AND pga.Player_ID = p_player_id
			AND pga.Round = p_round
			AND pga.Hole = p_hole
			AND pga.Shot = p_shot;
		END IF;
        
        SET vf_load_cycle_factor = (cf_load_cycle_baseline / 2) + ( POWER( (vf_load_cycle / vf_max_load_cycle), 2) * (1 - cf_load_cycle_baseline) );
        #Setting min / max difficulty of shot at +/- 30, beyond that less critical as gap is too wide 
		SET vf_scoring_diff_factor = cf_scoring_diff_baseline - (vf_scoring_diff / (cf_max_scoring_margin * (1 / cf_scoring_diff_baseline)));
        #Max. shot distance is 88
        SET vf_stakes_factor = cf_stakes_baseline + (vf_stakes * (1 - cf_stakes_baseline) );
        #SET vf_accuracy_factor = cf_accuracy_baseline + ((vf_accuracy / cf_max_accuracy_range) * (1 - cf_accuracy_baseline));
        SET vf_accuracy_factor = cf_accuracy_baseline + (GREATEST(0, (vf_distance * cf_difficulty_multiplier) + (vf_accuracy * cf_accuracy_multiplier) + (vf_shots_gained * cf_shots_gained_multiplier)) * (1 - cf_accuracy_baseline)); #END;
        SET vf_fatigue_factor = (cf_fatigue_baseline / 2) + ( (vf_load_cycle / vf_max_load_cycle) * (1 - cf_fatigue_baseline) );
        #SET vf_clutch_factor = vf_load_cycle_factor * vf_scoring_diff_factor / vf_max_load_cycle;
        SET vf_clutch_factor = ( 
			(cf_load_cycle_importance * vf_load_cycle_factor) + 
            (cf_scoring_diff_importance * vf_scoring_diff_factor) + 
            (cf_stakes_importance * vf_stakes_factor) + 
            (cf_accuracy_importance * vf_accuracy_factor) + 
            (cf_fatigue_importance * vf_fatigue_factor) ) ;
            
        IF (vb_in_hole_flag = 'Y' AND vi_shot < vi_par) THEN SET vf_clutch_factor = vf_clutch_factor / cf_par_multiplier;
        ELSEIF (vi_shot > vi_par) THEN SET vf_clutch_factor = vf_clutch_factor * cf_par_multiplier;
        END IF;

		INSERT INTO pga_single_shot_results (p_tournament_id, p_player_id, p_round, p_hole, p_shot, p_year_id, p_par,
			vf_load_cycle_factor, vf_scoring_diff_factor, vf_stakes_factor, vf_accuracy_factor, vf_fatigue_factor, vf_clutch_factor, vt_player_name)
		VALUES (p_tournament_id, p_player_id, p_round, p_hole, p_shot, p_year_id, vi_par,
			vf_load_cycle_factor, vf_scoring_diff_factor, vf_stakes_factor, vf_accuracy_factor, vf_fatigue_factor, vf_clutch_factor, vt_player_name);
        
		#RETURN vf_clutch_factor;
	END;