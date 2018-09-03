DROP FUNCTION IF EXISTS fn_pga_get_current_score;
DELIMITER //
CREATE FUNCTION fn_pga_get_current_score (
    p_tournament_id INT(20),
    p_player_id TEXT,
    p_round INT,
    p_hole INT,
    p_year_id INT(4)) RETURNS INTEGER
	
    BEGIN
	
		DECLARE vn_current_score INTEGER;
        
        IF p_hole <= 1 THEN
			SET vn_current_score = 0;
		ELSE 
			IF (p_year_id = 2016) THEN
				SELECT SUM(hole_to_par) 
				INTO vn_current_score 
				FROM (
					SELECT DISTINCT Hole_Score - Par_Value AS hole_to_par, Hole_Score, Par_Value, Hole 
					FROM pga_tour_2016 pga WHERE pga.Tournament_ID = p_tournament_id
					AND Player_ID = p_player_id
					AND Round = p_round
					AND Hole < p_hole) AS holes;
			ELSEIF (p_year_id = 2017) THEN 
				SELECT SUM(hole_to_par)
				INTO vn_current_score 
				FROM (
					SELECT DISTINCT Hole_Score - Par_Value AS hole_to_par, Hole_Score, Par_Value, Hole 
					FROM pga_tour_2017 pga WHERE pga.Tournament_ID = p_tournament_id
					AND Player_ID = p_player_id
					AND Round = p_round
					AND Hole < p_hole) AS holes;
			END IF;
		END IF;
		
		RETURN vn_current_score;
	END;
    