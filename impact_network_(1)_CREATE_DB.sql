CREATE DATABASE impact_network;

-- TRAIT 0, (PREVIOUS)
CREATE TABLE impact_network.trait0(
	id int,
    name VARCHAR(30),
    PRIMARY KEY (id)
);
-- TRAIT 1, (DURATION)
CREATE TABLE impact_network.trait1(
	id int,
    duration VARCHAR(30),
    years int,
    PRIMARY KEY (id)
);

-- TRAIT 2 (GOAL)
CREATE TABLE impact_network.trait2(
	id int,
    name VARCHAR(30),
    PRIMARY KEY (id)

);

-- ADDITIONAL COLLECTED INFORMATION (ADD AS REQUIRED)
-- TRAIT 3 (PERSONALITY)
CREATE TABLE impact_network.trait3(
	id INT,
    name VARCHAR(30),
    PRIMARY KEY (id)
);
-- TRAIT 4 (IDEN) 
CREATE TABLE impact_network.trait4(
	id INT, 
    name VARCHAR(30),
    PRIMARY KEY (id)
);





CREATE TABLE impact_network.nodes(
	id INT,
	f_name VARCHAR(30),
	l_name VARCHAR(30),
	participation_row INT DEFAULT 0,  -- ddddddddddddddddddddddddddddddd
	inclusion_row INT DEFAULT 0,      -- ddddddddddddddddddddddddddddddd
    trait0 int,
    trait1 INT,
    trait2 INT,
    trait3 INT,
    trait4 INT,
    edgeOut int DEFAULT 0,
    sumEdgeOut int DEFAUlt 0,
    edgeIn int DEFAUlt 0,
    conclusion1 DOUBLE,
    conclusion2 DOUBLE,
    PRIMARY KEY (id),
    FOREIGN KEY (trait0) REFERENCES trait0(id),
    FOREIGN KEY (trait1) REFERENCES trait1(id),
    FOREIGN KEY (trait2) REFERENCES trait2(id),
    FOREIGN KEY (trait3) REFERENCES trait3(id),
    FOREIGN KEY (trait4) REFERENCES trait4(id)
);

CREATE TABLE impact_network.edge_tier(
	id int,
    name VARCHAR(30),
    relative_strength int,
	PRIMARY KEY (id)
);

CREATE TABLE impact_network.edges(
	node1 int,
    node2 int,
    node1rank int DEFAULT 0,
    node2rank int DEFAULT 0,
    strength1 int,
    strength2 int,
    strength3 double,
    strength4 double,
    PRIMARY KEY (node1, node2),
    FOREIGN KEY (node1) REFERENCES nodes(id),
    FOREIGN KEY (node2) REFERENCES nodes(id)
);

CREATE TABLE impact_network.temporaryNameTable(
	id VARCHAR(50)
);

CREATE TABLE impact_network.temporaryEdgeTable(
	id INT,
    name VARCHAR(50),
    strength DOUBLE
);

