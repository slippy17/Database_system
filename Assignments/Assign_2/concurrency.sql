/*******
Set up the database
Execute the following script to create a simple database involving two tables with some data in each.
*******/

/* drop tables and views */

drop table students cascade constraint;
drop table course_completed cascade constraint;

/* create tables */

create table students
(ID int primary key, name varchar2(20), program varchar2(20));

create table course_completed
(record_ID int primary key, student int references students(ID), 
	course varchar2(40), units int);

/* populate students table */


insert into students
values (1, 'John', 'BA MM');

insert into students
values (2, 'Jack', 'BSc Net');

insert into students
values (3, 'Jill', 'BSc Comp');

/* populate course_completed table */

insert into course_completed
values (1, 1, 'Operating Systems', 3);

insert into course_completed
values (2, 1, 'Database Systems', 3);

insert into course_completed
values (3, 2, 'Database Systems', 3);

insert into course_completed
values (4, 2, 'Software Engineering', 4);

insert into course_completed
values (5, 3, 'E-commerce', 3);

insert into course_completed
values (6, 3, 'Operating Systems', 3);

insert into course_completed
values (7, 3, 'Software Engineering', 4);

commit;

/*********
End of Script
**********/
