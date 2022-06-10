
-- Drop tables
DROP TABLE Job_Codes CASCADE CONSTRAINTS;
DROP TABLE Employee_Reg CASCADE CONSTRAINTS; 
DROP TABLE Equipment_Owners CASCADE CONSTRAINTS; 
--DROP TABLE Callers CASCADE CONSTRAINTS;
DROP TABLE Resolution_Codes CASCADE CONSTRAINTS;
DROP TABLE Problem_Category_Codes CASCADE CONSTRAINTS; 

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



 

-- *************************************      Insert Data      ********************************************************* 

-- Job codes table.---------

INSERT INTO Job_Codes VALUES
('TEC1', 'Technician Level 1');

INSERT INTO Job_Codes VALUES
('TEC2', 'Technician Level 2');

INSERT INTO Job_Codes VALUES
('TEC3', 'Technician Level 3');

INSERT INTO Job_Codes VALUES
('OPR', 'Operator');

INSERT INTO Job_Codes VALUES
('CLK', 'Clerk');

INSERT INTO Job_Codes VALUES
('ENG', 'Engineer');

INSERT INTO Job_Codes VALUES
('SUP', 'Supervisor');

INSERT INTO Job_Codes VALUES
('MAN', 'Manager');

INSERT INTO Job_Codes VALUES
('CLV', 'C Level Execs');


------- Insert data --------
-- Job Employee_reg table.

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Shawna',	 'Buck',	 'shawna.buck@gmail.com',	'702-771-7149',	'Sales',	'TEC1');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Nathaniel','Burke',	  'nathaniel.burke@walmart.com','231-765-6923',	'Tech Support',	'TEC3');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Elisabeth','Foster',	 'elisabeth.foster@gmail.com','270-749-4774',	'Customer Support',	'TEC1');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Briana','Lancaster',  'briana.lancaster@yahoo.com','219-623-8216',	'Accounting',	'CLK');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Estella',	'Potter', 'estella.potter@gmail.com',	  '907-677-8486',	'Sales',	'MAN');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Lamont','Woods',	  'lamont.woods@hotmail.com',	    '236-597-8196',	'Tech Support',	'TEC3');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Melinda',	    'Lopez',	   'melinda.lopez@hotmail.com',	    '210-396-1493',	'Accounting',	'CLK');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Shanna','Silva',	   'shanna.silva@gmail.com',	    '236-373-6712',	'Accounting',	'CLK');

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Jasmine',	'Freeman',	  'jasmine.freeman@gmail.com',	    '423-796-1535',	'Accounting',	'SUP');

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Madge','Sargent',	   'm.sargent@aol.com',	    '630-910-0644',	'Sales',	'ENG');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Reid','Randolph',	  'reid.randolph@gmail.com',	  '209-996-8902',	'Sales',	'TEC2');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Antoine','Wiley',	'antoine.wiley@verizon.net',    '503-361-6334',	'Sales',	'TEC2');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Mathew',	'Hodge',	  'mathew.hodge@hotmail.com',    '209-294-7430',	'Sales',	'ENG');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Bernardo','Austin',	 'bernardo.austin@hotmail.com',	 '319-716-4227',	'Sales',	'MAN');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Cole','Jensen',	     'cole.jensen@aol.com',	    '405-495-4201',	'Sales',	'TEC1');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Tod','Holcomb',	     'tod.holcomb@outlook.com', '240-364-4220',	'Customer Support',	'MAN');

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Yesenia','Guerrero',	  'yesenia.guerrero@btinternet.com','240-505-5321',	'Customer Support',	'ENG');

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Carey','Ferrell',	  'carey.ferrell@yahoo.com',	    '212-495-4523',	'Customer Support',	'ENG');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Aileen',	'Blanchard',    'aileen.blanchard@gmail.com',	    '308-788-3843',	'Customer Support',	'ENG');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Marta','Cervantes',	  'marta.cervantes@gmail.com',	    '206-858-9176',	'Customer Support',	'CLK');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Arthur',	'Holloway',	   'arthur.holloway@aol.com',	    '225-832-0451',	'Customer Support',	'TEC3');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Tara','Forbes',	      'tara.forbes@gmail.com',	    '209-631-5424',	'Customer Support',	'TEC2');

INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Keri','Slater',	      'keri.slater@apple.com',	    '207-842-2965',	'Tech Support',	'OPR');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Desmond','Wynn',	  'desmond.wynn@hotmail.com',	    '209-319-3405',	'Tech Support',	'OPR');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Adrienne','Puckett',	  'adrienne.puckett@verizon.net',	    '209-235-0390',	'Tech Support',	'OPR');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Beatriz','Knowles',	 'beatriz.knowles@gmail.com',	    '406-923-1326',	'Tech Support',	'SUP');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Jermaine','Sykes', 'jermaine.sykes@apple.com',	    '239-204-8747',	'Tech Support',	'CLV');
INSERT INTO Employee_reg
VALUES
(Emp_seq.NEXTVAL,'Scott','Best',	    'scott.best@cox.net',	    '307-504-4165',	'Accounting',	'CLV');

