--SELECT 'DELETE FROM ' || table_name || ';' FROM user_Tables;

DELETE FROM EZV_GRUPPE;
DELETE FROM SUBAREA;
DELETE FROM AREA;
DELETE FROM KOKILLE;
DELETE FROM PFANNE;
DELETE FROM VERTEILER;
DELETE FROM FORMAT;


-- Inserts Format
INSERT INTO FORMAT(id, hoehe, breite) values (0, 10, 20);
INSERT INTO FORMAT(id, hoehe, breite) values (1, 20, 40);
INSERT INTO FORMAT(id, hoehe, breite) values (2, 22, 44);


-- Inserts Verteiler
INSERT INTO VERTEILER(id, name, age) values (0, 'Verteiler A', 0);
INSERT INTO VERTEILER(id, name, age) values (1, 'Verteiler B', 150);
INSERT INTO VERTEILER(id, name, age) values (2, 'Verteiler C', 200);

-- Inserts Pfanne
INSERT INTO PFANNE(id, name, age) values (0, 'Pfanne A', 0);
INSERT INTO PFANNE(id, name, age) values (1, 'Pfanne B', 175);
INSERT INTO PFANNE(id, name, age) values (2, 'Pfanne C', 220);

-- Insert Kokille
INSERT INTO KOKILLE(id, format_id, name, age) values (0, 0, 'Kokille A', 3);
INSERT INTO KOKILLE(id, format_id, name, age) values (1, 2, 'Kokille B', 23);
INSERT INTO KOKILLE(id, format_id, name, age) values (2, 1, 'Kokille C', 123);

-- Inserts Area
INSERT INTO AREA(id, name) values (0, 'PFANNE');
INSERT INTO AREA(id, name) values (1, 'VERTEILER');
INSERT INTO AREA(id, name) values (2, 'STRANG');

-- Inserts Subarea
INSERT INTO SUBAREA(id, area_id, name) values (0, 1, 'Stopfen');
INSERT INTO SUBAREA(id, area_id, name) values (1, 1, 'Gießrohr');

INSERT INTO SUBAREA(id, area_id, name) values (2, 2, 'Biegezone');
INSERT INTO SUBAREA(id, area_id, name) values (3, 2, 'Kreiszone');
INSERT INTO SUBAREA(id, area_id, name) values (4, 2, 'Richtzone');

-- Inserts EZV_Gruppe
INSERT INTO EZV_GRUPPE(id, name) values (0, 'Stahl');
INSERT INTO EZV_GRUPPE(id, name) values (1, 'Stahl Rostfrei');
INSERT INTO EZV_GRUPPE(id, name) values (2, 'Blech');

-- Insert
INSERT INTO EZV(id, ezv_gruppe_id, name) values (0, 1, 'Spezialstahl');
INSERT INTO EZV(id, ezv_gruppe_id, name) values (1, 2, 'Autoblech');
INSERT INTO EZV(id, ezv_gruppe_id, name) values (3, 2, 'Kühlschrankblech');


-- Inserts
SELECT * FROM FORMAT;
SELECT * FROM VERTEILER;
SELECT * FROM PFANNE;
SELECT * FROM KOKILLE;
SELECT * FROM AREA;
SELECT * FROM SUBAREA;
SELECT * FROM EZV_GRUPPE;
SELECT * FROM EZV;