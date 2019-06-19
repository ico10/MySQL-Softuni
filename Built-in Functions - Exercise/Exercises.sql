1

select first_name, last_name
from employees
where first_name like 'Sa%'
order by employee_id;

2

select first_name, last_name
from employees
where last_name like '%ei%'
order by employee_id;

3

select first_name
from employees
where (department_id = 3 OR department_id = 10) and YEAR(hire_date) between 1995 and 2005
order by employee_id;

4

select first_name, last_name
from employees
where job_title not like '%engineer%'
order by employee_id;

5

select `name`
from towns
where char_length(`name`) = 5 or char_length(`name`) = 6
order by `name`;

6

select `town_id`, `name`
from towns
where left(name, 1) = 'M' or
left(name, 1) = 'K' or
left(name, 1) = 'B' or
left(name, 1) = 'E'
order by `name`;

7

select `town_id`, `name`
from towns
where not (left(name, 1) = 'R' or
left(name, 1) = 'B' or
left(name, 1) = 'D')
order by `name`;

8

create view v_employees_hired_after_2000
as select first_name, last_name
from employees
where year(hire_date) > 2000;

9

select first_name, last_name
from employees
where char_length(last_name) = 5;

10

select country_name, iso_code
from countries
where country_name like '%a%a%a%'
order by iso_code;

11

select peaks.peak_name, rivers.river_name, 
lower(concat(left(peaks.peak_name, char_length(peaks.peak_name) - 1), rivers.river_name)) as mix
from peaks, rivers
where right(peak_name, 1) = left (river_name, 1)
order by mix;

12

select `name`, date_format(`start`, "%Y-%m-%d")
from games
where year(`start`) = 2011 or year(`start`) = 2012
order by `start`,
`name` limit 50;

13

select user_name, right(email, char_length(email) - locate('@', `email`)) as 'Email Provider'
from users
order by `Email Provider`,
user_name;

14

select user_name, ip_address
from users
where ip_address like '___.1%.%.___'
order by user_name;

15

select `name`, 
case
when hour(start) between 0 and 11
then 'Morning'
when hour(start) between 12 and 17
then 'Afternoon'
when hour(start) between 18 and 23
then 'Evening'
end as 'Part of the Day',
case
when duration <= 3
then 'Extra Short'
when duration between 4 and 6
then 'Short'
when duration between 7 and 10
then 'Long'
else 'Extra Long'
end as 'Duratiom'
from games;

16

select `product_name`, `order_date`,
date_add(`order_date`, interval 3 day) as pay_due,
date_add(`order_date`, interval 1 month) as deliver_due
from orders;