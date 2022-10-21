--**** JOINS****
--JOINS IS GET THE DATA FROM MULTIPLES TABLES USUALLY FOR REPORT GENERATION
--SQL Join statement is used to combine data or rows from two or more tables
--based on a common field between them. Different types of Joins are as follows: 
--
--INNER JOIN
--LEFT JOIN
--RIGHT JOIN
--FULL JOIN
--ALWAYS PARENT KEY OF THE ANOTHER VALUE--FOREIGN KEY
DESC EMP;
DESC DEPT;
--PRIMARY KEY THERE IS NO ANY DUPLICATE ,NO NULL VALUES
--IN EMP EMPNO IS PRIMARY KEY AND DEPTNO IS FOREIGN KEY;
--ROLL NO IS PRIMARY KEY CANT BE SAME 
--ANOMALIES UPDATE,DELETE,INSERT
--IN JOINS COLUMN NAME AND DATA TYPE WILL BE SAME IN BOTH COULMNS

--*BEFORE JOINING ANY TABLE DESCRIBE THE TABLE FOR CHECKING BOTH THE TABLE 
--HAS SAME DATA TYPE AND NAME AND MARK THE COLUMN 

--EQUI ,OUTER,NON EQUI,SELFJOIN,CROSS,
--EQUI JOIN-MATCING VALUES,NATURAL JOIN,USING CLAUSE,JOIN ON ,INNER JOIN ON

--OUTER JOIN-MATCHING VALUES+NON MATCHING VALUES,3 TYPES 
--LEFFT OUTER JOIN -MATCHING VALUES +NON MATCHING VALUES FROM THE LEFT TABLE
--RIGHT OUTER JOIN-MATCHING VALUES+NON MATCHING VALUES FROM THE RIGHT TABLE
--FULL OUTER JON-MATCHING VALUES+NON MATCHING VALUES FORM THE BOTH TABLE
--NON EQUI JOIN-TABLES ARE NOT RELATED LOGICALLY STILL U CAN JOIN
----SELF JOIN -A TABLE IS JOINED TO ITSELF
--CROSS JOIN-MATRIX MULTIPLICATION

--          **** SYTAX FOR JOIN****
--SELECT
--table1.column,table2.coulmn,....
--FROM table1
--[NATURAL JOIN table2]
--[JOIN TABLE2 USING (COMMON COLUMN)]|
--[JOIN TABLE 2 ON TABLE1.COMMON COLUMN =TABLE2.COMMON.COULUMN]|
--[LEFT|RIGHT|FULL OUTER JOIN TABLE2 ON TABLE1.COMMON COULMN=TABLE2.COMMON COLUMN]|
--[CROSS JOIN TABLE2];

SELECT EMP.ENAME ,EMP.SAL,DEPT.DNAME,DEPT.LOC FROM EMP NATURAL JOIN DEPT;

--** NATURAL JOIN DO'S AND DONOT'S******
--DO'S- MUST HAVE COMMON COLUMN ,DATA TYPE MUST MATCH 

--DONOT'S- COMMON COLUMN SHOULD NOT BE PREFIXED WITH TRABLE NAME
--more than one common column do not use
-- if common column will be diffrent then it will be cross join else natural join
SELECT EMP.ENAME ,EMP.SAL,emp.deptno,DEPT.DNAME,DEPT.LOC FROM EMP NATURAL JOIN DEPT;
--column used in NATURAL join cannot have qualifier
--25155. 00000 -  "column used in NATURAL join cannot have qualifier"

--Alias
--we should use alias it will give best space management

select e.ename,e.sal,deptno,d.dname,d.loc from emp e
natural join dept d;
create table empc as (select * from emp);
alter table empc rename column deptno to dono;
desc empc;

--** using **
--same column name only you have to mention that common column name
select e.ename,e.sal,deptno,d.dname,d.loc from emp e join dept d  using ( deptno);
-- ** join and on clause**
--common columns should be prefixed with the table name
select e.ename ,e.sal,e.deptno,d.deptno,d.loc 
from emp e
JOIN DEPT d
on e.deptno=d.deptno;

insert into emp(empno,ename,sal) values ( 2323,'ram',10000);
--commit


--*** left outer join***
select e.ename,e.sal,e.deptno,d.deptno,d.dname,d.loc
from emp e  Left outer join dept d  on e.deptno=d.deptno;

select * from  salgrade
--** non equi join****
SELECT e.empno,e.ename,e.sal,
 s.grade
 FROM emp e
 JOIN salgrade s
 ON e.sal BETWEEN s.losal AND s.hisal;
 --entity everthing is an entity human is also
 select empno ,ename,mgr from emp;
 -- self join is only happen if alias will be there
 SELECT e.ename emp_name,m.ename mgr_name
FROM emp e
JOIN emp m
ON e.mgr=m.empno;

---cross join 
SELECT e.ename ,d.dname
FROM emp e
cross join dept d;
--inner join
select e.ename,e.sal,e.deptno,d.dname,d.loc

from emp e inner join dept d on e.deptno=d.deptno;

 
 select e.en,e.mn,e.sal,e.deptno,d.deptno,d.dname,d.loc
 from SE e join dept d  on e.deptno=d.deptno
(SELECT e.empno,e.en,e.mn,e.sal,e.deptno
 s.grade
 FROM ms e
 JOIN salgrade s
 ON e.sal BETWEEN s.losal AND s.hisal)AS SE
( SELECT e.ename en ,m.ename mn ,e.sal,e.empno,e.deptno
FROM emp e
JOIN emp m
ON e.mgr=m.empno)as ms;

--*** join with where clause***
select e.ename,e.sal,e.deptno,d.dname,d.loc
from emp e
inner join dept d
on e.deptno=d.deptno
where e.empno=7902;

--trasaction -- collection of dml operation
--Insert command is used to put the data into the table
--**** SYTAX OF INSERT***
--INSERT INTO TABLE[COLUMN LIST]
--VALUES(DATA'S TO THE RESPECTIVE COLUMNS);
--DROP TABLE TABLENAME iS FOR DROP THE TABLE

--BEFORE RUN INSERT COMMAND YOU HAVE TO RUN DESC EMP FOR CHECKING DATA TYPE
--WHICH ONE ARE YOU WANTING TO ENTER THE DATA
INSERT INTO EMPC VALUES( 1234,'MONU','MANAGER',7360,SYSDATE,3400.34,NULL,20);
COMMIT;
--YOU MUST HAVE TO COMMIT AFTER INSERTING ANYTHING 
--IT IS CONSISTENCE STATE AFTER COMMITING 
SELECT * FROM EMPC;
--ALTER TABLE EMPC ADD PRIMARY KEY ( EMPNO);

INSERT INTO EMPC VALUES( 1230,'NITISH','MANAGER',7360,SYSDATE,3400.34,NULL,20);
COMMIT;
SELECT * FROM EMPC;
