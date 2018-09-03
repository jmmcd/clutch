DELIMITER $$
 DROP PROCEDURE IF EXISTS pr_run_nba_cycles_batch_2017 $$
 CREATE PROCEDURE pr_run_nba_cycles_batch_2017()	
 BEGIN
   DECLARE p_game_id INT;
   -- this flag will be set to true when cursor reaches end of table
   DECLARE exit_loop BOOLEAN DEFAULT FALSE;         
   -- Declare the cursor
   DECLARE nba_cursor CURSOR FOR
     SELECT DISTINCT game_id FROM nba_2017 WHERE game_id >= 21601033 ORDER BY game_id;
     -- set exit_loop flag to true if there are no more rows
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   -- open the cursor
   OPEN nba_cursor;
   -- start looping
   nba_loop: LOOP
     -- read the name from next row into the variables 
     FETCH nba_cursor INTO p_game_id;
     -- check if the exit_loop flag has been set by mysql, 
     -- close the cursor and exit the loop if it has.
     IF exit_loop THEN
         CLOSE nba_cursor;
         LEAVE nba_loop;
     END IF;
     
     UPDATE nba_2017 nba JOIN nba_2017 nba2
	 ON nba.game_id = nba2.game_id
	 AND nba.play_id = nba2.play_id
	 SET nba.player_load_cycles = fn_nba_get_player_fatigue(nba2.game_id, nba2.play_id, nba2.player, 2017)
	 WHERE nba.game_id = nba2.game_id
	 AND nba.play_id = nba2.play_id
	 AND nba.event_type IN ('shot', 'miss', 'free throw')
     AND nba.player_load_cycles <= 0
	 AND nba.game_id = p_game_id;
     
     COMMIT;
     
   END LOOP nba_loop;
 END $$
 DELIMITER ;

