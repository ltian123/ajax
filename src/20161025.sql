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

comment on table department is '���ű�'
select * from user_tab_comments

create table g(id number);

����:(sequence ):һ���й��ɵ�����
create sequence ������
[increment by n]--ָ������
[start with n]--���еĳ�ʼֵ
[minvalue n]--���е���Сֵ
[maxvalue n]---���е����ֵ
[cache n] --��������������ֵĸ�����Ĭ����20
[cycle]--ѭ��




create sequence ss1;
���е�ʹ��:
   ����: nextval :��һ��ֵ
        currval��current  ��ǰ��ֵ
    ʹ�ã�������.����
    ps:����һ��ʹ������ʱ�������ȵ���nextval����
    select ss1.nextval from dual;
    select ss1.currval from dual
    
    insert into g values(ss1.currval);
    insert into g values(ss1.nextval);
    select * from g
create sequence ss2 increment by 10 start with 5 maxvalue 60 cache 6 cycle
select ss2.nextval from dual;

Լ��(constraint)
1��������primary  key)
2���ǿ�(not null)����һ��д��
3��Ψһ(unique)
4�����(check)��
5�����(foreign key):����  �ӱ�
drop table person1
Լ��������д��
1��
create table person(pid varchar2(18) primary key,
name varchar2(20) unique,
sex varchar2(2) default '��' check(sex in('��','Ů')),
birthday date)
2��
create table person1(pid varchar2(18),
name varchar2(20),
sex varchar2(2) default '��',
birthday date,
constraint person1_pid_pk primary key(pid),
constraint person1_name_uq unique(name),
constraint person1_sex_ck check(sex in('��','Ů')));
insert into person1 values('2134','sf','��',sysdate);

select * from user_constraints

insert into person(pid,name) values('345','name');


drop table book

create table book(bid number(4),
bname varchar2(20),
pid varchar2(18) references person(pid) on delete cascade);
on delete cascade---�������Լ����ϵ��ֱ��ɾ�����������

create table book1(bid number(4),
bname varchar2(20),
pid varchar2(18),
constraint person1_book1_pid_fk foreign key(pid) references person1(pid))

drop table goods
�и��̵�����ݿ⣬��¼�ͻ��͹���������
��Ʒ�� goods(goodsid,goodsname,unitprice,category ��Ʒ�����,provider)
customer (customerid,name,address,email,sex,cardid)
purchase(customerid,goodsid,nums)
1������������ÿ����������
2���ͻ�����������Ϊ��
3�����۱������0,���������������1��50֮��
4�������ʼ������ظ�
5���ͻ����Ա������male����female��Ĭ����male��

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

Լ���Ĺ���
  ���Լ��
  alter table ���� add constraint Լ���� Լ��(�ֶ�);
  ɾ��Լ��
  alter table ���� drop constraint Լ����
  ������Լ��
  alter table ���� rename constraint �ɵ�Լ���� to �µ�Լ����
 ����Լ��
  alter table ���� disable constraint Լ���� [cascade]
  cascade:�����رմ����������Թ�ϵ��Լ���������)
  ����Լ��:
     alter table ���� enable constraint Լ����
  
  insert update delete
  insert into ���� values(ֵ1,ֵ2,....);
  insert into ����(�ֶ���1,�ֶ���2,....) values(ֵ1,ֵ2,....);
  
  insert into ���� select���
  insert into ����(�ֶ���1���ֶ���2,...) select ���
  
  desc department
  select * from scott.dept
  insert into department  select deptno,dname from scott.dept;
  select * from department
 
 update
   update ���� set �ֶ���=��ֵ [where ����]
   
 delete
 delete [from] ���� [where ����]
 delete book
 
����commit  rollback
rollback
���ûع���:
savepoint ����;
rollback to ����
ps��һ���ύ���޷��ع�

truncate table ����
truncate table department
delete��truncate������
1��delete����Ҫ�ύ�����Ч��truncate�Զ���Ч
2��delete����ɾ���������ݣ���truncateֻ��ɾ��ȫ��������
3��delete��ɾ���ٶ�����ԭ����delete��д��־��turncate����Ҫд��־

drop table ���� cascade constraint --ɾ������ͬ���е�Լ��һ��ɾ��



 
 
 
   
  
  
      
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
  
  
  
  


















