DELIMITER $$	
 DROP PROCEDURE IF EXISTS pr_run_pga_batch $$
 CREATE PROCEDURE pr_run_pga_batch()
 BEGIN
	DECLARE p_tournament_id INT;
	DECLARE p_player_id INT;
    DECLARE p_round INT;
    DECLARE p_hole INT;
    DECLARE p_shot INT;
    DECLARE p_year_id INT;
   
   -- this flag will be set to true when cursor reaches end of table
   DECLARE exit_loop BOOLEAN DEFAULT FALSE;         
   -- Declare the cursor
	DECLARE pga_cursor CURSOR FOR
		SELECT Tournament_ID, Player_ID, Round, Hole, Shot, Year
		FROM pga_tour_2017
        WHERE Shot_Type NOT IN ('P', 'D', 'Pr', 'C') 
		#AND Tournament_ID IN (10,40,70,100)
        AND Tournament_ID NOT IN (220) # Match Play Exemption
        AND Distance_To_Pin_Ft > 0
        AND Hole_Score > 0
		#AND Round = 1
		#AND Hole = 1
		#AND Shot = 1
		#AND Player_ID = 49964
        ;
   -- set exit_loop flag to true if there are no more rows
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   -- open the cursor
   OPEN pga_cursor;
   -- start looping
   pga_loop: LOOP
     -- read the name from next row into the variables 
     FETCH pga_cursor INTO p_tournament_id, p_player_id, p_round, p_hole, p_shot, p_year_id;
     -- check if the exit_loop flag has been set by mysql, 
     -- close the cursor and exit the loop if it has.
     IF exit_loop THEN
         CLOSE pga_cursor;
         LEAVE pga_loop;
     END IF;
     
     CALL pr_pga_calculate_single_shot(p_tournament_id, p_player_id, p_round, p_hole, p_shot, p_year_id);
     
   END LOOP pga_loop;
   COMMIT;
 END $$
 DELIMITER ;

