-- Apple project

SELECT * FROM category;
SELECT * FROM products;
SELECT * FROM sales;
SELECT * FROM stores;
SELECT * FROM warranty;

-- find number of stores in each country

SELECT
	country,
	COUNT(*)
FROM stores
GROUP BY 1
ORDER BY 2 DESC

-- What is the total number of units sold by each store

SELECT 
	s.store_id,
	st.store_name,
	SUM(s.quantity) as total
FROM sales as s
JOIN 
stores as st
ON st.store_id = s.store_id
GROUP BY 1,2
ORDER BY 3 DESC

-- How many sales occurred in December 2023?

SELECT 
	*,
	TO_CHAR(sale_date, 'MM-YYYY')
FROM sales
WHERE TO_CHAR(sale_date,'MM-YYYY') = '12-2023'

-- How many stores have never had a warranty claim filed against any of their products?

SELECT * FROM stores
WHERE store_id NOT IN
(
SELECT
	DISTINCT store_id
FROM sales as s
RIGHT JOIN warranty as w
ON s.sale_id = w.sale_id
)

-- What percentage of warranty claims are marked as "Warranty Void"?

SELECT 
	ROUND(COUNT(*)/(SELECT COUNT(*) FROM warranty)::numeric * 100, 2) as avg_warranty
	FROM warranty
	WHERE repair_status = 'Warranty Void'

-- Which store had the highest total units sold in the last year?

SELECT 
	s.store_id,
	st.store_name,
	SUM(quantity)
FROM sales as s
JOIN stores as st
ON s.store_id = st.store_id
WHERE sale_date >= (CURRENT_DATE - INTERVAL '2 year')
GROUP BY 1, 2
ORDER BY 3 DESC
LIMIT 1

-- Count the number of unique products sold in the last year.

SELECT COUNT(DISTINCT product_id) FROM sales
WHERE sale_date >= (CURRENT_DATE - INTERVAL '2 year')

-- What is the average price of products in each category?

SELECT 
	p.category_id,
	c.category_name,
	AVG(price) as avg_price
FROM products AS p
JOIN category as c
ON p.category_id = c.category_id

GROUP BY 1, 2
ORDER BY 3 DESC

-- How many warranty claims were filed in 2020?

select count(claim_id) from warranty
where extract(year from claim_date) = 2020

-- Identify each store and best selling day based on highest qty sold

select * from
(
select 
	store_id,
	to_char(sale_date, 'Day') as day_name,
	sum(quantity) as total_unit_sold,
	rank() over(partition by store_id order by sum(quantity) desc) as rank
from sales
group by 1,2
) as t1
where rank = 1

-- Identify least selling product of each country for each year based on total unit sold

with product_rank
as
(select 
	st.country,
	p.product_name,
	sum(s.quantity) as total,
	rank() over(partition by st.country order by sum(s.quantity)) as rank
from sales as s
join 
stores as st
on s.store_id = st.store_id
join
products as p
on s.product_id = p.product_id
group by 1,2)
	select * from product_rank
	where rank = 1

-- How many warranty claims were filed within 180 days of a product sale?

select 
	count(*)
from warranty as w
left join
sales as s
on s.sale_id = w.sale_id
where
	w.claim_date - s.sale_date <= 180



