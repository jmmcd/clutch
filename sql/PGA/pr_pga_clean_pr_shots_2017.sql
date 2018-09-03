DELIMITER $$	
 DROP PROCEDURE IF EXISTS pr_pga_clean_pr_shots_2017 $$
 CREATE PROCEDURE pr_pga_clean_pr_shots_2017()
 BEGIN
	DECLARE p_tournament_id INT;
	DECLARE p_player_id INT;
    DECLARE p_round INT;
    DECLARE p_hole INT;
    DECLARE p_shot INT;
	DECLARE p_distance INT;
    
   -- this flag will be set to true when cursor reaches end of table
   DECLARE exit_loop BOOLEAN DEFAULT FALSE;         
   -- Declare the cursor
	DECLARE pga_cursor CURSOR FOR
		SELECT Tournament_ID, Player_ID, Round, Hole, Shot, Distance_To_Hole_After_Shot_Ft
		FROM pga_tour_2017
        WHERE Shot_Type IN ('Pr');
   -- set exit_loop flag to true if there are no more rows
   DECLARE CONTINUE HANDLER FOR NOT FOUND SET exit_loop = TRUE;
   -- open the cursor
   OPEN pga_cursor;
   -- start looping
   pga_loop: LOOP
     -- read the name from next row into the variables 
     FETCH pga_cursor INTO p_tournament_id, p_player_id, p_round, p_hole, p_shot, p_distance;
     -- check if the exit_loop flag has been set by mysql, 
     -- close the cursor and exit the loop if it has.
     IF exit_loop THEN
         CLOSE pga_cursor;
         LEAVE pga_loop;
     END IF;
     
     UPDATE pga_tour_2017
     SET Distance_To_Hole_After_Shot_Ft = p_distance
	 WHERE Tournament_ID = p_tournament_id
	 AND Round = p_round
	 AND Hole = p_hole
	 AND Shot = p_shot - 1
	 AND Player_ID = p_player_id;
     
   END LOOP pga_loop;
 END $$
 DELIMITER ;