------- Insert data --------
-- Equipment_Owners.
INSERT INTO Equipment_Owners
VALUES
(10013, 1013);
INSERT INTO Equipment_Owners
VALUES
(10015, 1015);

INSERT INTO Equipment_Owners
VALUES
(10025, 1025);
INSERT INTO Equipment_Owners
VALUES
(10027, 1027);
-- checked

------- Insert data --------
---- Equipment_Reg ---------
INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Opti_Desk PC', 'Windows 10', '772DFF993AGC1111', TO_DATE('13-OCT-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10015 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Opti_Desk PC', 'Windows 7', '772DFF993AGC2222', TO_DATE('13-OCT-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10015 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Apple', 'Mac_Desk PC', 'Mac OSX', '772DFF993AGC201333', TO_DATE('30-APR-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10027 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Latitude laptop', 'Windows 10', '772DFF993AGC7777', TO_DATE('23-NOV-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10013 );
INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Opti_Desk PC', 'Windows 10', '772DFF99C1111', TO_DATE('13-OCT-2019', 'DD-MON-YYYY'), 'SalesForce V5', 10015 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Opti_Desk PC', 'Windows 7', '772DF9UUU3AGC2222', TO_DATE('01-JUN-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10015 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Apple', 'Mac_Desk PC', 'Mac OSX', '772DTRY93AGC201333', TO_DATE('13-OCT-2021', 'DD-MON-YYYY'), 'SalesForce V5', 10027 );

INSERT INTO Equipment_Reg VALUES
(Equip_seq.NEXTVAL, 'Dell', 'Latitude laptop', 'Windows 10', '772DFFSADAGC7777', TO_DATE('13-OCT-2022', 'DD-MON-YYYY'), 'SalesForce V5', 10013 );

------- Insert data --------
--SN_LookUP
INSERT INTO SN_LookUP VALUES ('8500095B',50000);
INSERT INTO SN_LookUP VALUES ('8555101',50001);
INSERT INTO SN_LookUP VALUES ('2BCf0932A',50002);
INSERT INTO SN_LookUP VALUES ('1BC0095B1',50003);
INSERT INTO SN_LookUP VALUES ('845AS795B',50004);
INSERT INTO SN_LookUP VALUES ('8546995B',50005);
INSERT INTO SN_LookUP VALUES ('8555103',50006);
INSERT INTO SN_LookUP VALUES ('8545495B',50007);


-- Specialist_Category_Codes
INSERT INTO Specialist_Category_Codes VALUES ('HW', 'Hardware');
INSERT INTO Specialist_Category_Codes VALUES ('OS', 'Operating system');
INSERT INTO Specialist_Category_Codes VALUES ('APPS', 'Application software');
INSERT INTO Specialist_Category_Codes VALUES ('GEN', 'General');
INSERT INTO Specialist_Category_Codes VALUES ('NET', 'Network');
-- checked 


------- Insert data --------
-- Problem_Category_Codes. Not using this table based on Assignment 1 feedback.
--INSERT INTO Problem_Category_Codes VALUES ('DISP', 'No display on boot');
--INSERT INTO Problem_Category_Codes VALUES ('BOOT1', 'Fails BIOS tests');
--INSERT INTO Problem_Category_Codes VALUES ('MEM', 'Memory Error');
--INSERT INTO Problem_Category_Codes VALUES ('BOOT3', 'Blue Screen of Death');
--INSERT INTO Problem_Category_Codes VALUES ('BOOT4', 'OS not started to load');
--INSERT INTO Problem_Category_Codes VALUES ('PASS', 'User cannot login');
--INSERT INTO Problem_Category_Codes VALUES ('DESK', 'No items on Desktop');
--INSERT INTO Problem_Category_Codes VALUES ('MOUSE', 'Mouse does not respond');
--INSERT INTO Problem_Category_Codes VALUES ('KEYB', 'Keyboard does not respond');
--INSERT INTO Problem_Category_Codes VALUES ('APP1', 'Application will not load');
--INSERT INTO Problem_Category_Codes VALUES ('APP2', 'Application will not print');
--INSERT INTO Problem_Category_Codes VALUES ('GEN', 'General error - need more detail');



