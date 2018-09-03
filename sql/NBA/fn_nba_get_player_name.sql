DROP FUNCTION fn_nba_get_player_name;
DELIMITER //
CREATE FUNCTION fn_nba_get_player_name (
    game_id INT(20),
    play_id INT(11),
    year_id INT(4)) RETURNS TEXT
	
    BEGIN
	
		DECLARE vt_player TEXT;
    
		IF (year_id = 2016) THEN
			SELECT player
            INTO vt_player
			FROM nba_2016 nba
			WHERE nba.game_id = game_id
			AND nba.play_id = play_id;
		ELSEIF (year_id = 2017) THEN 
			SELECT player
            INTO vt_player
			FROM nba_2076 nba
			WHERE nba.game_id = game_id
			AND nba.play_id = play_id;
		END IF;

		RETURN vt_player;
	END;
/