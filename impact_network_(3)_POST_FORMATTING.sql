-- POST SET UP

use impact_network;

-- SETS ALL NEGLECTED EDGES TO -1
-- (Marks participation by someone, who neglects to include a person that included them)
UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
SET node1rank = -1 WHERE n1.participation_row > 0 and n2.participation_row > 0 and node1rank = 0;

UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
SET node2rank = -1 WHERE n1.participation_row > 0 and n2.participation_row > 0 and node2rank = 0;












SELECT * from impact_network.nodes;
-- UPDATE nodes SET participation_row = 0, inclusion_row = 0 WHERE Nodes.id > 0;
SELECT * from impact_network.edges;



