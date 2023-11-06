use abhishek
go

select * from student

select Gender,count(Rollnumber) as Total from student
group by Gender

select Gender,min(Age) as Total from student
group by Gender

select distinct gender ,count(Rollnumber) over(partition by Gender) as Total from student

select Name,Age from student

select Name, Age ,row_number() over(order by Name) as SrNO
FROM student

select Name, Age ,row_number() over(order by Age) as SrNO
FROM student

select Name,Age,row_number() over(partition by Age order by Age) as SrNo
from student

select Name,Gender,row_number() over(partition by Gender order by Gender) as SrNo
from student

create table #stud
(
Name varchar(50),
City varchar(50)
)
go
insert into #stud values('Sachin','Pune'),
('Rupesh','Pune'),('Aaryan','Mumbai')

select * from #stud

-- find duplicate records
select row_number() over(order by name) as SrNo,Name, City from #stud

select row_number() over(partition by name order by name) as SrNo,Name, City from #stud

insert into #stud values('Sachin','Mumbai')

go

with cte
as
(
select row_number() over(partition by name,city order by name) as SrNo,name,city from #stud
)
select * from cte where SrNo > 1

insert into #stud values('Sachin','Pune')
insert into #stud values('Sachin','Pune')
insert into #stud values('Sachin','Mumbai')
insert into #stud values('Rupesh','Pune')

select * from #stud

with cte
as
(
select row_number() over(partition by name,city order by name) as SrNo,name,city from #stud
)
delete from cte where SrNo > 1

select * from #stud

select Name,Age from student

select Name,Age, row_number() over (order by Age) as RSrNo from student

select Name,Age, row_number() over (order by Age) as RSrNo,
rank() over(order by Age)as rankSrNo
from student

select Name,Age, row_number() over (order by Age) as RSrNo,
rank() over(order by Age)as rankSrNo,
dense_rank() over(order by Age)as DenseSrNo
from student



select name,paidfees from student

select max(paidfees) from student

select name,paidfees from student order by paidfees desc

select name,paidfees,rank() over (order by paidfees desc) as SrNo from student

with cte 
as
(
select name,paidfees,rank() over(order by paidfees desc) as SrNo from student
)
select * from cte where SrNo = 3

with cte 
as
(
select name,paidfees,dense_rank() over(order by paidfees desc) as SrNo from student
)
select * from cte where SrNo = 5

select max(paidfees) from student
where paidfees <
(select max(paidfees) from student)

































































