--1-What is the total sales revenue for the entire period?
select sum(total_amount) from fact_sales;

--2-What are the total sales revenues for each year?
select year(sales_date) as year, sum(total_amount) as "total sales"
from fact_sales
group by year(sales_date);

--3-What is the total sales quantity and revenue for each quarter?
select d.quarter, sum(f.total_amount) as "total sales"
from fact_sales f
join dim_dates d
    on f.date_sk = d.date_sk
group by quarter
order by quarter;

--4-What is the average sales revenue per transaction?
select avg(total_amount)
from fact_sales

--5-What is the total profit for each month, and how is it calculated?
select d.month, sum(f.total_amount) as "total sales"
from fact_sales f
join dim_dates d
    on f.date_sk = d.date_sk
group by month
order by month;
--summing total amount of each month joining dim_date with the fact_sales

--6-What are the top 10 customers by total sales revenue?
select d.customer_sk, min(concat(d.first_name, ' ', d.last_name)) as customer_name,
        sum(f.total_amount) as total_amount
from fact_sales f
join dim_customers d
    on f.CUSTOMER_SK = d.customer_sk
group by d.customer_sk
order by total_amount desc
limit 10;

--7-How many unique customers made a purchase each year?
select year(sales_date) as Year, count(distinct customer_sk) as "Number of customers"
from fact_sales
group by year(sales_date);

--8-What is the gender distribution of customers?
-- a custom REGEX gives 70-85%
select
  case
    when (lower(trim(first_name))) rlike '.*[aeioy]$|.*ey$|.*ie$|.*lyn$' then 'female'
    else 'male'
  end as gender,
  count(*) as customer_count,
  round((count(*) * 100.0 / sum(count(*)) over()), 2) as percentage
from dim_customers
group by 1
order by customer_count desc;

--9-What is the average age of customers in each city?
--10-What is the total sales revenue by customer state?
select d.RESIDENTIAL_LOCATION as state,
        sum(f.total_amount) as "total sales"
from fact_sales f
join dim_customers d
    on f.customer_sk = d.customer_sk
group by state
order by sum(f.total_amount) desc;

--11-What are the top 5 product categories by sales revenue?
select d.product_sk,
        max(d.product_name) as product_name,
        sum(f.total_amount) as total_amount
from fact_sales f
join dim_products d
    on f.product_sk = d.product_sk
group by d.product_sk
order by total_amount desc
limit 5;
