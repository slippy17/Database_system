-- Assignment Task 4
-- 1) List details of equipment and assciated software.
        select * from equipment_reg e, SN_Lookup s where  e.equip_id=s.equip_id;

-- Assignment Task 4
-- 2) List details of equipment and software.
        select * from HD_specialists h, employee_reg e where h.employee_id=e.employee_id and h.specialist_area_code='HW';

-- Assignment Task 4
-- 3) Produce list of unresolved problems with the assigned specialist.
        select * from call_details where call_active=1 and HD_SPECIALIST_ID=504;

-- Assignment Task 4
-- 4) Produce list of unresolved problems with the assigned specialist.
        select * from call_details where CALLER_ID=2004;

-- Assignment Task 4
-- 5) Produce list of unresolved problems with the assigned specialist.




select * from employee_reg;

select * from equipment_reg;

select * from equipment_owners;

select * from Specialist_Category_Codes

select * from HD_specialists

insert into HD_specialists values (500, 1012, 'NET');

delete from HD_specialists where HD_specialist_ID=500;

insert into HD_specialists values (500, 1005, 'NET');
insert into HD_specialists values (501, 1018, 'GEN');
insert into HD_specialists values (502, 1020, 'HW');
insert into HD_specialists values (504, 1018, 'HW');


-- Log new call



-- Alter problem type



-- Look-up previous problems 
--      of a specific type
--      on same piece of equipment
--      from this caller



-- Who are the specialists that deal with this.



-- Query how many live problems this specialist has.



-- Update comments section

update call_details set comments= 
systimestamp || ' Handed to specialist ' || (select comments from call_details where call_id=31000000) ||chr(13)||chr(10) where call_id=31000000;


update call_details 
set comments= 
to_char(systimestamp, 'YYYY-MM-DD HH24:MI:SS') 
|| ' Handed to specialist ' 
|| (select comments from call_details where call_id=31000000) 
||chr(13)
||chr(10) 
where call_id=31000000;






-- Assignement Task 4
-- 9) Add new specialist to the database.
-- 
--      First check if new specialist is a current employee. Note employee_id
        SELECT * FROM employee_reg;
--              Add if necessary using,
                     INSERT INTO Employee_Reg table using. --   User where it asks for details of each field.
--      Then add that employee using
                       INSERT INTO HD_Specialists
        

-- Assignment Task 4
-- 10) Assign specialist for a given problem.


-- Assignment Task 4
-- 11) Update call with appropiate details and resolution





        





























