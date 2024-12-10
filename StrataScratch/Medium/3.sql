--Income By Title and Gender--

ID 10077

/**
Find the average total compensation based on employee titles and gender. Total compensation is calculated by 
adding both the salary and bonus of each employee. However, not every employee receives a bonus so disregard employees
without bonuses in your calculation. Employee can receive more than one bonus.
Output the employee title, gender (i.e., sex), along with the average total compensation.


employee_title	sex	avg_compensation
Senior Sales	M	5350
Auditor	M	2200
Manager	F	209500
Sales	M	4600


sf_employee

address:text
age:bigint
city:text
department:text
email:text
employee_title:text
first_name:text
id:bigint
last_name:text
manager_id:bigint
salary:bigint
sex:text
target:bigint

sf_bonus

bonus:bigint
worker_ref_id:bigint

**/

--SQL Query--

with cte as 
(select worker_ref_id, sum(bonus) as bonus_total
from sf_bonus
group by worker_ref_id)
  
select e.employee_title,e.sex, avg(e.salary + c.bonus_total)
from sf_employee e join cte c on e.id = c.worker_ref_id 
group by e.employee_title,sex;



