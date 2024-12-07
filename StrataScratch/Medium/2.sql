--Number Of Units Per Nationality--
/*
Find the number of apartments per nationality that are owned by people under 30 years old.
Output the nationality along with the number of apartments.
Sort records by the apartments count in descending order.

--airbnb_hosts--
age:bigint
gender:text
host_id:bigint
nationality:text

--airbnb_units--
city:text
country:text
host_id:bigint
n_bedrooms:bigint
n_beds:bigint
unit_id:text
unit_type:text
*/

select h.nationality,
count(distinct u.unit_id) as apartment_count
from airbnb_hosts h
join airbnb_units u
on h.host_id = u.host_id
where h.age <30 and
u.unit_type = 'Apartment'
group by h.nationality
order by apartment_count desc;
