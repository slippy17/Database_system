
-- Drop tables
DROP TABLE Job_Codes CASCADE CONSTRAINTS;
DROP TABLE Employee_Reg CASCADE CONSTRAINTS; 
DROP TABLE Equipment_Owners CASCADE CONSTRAINTS; 
--DROP TABLE Callers CASCADE CONSTRAINTS;
DROP TABLE Resolution_Codes CASCADE CONSTRAINTS;
--DROP TABLE Problem_Category_Codes CASCADE CONSTRAINTS; 

DROP TABLE Specialist_Category_Codes CASCADE CONSTRAINTS; 
DROP TABLE HD_Specialists CASCADE CONSTRAINTS;
--DROP TABLE HD_Operators CASCADE CONSTRAINTS;
DROP TABLE SN_Lookup CASCADE CONSTRAINTS;
DROP TABLE Equipment_Reg CASCADE CONSTRAINTS;
DROP TABLE Call_Details CASCADE CONSTRAINTS;

DROP SEQUENCE Call_seq;
DROP SEQUENCE Equip_seq;
DROP SEQUENCE Emp_seq;
DROP SEQUENCE SPL_seq;

DROP VIEW HDOP_Resolved_V;
DROP VIEW Spec_Min_Calls_V;

-- create tables in order.
 
CREATE TABLE  Job_Codes  
(
   Job_Code  CHAR(8),
   Job_Title  VARCHAR2(64),
   
  PRIMARY KEY ( Job_Code )
);
-- checked


CREATE  TABLE  Employee_Reg  
(
   Employee_ID  NUMBER(8),
   First_Name  VARCHAR2(15),
   Last_Name  VARCHAR2(15),
   Email  VARCHAR2(64) CONSTRAINT Email_check  CHECK(Email LIKE '%___@___%'),
   Phone  VARCHAR2(15),
   Department  VARCHAR2(30),
   Job_Code  CHAR(8) CONSTRAINT Employee_Reg_FK_Job_Codes REFERENCES Job_Codes (Job_Code),
  PRIMARY KEY ( Employee_ID ));
  
-- checked


CREATE TABLE  Equipment_Owners  
(
   Reg_Owner_ID  NUMBER(8),
   Employee_ID  NUMBER(8) CONSTRAINT Equipment_Owners_FK_Employee_Reg REFERENCES Employee_Reg (Employee_ID),
  PRIMARY KEY ( Reg_Owner_ID )

);
-- checked

-- ******** This table was created post assignment 1 submission but removed based on feedback from Assign1.
--CREATE TABLE  Callers  
--(
--   Caller_ID  NUMBER(8),
--   Employee_ID  NUMBER(8) CONSTRAINT Callers_FK_Employee_Reg REFERENCES Employee_Reg (Employee_ID),
--  PRIMARY KEY ( Caller_ID )
--);
-- checked

CREATE TABLE  Resolution_Codes  
(
   Resolution_Code  CHAR(6),
   Resolution_Description  VARCHAR2(256),
  PRIMARY KEY ( Resolution_Code )
);
-- checked

--CREATE TABLE  Problem_Category_Codes  
-- ******** This table was created post assignment 1 submission but removed based on feedback from Assign1.
--(
--   Problem_Type_ID  CHAR(6),
--   Problem_Description  VARCHAR2(255),
--  PRIMARY KEY ( Problem_Type_ID )
--);


CREATE TABLE  Specialist_Category_Codes  
(
   Specialist_Area_Code  char(6),
   Cat_Description  VARCHAR2(30),
  PRIMARY KEY ( Specialist_Area_Code )
);
-- checked

CREATE TABLE  HD_Specialists  
(
   HD_Specialist_ID  NUMBER(6),
   Employee_ID  NUMBER(8),
   Specialist_Area_Code  CHAR(6) CONSTRAINT HD_Specialists_FK_Specialist_Category_Codes REFERENCES Specialist_Category_Codes (Specialist_Area_Code),
  PRIMARY KEY ( HD_Specialist_ID )
);
-- checked

-- ******** This table was created post assignment 1 submission but removed based on feedback from Assign1.
--CREATE TABLE  HD_Operators  (
--   HD_Operator_ID  CHAR(6),
--   Employee_ID  NUMBER(8) CONSTRAINT HD_Operators_FK_Employee_Reg REFERENCES Employee_Reg (Employee_ID),
--  PRIMARY KEY ( HD_Operator_ID )
--);


CREATE TABLE  SN_Lookup  
-- Foreign key Equip_ID not defined until after Equipment_Reg table created.
(
   Computer_SN  CHAR(30),
   Equip_ID  NUMBER(8),
  PRIMARY KEY ( Computer_SN )
);
-- checked


CREATE TABLE  Equipment_Reg  
-- Foreign key Call_ID not defined until after Call_details table created.
(
   Equip_ID  NUMBER(8),
   --**Not used   Computer_SN  char(30) CONSTRAINT Equipment_Reg_FK_SN_Lookup REFERENCES SN_Lookup (Computer_SN),
   --**Not        Caller_ID  NUMBER(8) CONSTRAINT Equipment_Reg_FK_Callers REFERENCES Callers (Caller_ID),
   Equip_Make  VARCHAR2(15),
   Equip_Type  VARCHAR2(15),
   Equip_OS  VARCHAR2(15),
   Equip_Lic  VARCHAR2(64),
   Equip_Lic_Expire_Date  Date,
   Computer_SW  VARCHAR2(64),
   --Call_ID  NUMBER (8)   maybe remove this.
   Reg_Owner_ID  NUMBER(8) CONSTRAINT Equipment_Reg_FK_Equipment_Owners REFERENCES Equipment_Owners (Reg_Owner_ID),
  PRIMARY KEY ( Equip_ID )
);
-- checked


