create table employee (
e_id integer,
e_name varchar (30), 
salary decimal (7, 2),
primary key (e_id) 
  );
insert into employee values
(1, 'Abdullah', 9000.00),
(2, 'Khalid', 10000.00), 
 (3, 'Sarah', 11000.00),
 (4, 'Muhammad', 12000.00);
create table client (
c_id integer,
c_name varchar (30),
city varchar (30), 
primary key (c_id)
  );
insert into client values
  (1, 'Fahad', 'Riyadh'),
  (2, 'Faisal', 'Dammam'), 
  (3, 'Abdulaziz', 'Jeddah'),
  (4, 'Reem', 'Riyadh'),
  (5, 'Ahmed', 'Hail'),
  (6, 'Lama', 'Jeddah'), 
  (7, 'Majid', 'Qassim'), 
  (8, 'Lara', 'Dammam');

create table orders ( 
 o_id integer,
cost decimal (7, 2),
o_date date,
e_id integer,
c_id integer,
primary key (o_id),
foreign key (e_id) references employee(e_id),
foreign key (c_id) references client(c_id) 
  );
insert into orders values
(1, 100, '2020-10-15', 1, 1), 
(2, 200, '2020-11-12', 1, 2), 
(3, 300, '2020-12-08', 2, 3), 
(4, 400, '2021-01-01', 2, 4), 
(5, 500, '2021-02-22', 3, 5), 
(6, 600, '2021-03-27', 3, 6), 
(7, 700, '2021-04-19', 4, 7), 
(8, 800, '2021-05-03', 4, 1), 
(9, 900, '2021-06-15', 4, 1), 
(10, 1000, '2021-07-01', 4, 2);
create table old_client (
c_id integer,
c_name varchar (30),
city varchar (30),
primary key (c_id) );



select  o_date , cost 
from orders
where e_id in 
(select e_id 
    from employee
    where e_name = 'sarah');
select c_name ,cost 
             from  client
             INNER JOIN  orders 
             on client.c_id = orders.c_id ;
select c_name , city ,o_id ,cost ,o_date 
from client 
left join orders
where client.c_id = orders.c_id ;



select * from employee where salary = ( select max(salary) from employee);
select* from employee where salary =( select Min(salary)from employee);

select  AVG(salary), count(*) 
from employee ;
  
select e_name, SUM(cost) 
from employee , orders 
where employee.e_id = orders.e_id 
group by e_name ;


create trigger before_client_delete
before delete
on client for each row 
begin
  insert into 
  old_client(c_id,c_name ,city)
  values (old.c_id, old.c_name ,old.city);


end ;
delete from client 
where c_id =1;

select * from old_client ;


select '....' ;
select * from client ;

create view client_spent(c_name, city , total_costs)as 
select c_name , city , SUM(cost)
from client natural join orders
group by c_id ;
 select * from  client_spent ;

create view sales_by_employee (e_name, salary ,number_of_orders) as 
select e_name, salary ,count(o_id)
from employee natural join orders 
group by e_id ;
select   * from sales_by_employee ;

drop table orders ;
select * from orders ;

alter table employee add date_of_birth date ;
.header on 
select * from employee ;

update employee
set salary = salary -1000 ;
.header on 
select * from employee ;

delete from employee
where salary>10000;
.header on 
select * from employee ;


  