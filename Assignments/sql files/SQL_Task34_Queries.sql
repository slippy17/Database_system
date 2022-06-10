-- Assignment Task 4.

-- 1) List details of equipment AND associated software.

        SELECT * FROM equipment_reg e, SN_Lookup s WHERE  e.equip_id=s.equip_id;
                        --OR
        SELECT e.EQUIP_ID,	EQUIP_MAKE,	EQUIP_TYPE,	EQUIP_OS,	
        EQUIP_LIC,	EQUIP_LIC_EXPIRE_DATE,	COMPUTER_SW	REG_OWNER_ID,	COMPUTER_SN
        FROM equipment_reg e, SN_Lookup s WHERE  e.equip_id=s.equip_id;


-- 2) List experts for a given problem area.
        SELECT * FROM HD_specialISts h, employee_reg e WHERE h.employee_id=e.employee_id AND h.specialISt_area_code='HW';


-- 3) Produce a list of unresolved problems with the assigned specialISt.
        -- using HD_SpecialISt_ID

        SELECT * FROM call_details WHERE call_active=1 AND HD_Specialist_ID=504;

        -- or BY FIRST_NAME + LAST_NAME using joins.
        SELECT * FROM HD_SpecialISts h, employee_reg e, call_details c WHERE c.HD_SpecialISt_ID = h.HD_SpecialISt_ID 
        AND h.employee_id = e.employee_id AND call_active=1 
        AND FIRST_NAME='Aileen' AND LAST_NAME='Blanchard'


-- 4) Produce a list of problems reported BY assigned member of staff. 
        --via staff caller ID
        SELECT * FROM call_details WHERE CALLER_ID=1004;

        --via staff first_name AND last_name
        SELECT * FROM call_details WHERE CALLER_ID=
        (SELECT EMPLOYEE_ID FROM employee_reg WHERE FIRST_NAME='Estella' AND LAST_NAME='Potter');
        
-- 5) Display the average time taken to fix a fault for a given problem area. e.g. 'GEN' (for General)
        
        SELECT AVG(Hours_call_active) AS Avg_Resolve_Time_Hours FROM 
        (SELECT Problem_Type_ID, (sysdate + (CALL_CLOSED_TIME - CALL_OPEN_TIME)*24 - sysdate) Hours_call_active 
        FROM call_details WHERE PROBLEM_TYPE_ID='&PROBLEM_TYPE_ID');

        -- Average grouped by Problem
        SELECT  Problem_Type_ID, AVG(sysdate + (CALL_CLOSED_TIME - CALL_OPEN_TIME)*24 - sysdate) Avg_hours_call_active 
        FROM       call_details 
        GROUP BY   Problem_Type_ID
        ORDER BY Avg_hours_call_active DESC;


-- 6) Display the most common faults AND ORDER them according to their frequency of occurrence.        
        SELECT PROBLEM_TYPE_ID, count(*) Freq_Occurance FROM call_details 
        GROUP BY PROBLEM_TYPE_ID ORDER BY Freq_Occurance DESC; 


-- 7) Display the piece of equipment with the most reported problems showing problem details.

        SELECT  COMPUTER_SN, Problem_Type_ID, Comments, Call_ID FROM call_details 
        WHERE COMPUTER_SN = (SELECT COMPUTER_SN  FROM call_details 
        GROUP BY  COMPUTER_SN 
        HAVING    count(COMPUTER_SN) = 
        (SELECT max (freq) FROM (SELECT COMPUTER_SN, count(COMPUTER_SN) freq FROM call_details GROUP BY  COMPUTER_SN)));


-- 8) Produce a list of problems that have been solved BY the helpdesk operator (HD_Operator).
        --There are two assumptions. 
        --These are  1)  that if the called was closed then it was resolved.
                 --  2)  that if the HD_SPECIALIST_ID IS NULL when call was closed then it was resolved BY Operator.

        -- To show all problems resolved BY helpdesk operator.
       SELECT * FROM HDOP_Resolved_V;  --using a prebuilt view.
        
                    --OR WITHOUT USING A VIEW
        SELECT CALL_ID, PROBLEM_TYPE_ID, COMMENTS, RESOLUTION_CODE, 
        (sysdate + (CALL_CLOSED_TIME - CALL_OPEN_TIME)*24) - sysdate Time_to_Resolve_Hrs  
        FROM call_details WHERE  CALL_ACTIVE = 0 AND HD_SPECIALIST_ID IS null;

        -- To show all calls resolved BY a particular helpdesk operator including operator details.
        SELECT * FROM call_details WHERE  CALL_ACTIVE = 0 AND HD_SPECIALIST_ID IS null AND HD_OPERATOR_ID =1022;


