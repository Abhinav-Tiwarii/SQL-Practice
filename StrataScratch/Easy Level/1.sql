--Admin Department Employees Beginning in April or Later--

/**
Find the number of employees working in the Admin department that joined in April or later.

worker

department:text
first_name:text
joining_date:date
last_name:text
salary:bigint
worker_id:bigint

*/

--SQL Query--
select count(*) as n_admins from worker where 
month(joining_date)>='04' and department = 'Admin';
