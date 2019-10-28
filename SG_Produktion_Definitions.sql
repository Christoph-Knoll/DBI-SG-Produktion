DROP TABLE METADATA CASCADE CONSTRAINTS;
DROP TABLE parameter_value CASCADE CONSTRAINTS;
DROP TABLE production_rule_group CASCADE CONSTRAINTS;
DROP TABLE production_rule CASCADE CONSTRAINTS;
DROP TABLE parameter CASCADE CONSTRAINTS;

DROP TABLE distributor CASCADE CONSTRAINTS;
DROP TABLE mold CASCADE CONSTRAINTS;
DROP TABLE pan CASCADE CONSTRAINTS;
DROP TABLE FORMAT CASCADE CONSTRAINTS;

DROP TABLE AREA CASCADE CONSTRAINTS;
DROP TABLE SUB_AREA CASCADE CONSTRAINTS;

CREATE TABLE METADATA(
metadata_id NUMBER NOT NULL,
parameter_name VARCHAR2(50),
default_value NUMBER,
upper_limit NUMBER,
lower_limit NUMBER,
measurement_time VARCHAR2(50),
unit VARCHAR2(50),
origin VARCHAR2(50),
entry_type VARCHAR2(50),
is_text NUMBER(1),
is_active NUMBER(1),
area Number,
sub_area Number,
process_parameter NUMBER(1),
quality_parameter NUMBER(1)
);

CREATE TABLE area(
id NUMBER,
name VARCHAR2(50)
);

CREATE TABLE sub_area(
id NUMBER,
area_id NUMBER,
name VARCHAR2(50)
);


CREATE TABLE parameter_value(
parameter_value_id NUMBER,
text VARCHAR2(50),
digit NUMBER
);

CREATE TABLE production_rule(
production_rule_id NUMBER,
production_rule_group_id NUMBER,
production_rule_name VARCHAR2(50)
);

CREATE TABLE PARAMETER(
production_rule_id NUMBER,
metadata_id NUMBER,
aim NUMBER,
MIN NUMBER,
MAX NUMBER
);

CREATE TABLE production_rule_group(
production_rule_group_id NUMBER,
production_rule_group_name VARCHAR2(50)
);

CREATE TABLE distributor(
    ID NUMBER NOT NULL,
    VOLUME NUMBER NOT NULL,
    age NUMBER NOT NULL
);

CREATE TABLE mold(
    ID NUMBER NOT NULL,
    VOLUME NUMBER NOT NULL,
    age NUMBER NOT NULL, 
    FORMAT NUMBER NOT NULL
);

CREATE TABLE FORMAT(
    ID NUMBER NOT NULL,
    height NUMBER NOT NULL,
    width NUMBER NOT NULL,
    LENGTH NUMBER NOT NULL
);

CREATE TABLE pan(
    ID NUMBER,
    VOLUME NUMBER,
    age NUMBER
);

ALTER TABLE METADATA
ADD CONSTRAINT PK_METADATA PRIMARY KEY (METADATA_ID) ENABLE;

ALTER TABLE PARAMETER_VALUE
ADD CONSTRAINT PK_PARAMETER_VALUE PRIMARY KEY (PARAMETER_VALUE_ID) ENABLE;

ALTER TABLE production_rule_group
ADD CONSTRAINT pk_production_rule_group PRIMARY KEY (production_rule_group_id) ENABLE;

ALTER TABLE production_rule
ADD CONSTRAINT pk_production_rule_id PRIMARY KEY (production_rule_id) ENABLE
ADD CONSTRAINT fk_production_rule_group FOREIGN KEY (production_rule_group_id) REFERENCES production_rule_group(production_rule_group_id);

ALTER TABLE PARAMETER
ADD CONSTRAINT FK_PRODUCTION_RULE FOREIGN KEY (production_rule_id) REFERENCES production_rule(production_rule_id)
ADD CONSTRAINT FK_METADATA FOREIGN KEY (metadata_id) REFERENCES METADATA(METADATA_id);

ALTER TABLE FORMAT
ADD CONSTRAINT pk_format PRIMARY KEY (ID);

ALTER TABLE distributor
ADD CONSTRAINT pk_distributor PRIMARY KEY (ID);

ALTER TABLE mold
ADD CONSTRAINT pk_mold PRIMARY KEY (ID)
ADD CONSTRAINT fk_format FOREIGN KEY (FORMAT) REFERENCES FORMAT(ID);

ALTER TABLE pan
ADD CONSTRAINT pk_pan PRIMARY KEY (ID);

ALTER TABLE area ADD CONSTRAINT PK_Area PRIMARY KEY(id);
ALTER TABLE sub_area 
ADD CONSTRAINT PK_Sub_Area PRIMARY KEY(id)
ADD CONSTRAINT FK_Area_ID FOREIGN KEY(area_id) REFERENCES area(id) ON DELETE CASCADE;

