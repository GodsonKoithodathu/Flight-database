-- challenge 1:
-- Which passenger (passenger_name) has spent the most amount on their bookings (total_amount)?
select
passenger_name, 
sum (total_amount)
from tickets as t
inner join bookings as b
on t.book_ref = b.book_ref
group by passenger_name
order by sum (total_amount) desc;


-- challenge 2:
-- Which fare_condition has ALEKSANDR IVANOV used the most?
select 
	passenger_name,
	fare_conditions,
	count(fare_conditions)
from tickets as t
inner join bookings as b
on b.book_ref = t.book_ref
and t.passenger_name = 'ALEKSANDR IVANOV'
inner join ticket_flights as tf
on tf.ticket_no = t.ticket_no
group by fare_conditions, passenger_name


-- Challenge 3:
-- Which title has GEORGE LINTON rented the most often?
select first_name, Last_name, f.title, count(*)
from customer as c
inner join rental as r
on c.customer_id = r.customer_id
	and c.first_name = 'GEORGE' and c.Last_name = 'LINTON'
inner join inventory as i
on i.inventory_id = r.inventory_id
inner join film as f
on f.film_id = i.film_id
group by f.title, first_name, Last_name
order by count(*) desc