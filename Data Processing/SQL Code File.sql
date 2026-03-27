--- Exploring the table---
SELECT *
 from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`
 limit 10;

 -----1 Date range (the started collecting data 2023-01-01)
 SELECT MIN(transaction_date) AS min_date
 from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;

---Duration of the data is 6 months, they last collected data 2023-06-30

SELECT MAX(transaction_date) AS latest_date
 from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


-----2.Different store names 
SELECT DISTINCT (store_location)
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


SELECT COUNT (Distinct store_id) AS number_of_stores
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


-----3. Products sold at stores 

SELECT DISTINCT (product_category)
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


SELECT DISTINCT (product_detail)
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


SELECT DISTINCT (product_type)
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


SELECT DISTINCT (product_category) AS Category,
 product_detail AS product_name
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


------4.Product Prices 
SELECT MIN(unit_price) AS Cheapest_price
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


SELECT MAX(unit_price) AS Expensive_price
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


-----5. Counts rows,sales,products and stores
SELECT COUNT(*) AS number_of_rows,
COUNT(DISTINCT transaction_id) AS number_of_sales,
COUNT(DISTINCT product_id) AS number_of_products,
COUNT(DISTINCT store_id) AS number_of_stores
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


-----6. Shows transaction detials including revenue per transaction
SELECT transaction_id,
transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
transaction_qty*unit_price AS revenue_per_tnx
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`;


----7 Summarizes sales and revenue by day
SELECT transaction_date,
Dayname(transaction_date) AS Day_name,
Monthname(transaction_date) AS Month_name,
COUNT(DISTINCT transaction_id) AS Number_of_sales,
SUM(transaction_qty*unit_price) AS revenue_per_day
from `workspace`.`default`.`1771947879858_bright_coffee_shop_sales`
GROUP BY transaction_date,Day_name,Month_name;
