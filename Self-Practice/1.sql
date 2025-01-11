--SQL LinkedIn Practice
/*
create or replace table playbook_users(
user_id int primary key,
created_at datetime, 
company_id int,
language varchar(50),
activated_at datetime,
state varchar(50)
);

insert into playbook_users
(user_id, created_at, company_id,language, activated_at,state)
values
(1, '2024-01-01 08:00:00', 101, 'English', '2024-01-05 10:00:00', 'Active'),
(2, '2024-01-02 09:00:00', 102, 'Spanish', '2024-01-06 11:00:00', 'Inactive'),
(3, '2024-01-03 10:00:00', 103, 'French', '2024-01-07 12:00:00', 'Active'),
(4, '2024-01-04 11:00:00', 104, 'English', '2024-01-08 13:00:00', 'Active'),
(5, '2024-01-05 12:00:00', 105, 'Spanish', '2024-01-09 14:00:00', 'Inactive');


CREATE TABLE playbook_events ( 
user_id INT,
occurred_at DATETIME, 
event_type VARCHAR(50), 
event_name VARCHAR(50),
location VARCHAR(100), 
device VARCHAR(50));


INSERT INTO playbook_events (user_id, occurred_at, event_type, event_name, location, device) VALUES
(1, '2024-01-05 14:00:00', 'Click', 'Login', 'USA', 'MacBook-Pro'),
(2, '2024-01-06 15:00:00', 'View', 'Dashboard', 'Spain', 'iPhone 5s'),
(3, '2024-01-07 16:00:00', 'Click', 'Logout', 'France', 'iPad-air'),
(4, '2024-01-08 17:00:00', 'Purchase', 'Subscription', 'USA', 'Windows-Laptop'), 
(5, '2024-01-09 18:00:00', 'Click', 'Login', 'Spain', 'Android-Phone');


--Find the number of Apple product users and the number of total users with a device and group the counts by 
language. Assume Apple products are only MacBook-Pro, iPhone 5s, and iPad-air. Output the language along with 
the total number of Apple users and users with any device. Order your results based on the number of total 
users in descending order.

select * from playbook_events;
select * from playbook_users;
*/
-------------
select pu.language
,count(distinct(case when pe.device in ('MacBook-Pro', 'iPhone 5s', 'iPad-air') then (pe.user_id) else NULL end)) 
as apple_prdct_user
,count(DISTINCT(pe.user_id)) as total_user
from playbook_events pe join playbook_users pu
on pe.user_id = pu.user_id
group by pu.language
order by total_user desc
;




---
