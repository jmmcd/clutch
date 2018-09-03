DROP FUNCTION fn_nba_get_home_away_flag;
DELIMITER //
CREATE FUNCTION fn_nba_get_home_away_flag (
    game_id INT(20),
    play_id INT(11),
    year_id INT(4)) RETURNS TEXT
	
    BEGIN
	
		DECLARE vt_player CHAR(1);
    
		IF (year_id = 2016) THEN
			SELECT CASE WHEN ( nba.h1 = nba.player OR nba.h2 = nba.player OR nba.h3 = nba.player OR nba.h4 = nba.player OR nba.h5 = nba.player) THEN 'H'
            WHEN ( nba.a1 = nba.player OR nba.a2 = nba.player OR nba.a3 = nba.player OR nba.a4 = nba.player OR nba.a5 = nba.player) THEN 'A'
            ELSE 'N' END
            INTO vt_player
			FROM nba_2016 nba
			WHERE nba.game_id = game_id
			AND nba.play_id = play_id;
		ELSEIF (year_id = 2017) THEN 
			SELECT CASE WHEN ( nba.h1 = nba.player OR nba.h2 = nba.player OR nba.h3 = nba.player OR nba.h4 = nba.player OR nba.h5 = nba.player) THEN 'H'
            WHEN ( nba.a1 = nba.player OR nba.a2 = nba.player OR nba.a3 = nba.player OR nba.a4 = nba.player OR nba.a5 = nba.player) THEN 'A'
            ELSE 'N' END
            INTO vt_player
			FROM nba_2017 nba
			WHERE nba.game_id = game_id
			AND nba.play_id = play_id;
		END IF;

		RETURN vt_player;
	END;