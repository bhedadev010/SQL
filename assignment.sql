use tops;

-- List all Countries and customers related to these countries.
-- For each country displaying its name in English, the name of the city customer is located in as
-- well as the name of the customer. 
--  Return even countries without related cities and customers.

select * from city;

select * from country co
left join city ci on ci.country_id = co.country_id;


-- Return the list of all countries that have pairs(exclude countries which are not referenced by any
-- city). For such pairs return all customers.
-- Return even pairs of not having a single customer

select co.country_name, ci.city_name, c.customer_name from city ci
left join country co on ci.country_id = co.country_id
left join customer1 c on c.city_id = ci.city_id;