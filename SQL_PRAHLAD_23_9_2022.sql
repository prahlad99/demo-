select * from empc4

create table empc4 as select * from empc1

select * from empc4;

insert into empc4 values(9000,'PRAHLAD','DEVELOPER',8000,sysdate,3400,null,40);

insert into empc4 values(9001,'ARUN','MANAGER',9800,sysdate,3400,null,40);

update empc4 set job='DEVELOPER' where ename='PRAHLAD';

savepoint A;

update empc4 set job='MANAGER' where ename='PRAHLAD';

delete from empc4 where ename='PRAHLAD';

insert into empc4 values(9782,'RAJU','MANAGER',9000,sysdate,3400,null,4);

insert into empc4 values(9783,'AJAY','SALESMAN',8900,sysdate,3500,null,20);

insert into empc4 values(9784,'AMIT','CLERK',8809,sysdate,3500,null,20);

savepoint B;

insert into empc4 values(9785,'ADAM','MANAGER',8900,sysdate,3500,null,20);

insert into empc4 values(9786,'SONU','MANAGER',8901,sysdate,3500,null,20);

update empc4 set job='ASSOCIATE' where ename='AMIT';

update empc4 set job='ASSOCIATE' where ename='SONU';

savepoint C;

insert into empc4 values(9787,'MONU','MANAGER',8001,sysdate,3400,null,20);

update empc4 set job='ASSOCIATE' where ename='MONU';

savepoint D;

delete empc4;  
select * from empc4;   

rollback to savepoint D;

select * from empc4;        

rollback to savepoint C;

select * from empc4;           

rollback to savepoint B;

select * from empc4;           

rollback to savepoint A;

select * from empc4;           

commit;