DELETE FROM PARAMETER_VALUE;
DELETE FROM PARAMETER;
DELETE FROM PARAMETER;
DELETE FROM PRODUCTION_RULE;


INSERT INTO PRODUCTION_RULE VALUES(0, null, 'STAHL 1');
INSERT INTO PARAMETER VALUES(0, 'Temparatur Kokille', null, null, null, null, 'Celsius', 'Kokille 1', 'manual', 0, 0, null, null, null);
INSERT INTO PARAMETER VALUES(1, 'Temparatur Kokille', null, null, null, null, 'Celsius', 'Kokille 1', 'manual', 0, 0, null, null, null);
INSERT INTO PARAMETER VALUES(2, 'Temparatur Kokille', null, null, null, null, 'Celsius', 'Kokille 1', 'manual', 0, 0, null, null, null);
INSERT INTO PARAMETER_VALUE VALUES(0, null, 90);
INSERT INTO PARAMETER_VALUE VALUES(1, null, 20);
INSERT INTO PARAMETER_VALUE VALUES(2, null, 300);
INSERT INTO METADATA VALUES(0, 0, 1, 2);

INSERT INTO PARAMETER VALUES(3, 'Farbe Eisen', null, null, null, null, 'COLOR', 'Kokille 1', 'manual', 1, 0, null, null, null);
INSERT INTO PARAMETER VALUES(4, 'Farbe Eisen', null, null, null, null, 'COLOR', 'Kokille 1', 'manual', 1, 0, null, null, null);
INSERT INTO PARAMETER VALUES(5, 'Farbe Eisen', null, null, null, null, 'COLOR', 'Kokille 1', 'manual', 1, 0, null, null, null);
INSERT INTO PARAMETER_VALUE VALUES(3, 'red', null);
INSERT INTO PARAMETER_VALUE VALUES(4, 'green', null);
INSERT INTO PARAMETER_VALUE VALUES(5, 'blue', null);
INSERT INTO METADATA VALUES(0, 3, 4, 5);

SELECT 
(SELECT PARAMETER_NAME FROM PARAMETER WHERE r.METADATA_AIM = PARAMETER_ID) AS NAME,
(SELECT NVL(TEXT, TO_CHAR(DIGIT)) FROM PARAMETER_VALUE WHERE r.METADATA_MIN = PARAMETER_ID) AS MIN, 
(SELECT NVL(TEXT, TO_CHAR(DIGIT)) FROM PARAMETER_VALUE WHERE r.METADATA_AIM = PARAMETER_ID) AS AIM,
(SELECT NVL(TEXT, TO_CHAR(DIGIT)) FROM PARAMETER_VALUE WHERE r.METADATA_MAX = PARAMETER_ID) AS MAX,
(SELECT UNIT FROM PARAMETER WHERE r.METADATA_AIM = PARAMETER_ID) AS UNIT 
FROM METADATA r where r.production_rule_id;

--SELECT * FROM METADATA R JOIN PARAMETER P ON R.PARAMETER_ID = P.PARAMETER_ID;