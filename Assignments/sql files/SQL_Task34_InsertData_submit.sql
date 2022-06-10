
 

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




