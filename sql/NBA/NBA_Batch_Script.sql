DELIMITER $$
 DROP PROCEDURE IF EXISTS pr_run_nba_batch $$
 CREATE PROCEDURE pr_run_nba_batch()	
 BEGIN
   DECLARE p_game_id INT;
   DECLARE p_play_id INT;
   DECLARE p_player TEXT;
   DECLARE p_nba_year INT;
   -- this flag will be set to true when cursor reaches end of table
   DECLARE exit_loop BOOLEAN DEFAULT FALSE;         
   -- Declare the cursor
   DECLARE nba_cursor CURSOR FOR
     SELECT game_id, play_id, player, 2016
     FROM clutch.nba_2016
     WHERE event_type IN ('shot', 'miss', 'free throw')
     #AND game_id > 1900
     ;
   -- set exit_loop flag to true if there are no more rows
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   -- open the cursor
   OPEN nba_cursor;
   -- start looping
   nba_loop: LOOP
     -- read the name from next row into the variables 
     FETCH nba_cursor INTO p_game_id, p_play_id, p_player, p_nba_year;
     -- check if the exit_loop flag has been set by mysql, 
     -- close the cursor and exit the loop if it has.
     IF exit_loop THEN
         CLOSE nba_cursor;
         LEAVE nba_loop;
     END IF;
     
     CALL pr_nba_calculate_single_shot(p_game_id, p_play_id, p_player, p_nba_year);
     
   END LOOP nba_loop;
 END $$
 DELIMITER ;

