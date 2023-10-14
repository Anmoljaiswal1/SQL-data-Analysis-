SELECT * FROM sales.sales;

/* What is the total sales amount for all products in the dataset? */ 
use sales;

select sum(sales_amount) as total_sold_amount from sales;

/* Which product category has the highest average unit price */ 

select category, avg(unit_price) as average_price from sales 
group by category 
order by avg(unit_price) desc 
limit 1;

/* What is the most common payment method used by customers */ 

select payment_method from (select payment_method, count(*) from sales 
group by Payment_Method 
order by count(*) desc ) e 
limit 1 ;

/* Who is the top customer in terms of total spending */ 

select customer_name,  sum(sales_amount) as total_spending from sales 
group by Customer_Name 
order by sum(Sales_Amount) desc
limit 1 ;

/* What is the total quantity of products sold for each category */ 

select category, sum(quantity) as total_sold from sales 
group by category;

/* Which product has the highest individual sales amount */ 

select product, max(sales_amount) as highest_sales_amount from sales 
group by product
 limit 1;
 
 
 /* What is the average sales amount for products in the "Electronics" category */ 
 
 select round(avg(case
 when category = 'electronics' then Sales_Amount end), 2) as avg_amount_of_elec from sales;
 
 /* How many unique customers are there in the dataset */ 
 
 select distinct count(*) as unique_no_customer from sales;


/* What is the total sales amount for each year in the dataset */ 

select year(Date) as year, sum(sales_amount) as total_sold_amount_by_year from sales 
group by year(date) 
order by sum(sales_amount) desc;

select date from sales 
where year(date) = 23;

/* Calculate the total sales amount for each payment method */ 

select payment_method,  sum(sales_amount) as total_sold_amount_method from sales 
group by Payment_Method
order by sum(sales_amount) desc
limit 2 offset 1;


/* question no 1 */  

select product, count(*) as no_of_sold_product from sales 
group by product ;


/* question no 2 */ 

select sum(case 
when category = 'electronics' then sales_amount end) as eletronic_total_sold_amount from sales ;

/* question no 3 */

select customer_name,  max(sales_amount) from sales 
group by customer_name  
limit 1 ;

/* question no 4 */ 

select product, max(unit_price) as higest_price from sales 
group by product 
limit 5;


/* question no 5 */ 
select sum(
case when payment_method = 'apple pay' then sales_amount end) totla_cash_collected_from_apple_pay from sales;


/* question no 6 */ 
select avg(quantity) as avg_quantity from sales;

/* question no 7 */ 
select product from (select product, avg(unit_price) from sales 
group by product 
order by avg(unit_price) ) e 
limit 1 ;

/* QUESTION NO 8 */ 
SELECT CUSTOMER_NAME, DATE FROM SALES 
ORDER BY DATE
LIMIT 1 ;

SELECT CUSTOMER_NAME,  DATE, row_number() OVER (ORDER BY DATE ) AS FIRST_PURCHASE 
FROM SALES
LIMIT 1;


/* QUESTION NO 9 */ 

SELECT PAYMENT_METHOD,  SUM(SALES_AMOUNT) FROM SALES 
GROUP BY PAYMENT_METHOD ;

/* QUESTION  NO 10 */ 

SELECT CATEGORY, SUM(SALES_AMOUNT)  FROM SALES 
WHERE DATE LIKE '%2022%' 
AND CATEGORY = 'FASHION'
GROUP BY CATEGORY 


