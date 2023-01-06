CREATE PROCEDURE `weighBySC2Score` (IN recordId INT)
BEGIN
	DECLARE score int default 0;
    DECLARE total int default 0;
    DECLARE singleWord VARCHAR(50) DEFAULT "";
    DECLARE recordName VARCHAR(50) DEFAULT "";
    DECLARE recordName2 VARCHAR(50) DEFAULT "";
    
    SET recordName = (SELECT CONCAT(f_name, " ", l_name) from nodes where id = recordId);
    SET recordName2 = (SELECT CONCAT(f_name, " ", l_name) from nodes where id = recordId);
	
   
    -- ===============================================================================================
    
	-- Creates/Fills Temporary Table To Hold Individual Word Names
    DROP TEMPORARY TABLE IF EXISTS wordsInString;
    CREATE TEMPORARY TABLE wordsInString (word VARCHAR(50));
    
    INSERT INTO wordsInString(word) (SELECT * FROM temporaryNameTable);
    
    
    
    
    
    
    DROP TEMPORARY TABLE IF EXISTS wordsInRecord;
    CREATE TEMPORARY TABLE wordsInRecord (word VARCHAR(50));

    WHILE LOCATE(" ", recordName) > 1 DO
		INSERT INTO wordsInRecord SELECT SUBSTRING_INDEX(recordName, " ", 1);
        SET recordName = REPLACE(recordName, (SELECT LEFT(recordName, LOCATE(" ", recordName))), '');
    END WHILE;
    INSERT INTO wordsInRecord(word) VALUES(recordName);
    
	
    
    
    WHILE (Select COUNT(word) FROM wordsInString) > 0 DO
        SET singleWord = (SELECT word from wordsInString LIMIT 1);
	
		IF EXISTS (SELECT * from wordsInRecord WHERE substring(word,1,1) = substring(singleWord, 1, 1)) THEN
			Set score = score + 2;
		END IF;
        Set total = total + 2;
        
		-- Comparing The Rest Of Characters In 2 Character Units	
		WHILE length(singleWord) > 1 DO
			IF EXISTS (SELECT * from wordsInRecord WHERE REGEXP_LIKE(word, substring(singleWord, 1, 2))) THEN
				Set score = score + 1;
			END IF;
            Set total = total + 1;
			SET singleWord = substring(singleWord, 2, (length(singleWord) - 1));
            -- SELECT score;
		END WHILE;
		
        DELETE FROM wordsInString LIMIT 1;
        
			
	END WHILE;
    
    -- Select recordId, recordName2, score/total;
    
    INSERT INTO temporaryEdgeTable VALUES (recordId, recordName2, score/total);
    
  
END
