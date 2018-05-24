create table department(id number(7),name varchar2(25))
create table employee(id number(7),last_name varchar2(25),first_name varchar2(25),
dept_id number(7));
alter table employee modify last_name varchar2(50)
desc employee
select * from user_tables;

create table employee2(id,last_name,dept_id) as select empno,ename,deptno from scott.emp


drop table employee
rename employee2 to employee
desc employee
select * from scott.emp

comment on table department is '部门表'
select * from user_tab_comments

create table g(id number);

序列:(sequence ):一组有规律的数字
create sequence 序列名
[increment by n]--指定步长
[start with n]--序列的初始值
[minvalue n]--序列的最小值
[maxvalue n]---序列的最大值
[cache n] --缓存区放入的数字的个数，默认是20
[cycle]--循环




create sequence ss1;
序列的使用:
   属性: nextval :下一个值
        currval：current  当前的值
    使用：序列名.属性
    ps:当第一次使用序列时，必须先调用nextval属性
    select ss1.nextval from dual;
    select ss1.currval from dual
    
    insert into g values(ss1.currval);
    insert into g values(ss1.nextval);
    select * from g
create sequence ss2 increment by 10 start with 5 maxvalue 60 cache 6 cycle
select ss2.nextval from dual;

约束(constraint)
1、主键（primary  key)
2、非空(not null)：第一种写法
3、唯一(unique)
4、检查(check)：
5、外键(foreign key):父表  子表
drop table person1
约束的两种写法
1、
create table person(pid varchar2(18) primary key,
name varchar2(20) unique,
sex varchar2(2) default '男' check(sex in('男','女')),
birthday date)
2、
create table person1(pid varchar2(18),
name varchar2(20),
sex varchar2(2) default '男',
birthday date,
constraint person1_pid_pk primary key(pid),
constraint person1_name_uq unique(name),
constraint person1_sex_ck check(sex in('男','女')));
insert into person1 values('2134','sf','中',sysdate);

select * from user_constraints

insert into person(pid,name) values('345','name');


drop table book

create table book(bid number(4),
bname varchar2(20),
pid varchar2(18) references person(pid) on delete cascade);
on delete cascade---不管外键约束关系，直接删除父表的数据

create table book1(bid number(4),
bname varchar2(20),
pid varchar2(18),
constraint person1_book1_pid_fk foreign key(pid) references person1(pid))

drop table goods
有个商店的数据库，记录客户和购物的情况，
商品表 goods(goodsid,goodsname,unitprice,category 商品的类别,provider)
customer (customerid,name,address,email,sex,cardid)
purchase(customerid,goodsid,nums)
1、创建表，定义每个表的主外键
2、客户的姓名不能为空
3、单价必须大于0,购买的数量必须在1到50之间
4、电子邮件不能重复
5、客户的性别必须是male或者female，默认是male、

create table goods(goodsid number(4),
goodsname varchar2(20),
unitprice number(7,2),
category varchar2(20),
provider varchar2(20),
constraint goods_id_pk primary key(goodsid),
constraint goods_unitprice_ck check(unitprice>0));

create table customer(customerid number(4),
name varchar2(20) not null,
address varchar2(20),
email varchar2(30),
sex varchar2(6) default 'male',
cardid varchar2(18),
constraint customer_id_pk primary key(customerid),
constraint customer_email_uq unique(email),
constraint customer_sex_ck check(sex in('male','female')))

create table purchase(customerid number(4),
goodsid number(4),
nums number(3),
constraint cusotmer_purchase_id_fk foreign key(customerid) references customer(customerid),
constraint goods_purchase_id_fk foreign key(goodsid) references goods(goodsid),
constraint purchase_nums_ck check(nums between 1 and 30));

约束的管理
  添加约束
  alter table 表名 add constraint 约束名 约束(字段);
  删除约束
  alter table 表名 drop constraint 约束名
  重命名约束
  alter table 表名 rename constraint 旧的约束名 to 新的约束名
 禁用约束
  alter table 表名 disable constraint 约束名 [cascade]
  cascade:用来关闭存在有完整性关系的约束，（外键)
  启用约束:
     alter table 表名 enable constraint 约束名
  
  insert update delete
  insert into 表名 values(值1,值2,....);
  insert into 表名(字段名1,字段名2,....) values(值1,值2,....);
  
  insert into 表名 select语句
  insert into 表名(字段名1，字段名2,...) select 语句
  
  desc department
  select * from scott.dept
  insert into department  select deptno,dname from scott.dept;
  select * from department
 
 update
   update 表名 set 字段名=新值 [where 条件]
   
 delete
 delete [from] 表名 [where 条件]
 delete book
 
事务：commit  rollback
rollback
设置回滚点:
savepoint 点名;
rollback to 点名
ps：一旦提交后，无法回滚

truncate table 表名
truncate table department
delete和truncate的区别
1、delete是需要提交后才生效，truncate自动生效
2、delete可以删除部分数据，而truncate只能删除全部的数据
3、delete的删除速度慢，原因是delete会写日志，turncate不需要写日志

drop table 表名 cascade constraint --删除表连同表中的约束一起删除



 
 
 
   
  
  
      
   create  table my_employee(id number(2),last_name varchar2(20),
   first_name varchar2(20),userid varchar2(20),salary number(6));
   desc my_employee
   create sequence s12
   insert into my_employee values(s12.nextval,'Patel','Ralph','rpatel',795);
   insert into my_employee(id,last_name,first_name,userid,salary) values(
   s12.nextval,'Dancs','Betty','bdancs',860);
   select * from my_employee
  commit;
  update my_employee set last_name='Drexler' where id=3;
  update my_employee set salary=1000 where salary<900;
  delete my_employee where last_name='Dancs' and first_name='Betty';
  commit;
  savepoint a;
  delete my_employee
  select * from my_employee
  rollback to a
  commit
  
  
  
  


