-- 9) Add new specialist to the database. 
--      It is not mentioned if the new specialist is a current employee or a new hire.
--      If a new_hire needs to be added to the employee_reg table first using format;  
        --INSERT INTO Employee_reg
        --VALUES
        --(Emp_seq.NEXTVAL,'First_Name',	 'Last_Name',	 'EMAIL',	'Phone',	'Department',	'Job_Code');
        -- For example:
        INSERT INTO Employee_reg
        VALUES
        (Emp_seq.NEXTVAL,'Micky', 'Mouse', 'Micky@Mouse.com',	'1-555-2387',	'Tech Support',	'ENG');
        -- then add as a specalist.
        
        INSERT INTO HD_Specialists VALUES (SPL_seq.NEXTVAL, (SELECT employee_id from employee_reg 
        where upper(First_Name)='MICKY' and upper(Last_Name)='MOUSE') ,'NET');





-- 10) Assign a specialist for a given problem. e.g Hardware problem (HW)
--      It must be unresolved, unassigned AND match find a matching specialISt.
        --Steps are 
        --a) Find the specialISt(s) AND specialISt_areas with the least amount of active calls.
            SELECT * from Spec_Min_Calls_V 
            --(Note: In this example there are two specialists with 0 calls assigned)
            
        --b) find the calls that are active(unresolved), that match the problem_ID's from above step 
        --  AND have no specialISt assigned AND have problem_id's recorded as 'HW'.
            SELECT call_id from call_details where 
            (problem_type_id in (SELECT SPECIALIST_AREA_CODE from Spec_Min_Calls_V) 
            AND problem_type_id='HW')
            AND CALL_ACTIVE=1 AND HD_SPECIALIST_ID IS null AND ROWNUM <= 1;
            --(Note: There IS 1 record that matches the above critera in our example,
            -- but it is possible that 0 or >1 calls are returned hence ROWNUM <= 1 returns the first.
            -- This is a limitation as it would be possible to SELECT from the records based on the
            -- call that is opened the longest.)

        --c) Assign the first call_ID returned from step 2 (if any) to that specialist using the update statement.
        --  The comments field are also appended in the full SQL query listed below.
        --  Note the problem_type_id and SPECIALIST_AREA_CODE both need to be set e.g. 'HW' in this example. 
        --  A subsitution varable could be used here by prefixing with a & symbol.

            UPDATE call_details SET HD_SPECIALIST_ID = (
            SELECT HD_SPECIALIST_ID from Spec_Min_Calls_V where SPECIALIST_AREA_CODE='HW'),
            Comments = 
            to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SS') 
            || ' Call handed off to specialist ' 
            || (SELECT comments FROM call_details WHERE call_id= (
            (
            SELECT call_id FROM call_details where 
            (problem_type_id IN (SELECT SPECIALIST_AREA_CODE from Spec_Min_Calls_V) 
            AND problem_type_id='HW')
            AND CALL_ACTIVE=1 AND HD_SPECIALIST_ID IS null AND ROWNUM <= 1)
            )) 
            ||chr(13)
            ||chr(10) 
            WHERE call_ID = (
            SELECT call_id from call_details where 
            (problem_type_id in (SELECT SPECIALIST_AREA_CODE from Spec_Min_Calls_V) 
            AND problem_type_id='HW')
            AND CALL_ACTIVE=1 AND HD_SPECIALIST_ID IS null AND ROWNUM <= 1);


-- 11) Update call with appropiate details when the problem has been resolved.
            -- Call_ID and Resolution code and closing_comment to be populated by person closing the call.
            -- Notes; limitation: input data not sanatised.
            -- This closes the call but it still remains in the database so maintenance history can be viewed 
            -- for a piece of equipment.
 
            UPDATE Call_Details SET 
            Call_Closed_Time = SYSTIMESTAMP,
            Comments= ' &Closing_comment '||'   Call Resolved   ' 
            || (SELECT comments FROM call_details WHERE call_id='&&call_id') ||chr(13)||chr(10),
            Call_Active = 0,
            Resolution_Code = '&Resolution_Code'
            WHERE call_id = '&&call_id';
    
            -- The query below would remove closed/resolved calls from the database.
            delete from call_details where call_active=0;
            



            

