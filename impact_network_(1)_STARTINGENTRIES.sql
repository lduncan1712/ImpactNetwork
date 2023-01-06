-- ADDING INDIVIDUALS TO THE DATABASE

-- INSERT INTO node(id, f_name, l_name) VALUES (1, "____", "______"),
										   --  (2, "____", "______");

-- IN THE CASE OF THIS PROJECT, THE CLASSLIST WAS PROVIDED TO ME IN CSV FORMAT, THEN TRANSFERED
-- TO THE FORM ABOVE, (OR ANY WAY YOU SEE FIT), using MYSQLs "Data Table Import Wizard"

INSERT INTO impact_network.edge_tier(id, name, relative_strength) VALUES 
												 (0, "DIDNT PARTICIPATE", 1),
                                                 (1, "Lowest Impact", 2),
                                                 (2, "Medium Impact", 3),
                                                 (3, "High Impact", 4),
                                                 (4, "Highest Impact", 5);
                                                 
-- (Removed For Privacy)                                                 
INSERT INTO impact_network.trait0(id, name) VALUES (1, "_____"), ...;

INSERT INTO impact_network.trait1(id, duration, years) VALUES (1, "THIS YEAR", 1),
												(2, "LAST YEAR", 2),
                                                (3, "2 YEARS AGO", 3),
                                                (4, "START OF HS", 4),
                                                (5, "5-14 YEARS", 5);	
                                                

INSERT INTO impact_network.trait2(id, name) VALUES (1, "College"),
				(2, "Directly Enter Workforce"),
                                    (3, "Entrepreneurship"),
                                    (4, "Military Service"),
                                    (5, "Skilled Trades"),
                                    (6, "University"),
                                    (7, "Other");
                                    
INSERT INTO impact_network.trait3(id, name) VALUES (1, "I"),
						   (2, "E");
-- (Removed For Privacy)	
INSERT INTO impact_network.trait4(id, name) VALUES (1, "____"), ...;
						   
                                    

                                    

                                    
   
	
