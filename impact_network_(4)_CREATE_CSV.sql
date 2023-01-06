use impact_network;
-- -----------------------------------------------------------------------
-- NODE TABLE (UNCOMMENT ONE, ADD OR REMOVE PREFERED QUALITIES)
-- -----------------------------------------------------------------------
		-- (participants)
		SELECT id as Id,
				f_name as NameF,
                l_name as NameL,
                participation_row as WhenParticipated,
                inclusion_row as WhenIncluded,
                trait0 as Prev,
                trait1 as Duration,
                trait2 as Goal,
                trait3 as Per,
                trait4 as Gen,
                edgeOut as NumOut,
                edgeIn as NumIn,
                sumEdgeOut as SumOut
		FROM nodes
        WHERE participation_row > 0
        UNION
        -- (non participants)
        SELECT id as Id,
				f_name as NameF,
                l_name as NameL,
                participation_row as WhenParticipated,
                inclusion_row as WhenIncluded,
                0 as Prev,
                0 as Duration,
                0 as Goal,
                0 as Per,
                0 as Gen,
                edgeOut as NumOut,
                edgeIn as NumIn,
                sumEdgeOut as SumOut
		FROM nodes
        WHERE inclusion_row > 0 and participation_row < 1;
-- -----------------------------------------------------------------------
-- EDGE TABLE (UNCOMMENT ONE, SELECT PREFERED strengthN as WEIGHT)
-- -----------------------------------------------------------------------
		-- ---------------------------------------------------------------------
		-- DIRECTIONAL (Seperate Directional Edges, Default Weight Division Is 0.5 + 0.5)
		-- -----------------------------------------------------------------------
				-- -----------------------------------------------------------------------
				-- DYNAMIC (Seperate Directional Edges That Begin When Their Owner Participates)
                -- -----------------------------------------------------------------------
                -- (node1 only participant)
                
                 SELECT null as EdgeDirectionalDynamic,
						node1 As Source,
 						node2 As Target,
                         strength3 as Weight,
                         n1.participation_row as Start,
                         (SELECT max(participation_row) from nodes) as End
                         from edges 
                        INNER JOIN nodes n1 ON edges.node1 = n1.id
						INNER JOIN nodes n2 ON edges.node2 = n2.id
 						where n1.participation_row > 0 and n2.participation_row = 0
 				UNION
                -- (node2 only participant)
                SELECT null as EdgeDirectionalDynamic,
						node2 As Source,
						node1 As Target,
                        strength3 as Weight,
                        n2.participation_row as Start,
                        (SELECT max(participation_row) from nodes) as End
                        from edges
                        INNER JOIN nodes n1 ON edges.node1 = n1.id
						INNER JOIN nodes n2 ON edges.node2 = n2.id
						where n2.participation_row > 0 and n1.participation_row = 0
				UNION
                -- (node1 to node2 both participate)
                SELECT null as EdgeDirectionalDynamic,
						node1 As Source,
						node2 As Target,
                        strength3 / 2 as Weight,
                        n1.participation_row as Start,
                        (Select max(participation_row) from nodes) as End
                        from edges 
                        INNER JOIN nodes n1 ON edges.node1 = n1.id
						INNER JOIN nodes n2 ON edges.node2 = n2.id
						where n2.participation_row > 0 and n1.participation_row > 0
				UNION
                -- (node2 to node1 both participate)
                SELECT null as EdgeDirectionalDynamic,
						node2 As Source,
						node1 As Target,
                        strength3 / 2 as Weight,
                        n2.participation_row as Start,
                        (Select max(participation_row) from nodes) as End
                        from edges
                        INNER JOIN nodes n1 ON edges.node1 = n1.id
						INNER JOIN nodes n2 ON edges.node2 = n2.id 
						where n2.participation_row > 0 and n1.participation_row > 0;
				-- -----------------------------------------------------------------------
				-- NON DYNAMIC (Seperate Directional Edges That Exist At All Times)
                -- -----------------------------------------------------------------------
                -- (node1 to node2)
                SELECT  null as EdgeDirectionalNonDynamic,
						node1 as Source,
                        node2 as Target,
                        strength4 / 2  as Weight
                        from edges where node1rank > 0
				UNION
                -- (node2 to node1)
                SELECT null as EdgeDirectionalNonDynamic,
						node2 as Source,
                        node1 as Target,
                        strength4 / 2 as Weight
                        from edges where node2rank > 0;
		-- -----------------------------------------------------------------------
		-- NON DIRECTIONAL (Single Undirected Edge Marking Shared Relationship)
		-- -----------------------------------------------------------------------
				-- DYNAMIC (Single Undirected Edge That Comes Into Existance When First Node Within Participates)
				-- -----------------------------------------------------------------------
						SELECT  null as EdgeNonDirectionalDynamic,
								node1 as Source,          
								node2 as Target,
								strength4 as Weight,
               
								GREATEST(n1.participation_row, n2.participation_row) AS Start,
								(Select MAX(participation_row) from nodes) AS End
						FROM edges 
						INNER JOIN nodes n1 ON edges.node1 = n1.id
						INNER JOIN nodes n2 ON edges.node2 = n2.id 
						WHERE node1 > 0;
			   -- -----------------------------------------------------------------------
               -- NON DYNAMIC (Single Edge That Exists At All Times)
               -- -----------------------------------------------------------------------
               SELECT null as EdgeNonDirectionalNonDynamic,
					  node1 as Source,
					  node2 as Target,
                      strength4 as Weight
			  FROM edges 
              WHERE node1 > 0;