------- Insert data --------
-- Resolution_Codes
INSERT INTO Resolution_Codes VALUES ('USER', 'User Error');
INSERT INTO Resolution_Codes VALUES ('SCRN', 'Display replaced');
INSERT INTO Resolution_Codes VALUES ('DLL', 'DLL Files reloaded');
INSERT INTO Resolution_Codes VALUES ('IMG', 'Computer reimaged');
INSERT INTO Resolution_Codes VALUES ('RELD', 'Software re-installed');
INSERT INTO Resolution_Codes VALUES ('MOUSE', 'Mouse Replaced');
INSERT INTO Resolution_Codes VALUES ('REGID', 'Registration Key Reloaded');
INSERT INTO Resolution_Codes VALUES ('NET', 'Network Details Reloaded');
INSERT INTO Resolution_Codes VALUES ('PROF', 'USER Profile Reloaded');
INSERT INTO Resolution_Codes VALUES ('DRIV', 'Driver Reinstalled');



------- Insert data --------
-- Callers. Not using this table based on Assignment 1 feedback.
--INSERT INTO callers VALUES (2006,1006);
--INSERT INTO callers VALUES (2003,1003);
--INSERT INTO callers VALUES (2004,1004);
--INSERT INTO callers VALUES (2000,1000);



------- Insert data --------
-- HD_Operators. Not using this table based on Assignment 1 feedback.
--INSERT INTO HD_Operators VALUES (8001,1001);
--INSERT INTO HD_Operators VALUES (8022,1022);



------- Insert data --------
--HD_Specialists
INSERT INTO HD_specialists VALUES (SPL_seq.NEXTVAL, 1005, 'NET');
INSERT INTO HD_specialists VALUES (SPL_seq.NEXTVAL, 1018, 'GEN');
INSERT INTO HD_specialists VALUES (SPL_seq.NEXTVAL, 1020, 'HW');
INSERT INTO HD_specialists VALUES (SPL_seq.NEXTVAL, 1025, 'HW');
insert into HD_specialists values (SPL_seq.NEXTVAL, 1018, 'HW');



------- Insert data --------
-- Call_Details.  
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Briana', 1003, '8500095B', 1001, TO_DATE('21-OCT-2020 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Machine will not boot', NULL, 1, 'HW', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Melinda', 1006, '2BCf0932A', 1001, TO_DATE('19-OCT-2020 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Cannot log into OS', 504, 1, 'OS', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '2BCf0932A', 1022, TO_DATE('19-OCT-2020 15:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Mouse not working', 502, 1, 'GEN', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '2BCf0932A', 1022, TO_DATE('10-OCT-2020 14:08', 'DD-MON-YYYY HH24:MI'), TO_DATE('11-OCT-2020', 'DD-MON-YYYY HH24:MI'), 'Screen blank', 502, 0, 'GEN', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Briana', 1003, '1BC0095B1', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Spilt coffee, afraid to turn on', NULL, 1, 'GEN', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Melinda', 1006, '2BCf0932A', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), TO_DATE('13-OCT-2022 15:08', 'DD-MON-YYYY HH24:MI'), 'Cannot log into OS', NULL, 0, 'OS', 'USER');
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '2BCf0932A', 1022, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Mouse not working', 500, 1, 'HW', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '1BC0095B1', 1022, TO_DATE('13-OCT-2022 17:08', 'DD-MON-YYYY HH24:MI'), TO_DATE('15-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), 'Screen blank', 504, 0, 'HW', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Briana', 1003, '8500095B', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Machine will not boot', NULL, 1, 'GEN', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Estella', 1004, '2BCf0932A', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Cannot log into OS', NULL, 1, 'NET', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '2BCf0932A', 1022, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Mouse not working', 504, 1, 'HW', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '1BC0095B1', 1022, TO_DATE('13-OCT-2022 11:11', 'DD-MON-YYYY HH24:MI'), TO_DATE('13-OCT-2022 12:08', 'DD-MON-YYYY HH24:MI'), 'Cant access network', 502, 0, 'NET', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Briana', 1003, '8500095B', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'App will not load', NULL, 1, 'APPS', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Melinda', 1006, '2BCf0932A', 1001, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Cannot log into OS', NULL, 1, 'OS', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Estella', 1004, '2BCf0932A', 1022, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), NULL, 'Will not boot', 500, 1, 'NET', NULL);
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Estella', 1004, '1BC0095B1', 1022, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), TO_DATE('14-OCT-2022 09:08', 'DD-MON-YYYY HH24:MI'), 'Screen blank', NULL, 0, 'GEN', 'SCRN');
INSERT INTO Call_Details VALUES
(Call_seq.NEXTVAL, 'Shawna', 1000, '8500095B', 1022, TO_DATE('13-OCT-2022 14:08', 'DD-MON-YYYY HH24:MI'), TO_DATE('15-OCT-2022 09:08', 'DD-MON-YYYY HH24:MI'), 'BIOS Fail', NULL, 0, 'GEN', 'DRIV');



COMMIT;




