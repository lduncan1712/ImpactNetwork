-- Setting Weights

-- Strength 1 (Basis Sum) (Succeptible to exageration, overprioritizes volume)
UPDATE impact_network.edges
-- INNER JOIN nodes n1 ON edges.node1 = n1.id
-- INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength1 = 2 + node1rank + node2rank WHERE node1 > 0;

-- Strength 2 (Basic Product) (Expoentially Weighted, also Succeptible to exageration
UPDATE impact_network.edges
-- INNER JOIN nodes n1 ON edges.node1 = n1.id
-- INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength2 = (2 + node1rank)*(2 + node2rank) where node1 > 0;

-- Strength 3 (Scaled Product)
UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 = ((node1rank + 2) / n1.sumEdgeOut)*(2 + node1rank)*(2 + node2rank)*((node2rank + 2) / n2.sumEdgeOut)
WHERE n1.participation_row > 0 and n2.participation_row > 0;

UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 = ((node1rank + 2) / n1.sumEdgeOut)*(2 + node1rank)
WHERE n1.participation_row > 0 and n2.participation_row = 0;

UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 = ((node2rank + 2) / n2.sumEdgeOut)*(2 + node2rank)
WHERE n1.participation_row = 0 and n2.participation_row > 0;




-- Strength 4 (gives every participant a power over graph of 1
UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 = ((node1rank + 1)/n1.sumEdgeOut) + ((node2rank + 1)/n2.sumEdgeOut)
WHERE n1.participation_row > 0 and n2.participation_row > 0;

UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 =  ((node2rank + 1)/n2.sumEdgeOut)*2
WHERE n1.participation_row = 0 and n2.participation_row > 0;

UPDATE impact_network.edges
INNER JOIN nodes n1 ON edges.node1 = n1.id
INNER JOIN nodes n2 ON edges.node2 = n2.id 
Set strength3 = ((node1rank + 1)/n1.sumEdgeOut)*2
WHERE n1.participation_row > 0 and n2.participation_row = 0;



SELECT * from edges;
Select * from nodes;

