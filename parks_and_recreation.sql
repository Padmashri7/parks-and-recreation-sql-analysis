SELECT * 
FROM parks_and_recreation.employee_demographics
;

SELECT * 
FROM parks_and_recreation.employee_salary
;

select*
from employee_salary
where salary >=50000
;

select*
from employee_salary
where salary <50000
;

select*
from employee_demographics
where gender = 'Male'
;

select*
from employee_demographics
where gender != 'Male'
;

select*
from employee_demographics
where birth_date > '1985-01-01'
;

select*
from employee_demographics
where birth_date > '1985-01-01'
and gender = 'male'
;

select*
from employee_demographics
where birth_date > '1985-01-01'
and gender != 'male'
;

select*
from employee_demographics
where birth_date > '1985-01-01'
or gender = 'male'
;

select*
from employee_demographics
where (first_name = 'leslie' and age = 44) or age >57
;

-- like statement
-- % and _

select*
from employee_demographics
where first_name = 'jerry'
;

select*
from employee_demographics
where first_name = 'jer'
;

select*
from employee_demographics
where first_name like 'jer%'
;

select*
from employee_demographics
where first_name like 'er%'
;

select*
from employee_demographics
where first_name like '%er%'
;

select*
from employee_demographics
where first_name like 'a___'
;

select*
from employee_demographics
where first_name like 'a__'
;

select*
from employee_demographics
where first_name like 'a_%'
;

select*
from employee_demographics
where birth_date like '1989%'
;

select gender, avg(age)
from employee_demographics
group by gender
;

select occupation, salary
from employee_salary
group by occupation, salary
;

select gender, avg(age), max(age), min(age), count(age)
from employee_demographics
group by gender
;

-- order by

select *
from employee_demographics
order by age desc
;

select *
from employee_demographics
order by first_name
;

select *
from employee_demographics
order by gender, age
;

-- position of columns - numbers agein 4th column, gender - 5th 

select *
from employee_demographics
order by 5, 4
;

select gender, avg(age)
from employee_demographics
group by gender
having avg(age) > 40
;

select occupation, avg(salary)
from employee_salary
group by occupation
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
;

select occupation, avg(salary)
from employee_salary
where occupation like '%manager%'
group by occupation
having avg(salary) >70000
;

-- limit

select *
from employee_demographics
limit 5
;

select *
from employee_demographics
order by age desc
limit 5
;

-- aliasing

select gender, avg(age) as avg_age
from employee_demographics
group by gender
having avg_age > 40
;

-- join 

select dem.employee_id, occupation, age, salary
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id=sal.employee_id
;

select *
from employee_demographics as dem
left join employee_salary as sal
on dem.employee_id=sal.employee_id
;

select *
from employee_salary emp1
join employee_salary emp2
   on emp1.employee_id +1 = emp2.employee_id
;

select emp1.employee_id as emp_santa,
emp1.first_name as first_name_santa,
emp1.last_name as last_name_santa,
emp2.employee_id as emp_santa,
emp2.first_name as first_name_santa,
emp2.last_name as last_name_santa
from employee_salary emp1
join employee_salary emp2
on emp1.employee_id +1 = emp2.employee_id
;

select *
from employee_demographics as dem
inner join employee_salary as sal
on dem.employee_id=sal.employee_id
inner join parks_departments pd
on sal.dept_id = pd.department_id
;

select *
from parks_departments
;

--- string functions

select first_name, length(first_name)
from employee_demographics
order by 2
;

-- orderby 2- column no

select upper('employee');
select lower('emPloYee');

select first_name, Upper(first_name)
from employee_demographics
;

select trim('         employee        ');
select Ltrim('         employee        ');
select Rtrim('         employee        ');

select first_name, 
left(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,1,4) as birth_year
from employee_demographics
;

select first_name, replace(first_name, 'e', 'r')
from employee_demographics
;

select first_name, locate('an',first_name)
from employee_demographics
;

select first_name, last_name,
concat(first_name, last_name)
from employee_demographics
;

select first_name, last_name,
concat(first_name,'_', last_name) as full_name
from employee_demographics
;

select first_name, last_name,
concat(first_name,' ', last_name) as full_name
from employee_demographics
;

select first_name, last_name, age,
case
when age <= 30 then 'young'
when age between 31 and 50 then 'old'
when age >= 51 then "on death's door"
End age_parameter
from employee_demographics
;

-- pay increase and bonus
-- <50000 = 5%
-- > 50000 = 7%
-- finance = 10%

select first_name, last_name, salary,
case
when salary < 50000 then salary + (salary * 0.05)
when salary > 50000 then salary + (salary * 0.07)
End as New_salary,
case
when dept_id = 6 then salary + (salary * 0.10)
end as bonus
from employee_salary
;

select*
from employee_salary
;
select *
from parks_departments
;

select *
from employee_demographics
where employee_id in
    (select employee_id
    from employee_salary
    where dept_id = 1)
;

select gender, avg(age), max(age), Min(age), count(age)
from employee_demographics
group by gender
;

select gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
;

select gender, avg(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

select dem.first_name, dem.last_name, gender, avg(salary) as avg_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by dem.first_name, dem.last_name, gender
;

select dem.first_name, dem.last_name, gender, 
sum(salary) over(partition by gender)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

select dem.first_name, dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_salary
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over ()
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over (partition by gender order by salary desc)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

select dem.employee_id, dem.first_name, dem.last_name, gender, salary,
row_number() over (partition by gender order by salary desc) as row_no,
rank() over (partition by gender order by salary desc) as rank_no,
dense_rank() over (partition by gender order by salary desc) as denserank_no
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
;

with cte_example as
(
select gender, avg(salary), Max(salary), Min(salary), Count(salary)
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select*
from cte_example
;

with cte_example as
(
select gender, avg(salary) avg_sal, Max(salary) max_sal, Min(salary) min_sal, Count(salary) count_sal
from employee_demographics dem
join employee_salary sal
on dem.employee_id = sal.employee_id
group by gender
)
select avg(avg_sal)
from cte_example
;

with cte_example as
(
select employee_id, gender, birth_date
from employee_demographics
where birth_date > '1985-01-01'
), 
cte_example2 as
(
select employee_id, salary
from employee_salary
where salary > 50000
)
Select *
from cte_example
join cte_example2
on cte_example.employee_id=cte_example2.employee_id
;


-- temporary table

select*
from employee_salary;

create temporary table salary_over_50k
select*
from employee_salary
where salary >= 50000
;

select*
from  salary_over_50k
;

-- stored procedure

create procedure large_salaries()
select *
from employee_salary
where salary >= 50000
;

call large_salaries();

create procedure large_salaries2()
select *
from employee_salary
where salary >= 50000
;
select *
from employee_salary
where salary >= 10000
;

delimiter $$
create trigger employee_insert
after insert on employee_salary
for each row
begin
insert into employee_demographics (employee_id, first_name, last_name)
values (new.employee_id, new.first_name, new.last_name);
End $$
Delimiter;

delimiter $$
create procedure large_salaries2()
begin
	select *
    from employee_salary
	where salary >= 50000;
    select *
    from employee_salary
	where salary >= 10000;
end $$
Delimiter ;

Insert into employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
Values (13, 'Jean', 'saperstein', 'extertainment ceo', 10000, null);

delimiter $$
create event delete_retirees
on schedule every 30 second
do 
begin 
delete
from employee_demographics
where age >= 60;
end $$
delimiter ;

