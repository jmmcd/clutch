DROP FUNCTION IF EXISTS fn_nba_get_player_fatigue;
DELIMITER //
CREATE FUNCTION fn_nba_get_player_fatigue (
    game_id INT(20),
    play_id INT(11),
    player TEXT,
    year_id INT(4)) RETURNS INTEGER
	
    BEGIN
	
		DECLARE vn_fatigue INTEGER;
    
		IF (year_id = 2016) THEN
			SELECT SUM(play_length)
            INTO vn_fatigue
			FROM nba_2016 nba
			WHERE nba.game_id = game_id
            AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST (player)
			AND nba.play_id <= play_id;
		ELSEIF (year_id = 2017) THEN 
			SELECT SUM(play_length)
            INTO vn_fatigue
			FROM nba_2017 nba
			WHERE nba.game_id = game_id
            AND MATCH (nba.a1,nba.a2,nba.a3,nba.a4,nba.a5,nba.h1,nba.h2,nba.h3,nba.h4,nba.h5) AGAINST (player)
			AND nba.play_id <= play_id;
		END IF;

		RETURN vn_fatigue;
	END;
    