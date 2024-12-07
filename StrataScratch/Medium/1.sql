--Ranking Most Active Guests
/*
Rank guests based on the total number of messages they've exchanged with any of the hosts. 
Guests with the same number of messages as other guests should have the same rank. 
Do not skip rankings if the preceding rankings are identical.
Output the rank, guest id, and number of total messages they've sent. 
Order by the highest number of total messages first.


--airbnb_contacts--
ds_checkin:datetime
ds_checkout:datetime
id_guest:text
id_host:text
id_listing:text
n_guests:bigint
n_messages:bigint
ts_accepted_at:timestamp
ts_booking_at:timestamp
ts_contact_at:timestamp
ts_reply_at:timestamp
*/
---Sql Query--
select id_guest, 
dense_rank() over(order by sum(n_messages) desc) as ranks, 
sum(n_messages) as messages
from airbnb_contacts
group by id_guest;