CREATE TABLE  Call_Details  
(
   Call_ID  NUMBER (8),
   Caller_Name  VARCHAR2(15) not null,
   Caller_ID  NUMBER(8) CONSTRAINT Call_Details_FK_Employee_Reg REFERENCES Employee_Reg (Employee_ID) not null,
   Computer_SN  char(30) CONSTRAINT Call_Details_FK_SN_Lookup REFERENCES SN_Lookup (Computer_SN) not null,
   HD_Operator_ID  NUMBER(6) CONSTRAINT Employee_ID_FK_Employee_Reg REFERENCES Employee_Reg (Employee_ID) not null,
   Call_Open_Time  Timestamp(2) not null,
   Call_Closed_Time  Timestamp(2),
   Comments  VARCHAR2(2000) not null,
   HD_Specialist_ID  Number(6) CONSTRAINT Call_Details_FK_HD_Specialists REFERENCES HD_Specialists (HD_Specialist_ID),
   Call_Active  Number(1) not null,
   Problem_Type_ID  CHAR(6)CONSTRAINT Call_Details_FK_Specialist_Category_Codes REFERENCES Specialist_Category_Codes (Specialist_Area_Code) not null,
   Resolution_Code  CHAR(6) CONSTRAINT Call_Details_FK_Resolution_Codes REFERENCES Resolution_Codes (Resolution_Code),

  PRIMARY KEY ( Call_ID ),
  CHECK (Call_Active=0 OR Call_Active=1)
);
-- checked





-- *************************************      Constraints      ********************************************************* 
-- Set foreign keys that were not set during create tables.

-- SN_Lookup table Foreign key Equip_ID from Equipment_Reg defined. ALTER TABLE Equipment_Reg ADD CONSTRAINT.
ALTER TABLE SN_Lookup ADD CONSTRAINT Equip_ID_FK FOREIGN KEY 
  (Equip_ID) REFERENCES Equipment_Reg (Equip_ID);

-- Equipment_Reg table Foreign key Call_ID from Call_Details table defined.
--ALTER TABLE Equipment_Reg ADD CONSTRAINT Call_ID_FK FOREIGN KEY 
-- (Call_ID) REFERENCES Call_Details (Call_ID);  <<<<<<  Call_ID removed from Equipment_Reg table >>>>>>

-- add and checks other constraints 


-- *************************************      Sequencing      ********************************************************* 

-- CREATE SEQUENCE seqname
-- [START WITH INT]
-- [INCREMENT BY INT]
-- [MAXVALUE INT | NOMAXVALUE]
-- [MINVALUE INT | NOMINVALUE]
-- [CYCLE | NOCYCLE] 

CREATE SEQUENCE Call_seq
START WITH 31000000
INCREMENT BY 1;


CREATE SEQUENCE Equip_seq
START WITH 50000
INCREMENT BY 1;

CREATE SEQUENCE SPL_seq
START WITH 500
INCREMENT BY 1;


CREATE SEQUENCE Emp_seq
START WITH 1000
INCREMENT BY 1
NOCACHE;

-- ************************************* Indexing *********************************************************
-- Primary keys are already automatically indexed so using employee names as an example.

CREATE INDEX EMP_FName_IDX ON Employee_Reg (First_Name);
CREATE INDEX EMP_LName_IDX ON Employee_Reg (Last_Name);


-- **************************************** Views *********************************************************

CREATE VIEW HDOP_Resolved_V as
select CALL_ID, PROBLEM_TYPE_ID, COMMENTS, RESOLUTION_CODE, 
        (sysdate + (CALL_CLOSED_TIME - CALL_OPEN_TIME)*24) - sysdate Time_to_Resolve_Hrs  
        from call_details where  CALL_ACTIVE = 0 and HD_SPECIALIST_ID is null;


-- View that returns the specialist area and HD_specialist_ID for the specialist with the lowest amount of calls.
CREATE VIEW  Spec_Min_Calls_V AS 
(
SELECT SPECIALIST_AREA_CODE, HD_SPECIALIST_ID from HD_SPECIALISTS where HD_SPECIALIST_ID in 
(SELECT  HD_SPECIALIST_ID FROM (select H.HD_SPECIALIST_ID, count(call_id) AS NUM_CALLS from HD_SPECIALISTS  H 
LEFT OUTER JOIN Call_Details ON H.HD_SPECIALIST_ID=Call_Details.HD_SPECIALIST_ID  
GROUP BY H.HD_SPECIALIST_ID  ORDER BY count(call_id) ASC) WHERE NUM_CALLS= (SELECT MIN(NUM_CALLS) FROM (select H.HD_SPECIALIST_ID, count(call_id) AS NUM_CALLS from HD_SPECIALISTS  H LEFT OUTER JOIN Call_Details 
        ON H.HD_SPECIALIST_ID=Call_Details.HD_SPECIALIST_ID  
        GROUP BY H.HD_SPECIALIST_ID  ORDER BY count(call_id) ASC))
));



 


