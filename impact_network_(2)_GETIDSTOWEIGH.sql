CREATE PROCEDURE `getIdsToWeigh` (writtenName VARCHAR(90))
BEGIN
	DECLARE firstLetter VARCHAR(50) DEFAULT "";
    
	 DROP TEMPORARY TABLE IF EXISTS wordsList;
	 CREATE TEMPORARY TABLE wordsList (word VARCHAR(50));
     
     WHILE LOCATE(" ", writtenName) > 1 DO
		 INSERT INTO wordsList SELECT SUBSTRING_INDEX(writtenName, " ", 1);
         INSERT INTO impact_network.temporaryNameTable SELECT SUBSTRING_INDEX(writtenName, " ", 1);
         SET writtenName = REPLACE(writtenName, (SELECT LEFT(writtenName, LOCATE(" ", writtenName))), '');
     END WHILE;
     INSERT INTO wordsList(word) VALUES(writtenName);
     INSERT INTO impact_network.temporaryNameTable(id) VALUES(writtenName);
	DROP TEMPORARY TABLE IF EXISTS possibleMatchList;
	CREATE TEMPORARY TABLE possibleMatchList(id INT);
	WHILE (Select COUNT(word) FROM wordsList) > 0 DO
        SET firstLetter = SUBSTRING((SELECT word from wordsList LIMIT 1), 1, 1);
        INSERT INTO possibleMatchList(id) SELECT id from impact_network.nodes where SUBSTRING(f_name, 1, 1) = firstLetter OR SUBSTRING(l_name, 1, 1) = firstLetter;
        DELETE FROM wordsList LIMIT 1;
	END WHILE;
	(SELECT DISTINCT id from possibleMatchList);

END
