-- TREND FOR 2019 SALES

-- DATA CLEANING
-- REMOVING NULL VALUES

SELECT [Order_ID]
      ,[Product]
      ,[Quantity_Ordered]
      ,[Price_Each]
      ,[Order_Date]
      ,[Purchase_Address]
  FROM [Sale_2019].[dbo].[Sales_January_2019]
  WHERE Order_ID IS NULL;

DELETE FROM Sales_January_2019
WHERE order_id IS NULL;


SELECT *
FROM Sales_February_2019
WHERE Order_ID IS NULL AND Product IS NULL;
-- SOME SALES HAPPENED IN FEBRUARY 2019 WITH MISSING ORDER ID

DELETE FROM Sales_February_2019
WHERE Order_ID IS NULL AND Product IS NULL;

DELETE FROM Sales_February_2019
WHERE Product = 'Product'; -- THERE ARE NO VALUES FOR WHERE PRODUCT = PRODUCT



SELECT *
FROM Sales_March_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_March_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_April_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_April_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_May_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_May_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_June_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_June_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_July_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_July_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_August_2019
WHERE Order_ID IS NULL;

DELETE FROM Sales_August_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_September_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_September_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_October_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_October_2019
WHERE order_id IS NULL;



SELECT *
FROM Sales_November_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_November_2019
WHERE Order_ID IS NULL;



SELECT *
FROM Sales_December_2019
WHERE Order_ID IS NULL; 

DELETE FROM Sales_December_2019
WHERE Order_ID IS NULL;



-- FORMATTING THE ORDER DATE

SELECT *
FROM Sales_January_2019;

UPDATE Sales_January_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_January_2019;



SELECT *
FROM Sales_February_2019;

UPDATE Sales_February_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_February_2019;



SELECT *
FROM Sales_March_2019;

UPDATE Sales_March_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_March_2019;



SELECT *
FROM Sales_April_2019;

UPDATE Sales_April_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_April_2019;



SELECT * 
FROM Sales_May_2019;

UPDATE Sales_May_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_May_2019;



SELECT *
FROM Sales_June_2019;

UPDATE Sales_June_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_June_2019;



SELECT *
FROM Sales_July_2019;

UPDATE Sales_July_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_July_2019;



SELECT *
FROM Sales_August_2019;

UPDATE Sales_August_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_August_2019;



SELECT *
FROM Sales_September_2019;

UPDATE Sales_September_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_September_2019;



SELECT *
FROM Sales_October_2019;

UPDATE Sales_October_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_October_2019;



SELECT *
FROM Sales_November_2019;

UPDATE Sales_November_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_November_2019;



SELECT * 
FROM Sales_December_2019;

UPDATE Sales_December_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_December_2019;



-- ANALYZING TOTAL SALES BY MONTHS

SELECT 'January' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_January_2019) AS Total

UNION ALL

SELECT 'February' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_February_2019) AS Total

UNION ALL

SELECT 'March' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_March_2019) AS Total

UNION ALL

SELECT 'April' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_April_2019) AS Total

UNION ALL

SELECT 'May' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_May_2019) AS Total

UNION ALL

SELECT 'June' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_June_2019) AS Total

UNION ALL

SELECT 'July' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_July_2019) AS Total

UNION ALL

SELECT 'August' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_August_2019) AS Total

UNION ALL

SELECT 'September' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_September_2019) AS Total

UNION ALL

SELECT 'October' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_October_2019) AS Total

UNION ALL

SELECT 'November' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_November_2019) AS Total

UNION ALL

SELECT 'December' AS Month,
		SUM(Total_Price) AS Total_Sales
FROM (SELECT (Quantity_ordered * Price_Each) AS Total_Price
		FROM Sales_December_2019) AS Total;

-- IT WAS OBSERVED THAT THE LEAST REVENUE WAS IN:
-- JANUARY (#1,815,335) AND THE MOST REVENUE WAS IN
-- DECEMBER (#4,619,297)




-- ANALYZING TOTAL REVENUE BY CITY


WITH January AS(
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_January_2019) AS Sales
	GROUP BY City
),
February AS ( 
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_February_2019) AS Sales
	GROUP BY City
),
March AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_March_2019) AS Sales
	GROUP BY City
),
April AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_April_2019) AS Sales
	GROUP BY City
),
May AS ( 
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_May_2019) AS Sales
	GROUP BY City
),
June AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_June_2019) AS Sales
	GROUP BY City
),
July AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_July_2019) AS Sales
	GROUP BY City
),
August AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_August_2019) AS Sales
	GROUP BY City
),
September AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_September_2019) AS Sales
	GROUP BY City
),
October AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_October_2019) AS Sales
	GROUP BY City
),
November AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_November_2019) AS Sales
	GROUP BY City
),
December AS (
	SELECT City, SUM(Total_price) AS Revenue
	FROM (SELECT PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
		   (Quantity_Ordered * Price_Each) AS Total_price
	FROM Sales_December_2019) AS Sales
	GROUP BY City
)

SELECT January.City,
	   (January.Revenue + February.Revenue + March.Revenue + April.Revenue + May.Revenue + June.Revenue + July.Revenue + 
	   August.Revenue + September.Revenue + October.Revenue + November.Revenue + December.Revenue) AS Total_Revenue
FROM January
JOIN February ON January.City = February.City
JOIN March ON January.City = March.City
JOIN April ON April.City = January.City
JOIN May ON January.City = May.City
JOIN June ON January.City = June.City
JOIN July ON July.City = January.City
JOIN August ON January.City = August.City
JOIN September ON January.City = September.City
JOIN October ON January.City = October.City
JOIN November ON January.City = November.City
JOIN December ON January.City = December.City;

-- IT WAS OBSERVED THAT THE TOP 3 REVENUE ARE:
-- SAN FRANCISCO (#8,262,203)
-- LOS ANGELES (#5,452,570)
-- NEW YORK CITY (#4,664,317)

-- WHILE THE BOTTOM 3 ARE:
-- SEATTLE (#2,747,755)
-- PORTLAND (#2,320,490)
-- AUSTIN (#1,819,581)



-- BEST SELLING PRODUCT PER MONTH


WITH January AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS January_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_January_2019) AS Sale_per_product
	GROUP BY Product
),
February AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS February_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_February_2019) AS Sale_per_product
	GROUP BY Product
),
March AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS March_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_March_2019) AS Sale_per_product
	GROUP BY Product
),
April AS(
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS April_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_April_2019) AS Sale_per_product
	GROUP BY Product
),
May AS(
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS May_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_May_2019) AS Sale_per_product
	GROUP BY Product
),
June AS(
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS June_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_June_2019) AS Sale_per_product
	GROUP BY Product
),
July AS(
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS July_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_July_2019) AS Sale_per_product
	GROUP BY Product
),
August AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS August_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_August_2019) AS Sale_per_product
	GROUP BY Product
),
September AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS September_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_September_2019) AS Sale_per_product
	GROUP BY Product
),
October AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS October_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_October_2019) AS Sale_per_product
	GROUP BY Product
),
November AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS November_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_November_2019) AS Sale_per_product
	GROUP BY Product
),
December AS (
	SELECT Product, COUNT(*) AS No_of_sales, SUM(Total_amount) AS December_sales
	FROM (SELECT product,
				(quantity_ordered * price_each) AS Total_amount
			FROM Sales_December_2019) AS Sale_per_product
	GROUP BY Product
)

SELECT January.Product,
		January.No_of_sales,
		January.January_sales,
		February.No_of_sales,
		February.February_sales,
		March.No_of_sales,
		March.March_sales,
		April.No_of_sales,
		April.April_sales,
		May.No_of_sales,
		May.May_sales,
		June.No_of_sales,
		June.June_sales,
		July.No_of_sales,
		July.July_sales,
		August.No_of_sales,
		August.August_sales,
		September.No_of_sales,
		September.September_sales,
		October.No_of_sales,
		October.October_sales,
		November.No_of_sales,
		November.November_sales,
		December.No_of_sales,
		December.December_sales
FROM January
INNER JOIN February ON January.Product = February.Product
INNER JOIN March ON January.Product = March.Product
INNER JOIN April ON January.Product = April.Product
INNER JOIN May ON January.Product = May.Product
INNER JOIN June ON January.Product = June.Product
INNER JOIN July ON July.Product = January.Product
INNER JOIN August ON January.Product = August.Product
INNER JOIN September ON September.Product = January.Product
INNER JOIN October ON January.Product = October.Product
INNER JOIN November ON January.Product = November.Product
INNER JOIN December ON January.Product = December.Product;


-- THE BEST SELLING PRODUCTS, IN ORDER, IN 2019 ARE:
-- USB-C CHARGING CABLE
-- LIGHTNING CHARGING CABLE
-- AA BATTERIES (4-PACK)
-- AAA BATTERIES (4-PACK)
-- WIRED HEADPHONES
-- APPLE AIRPODS HEADPHONES



-- QUANTITY OF ORDERS PER MONTH


SELECT 'January' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_January_2019

UNION

SELECT 'February' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_February_2019

UNION

SELECT 'March' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_March_2019

UNION

SELECT 'April' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_April_2019

UNION

SELECT 'May' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_May_2019

UNION

SELECT 'June' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_June_2019

UNION

SELECT 'July' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_July_2019

UNION

SELECT 'August' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_August_2019

UNION

SELECT 'September' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_September_2019

UNION

SELECT 'October' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_October_2019

UNION

SELECT 'November' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_November_2019

UNION

SELECT 'December' AS Month, SUM(quantity_ordered) AS Quantity
FROM Sales_December_2019


--THE TOP 3 QUANTITY ORDERED WAS RECORDED IN:
-- DECEMBER
-- OCTOBER
-- APRIL



--THE CORRELATION BETWEEN QUANTITY OF ORDERED PRODUCT AND UNIT PRICE



WITH January AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_January_2019
	GROUP BY Product, Price_Each
),
February AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_February_2019
	GROUP BY Product, Price_Each
),
March AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_March_2019
	GROUP BY Product, Price_Each
),
April AS(
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_April_2019
	GROUP BY Product, Price_Each
),
May AS(
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_May_2019
	GROUP BY Product, Price_Each
),
June AS(
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_June_2019
	GROUP BY Product, Price_Each
),
July AS(
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_July_2019
	GROUP BY Product, Price_Each
),
August AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_August_2019
	GROUP BY Product, Price_Each
),
September AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_September_2019
	GROUP BY Product, Price_Each
),
October AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_October_2019
	GROUP BY Product, Price_Each
),
November AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_November_2019
	GROUP BY Product, Price_Each
),
December AS (
	SELECT Product, SUM(Quantity_Ordered) AS Quantity_ordered, Price_Each
	FROM Sales_December_2019
	GROUP BY Product, Price_Each
)

SELECT January.Product,
		January.Quantity_ordered,
		January.Price_each,
		February.Quantity_ordered,
		February.Price_each,
		March.Quantity_ordered,
		March.Price_each,
		April.Quantity_ordered,
		April.Price_each,
		May.Quantity_ordered,
		May.Price_each,
		June.Quantity_ordered,
		June.Price_each,
		July.Quantity_ordered,
		July.Price_each,
		August.Quantity_ordered,
		August.Price_each,
		September.Quantity_ordered,
		September.Price_each,
		October.Quantity_ordered,
		October.Price_each,
		November.Quantity_ordered,
		November.Price_each,
		December.Quantity_ordered,
		December.Price_each
FROM January
INNER JOIN February ON January.Product = February.Product
INNER JOIN March ON January.Product = March.Product
INNER JOIN April ON January.Product = April.Product
INNER JOIN May ON January.Product = May.Product
INNER JOIN June ON January.Product = June.Product
INNER JOIN July ON July.Product = January.Product
INNER JOIN August ON January.Product = August.Product
INNER JOIN September ON September.Product = January.Product
INNER JOIN October ON January.Product = October.Product
INNER JOIN November ON January.Product = November.Product
INNER JOIN December ON January.Product = December.Product;


-- THERE IS A CORRELATION BETWEEN THE QUANTITY ORDERED AND UNIT PRICE
-- PRODUCTS WITH THE LOWEST UNIT PRICE HAVE THE HIGHEST QUANTITY ORDERED
-- WITH THE EXCEPTION OF APPLE AIRPODS HEADPHONES




-- PROPORTION OF PRODUCTS SOLD BY CITY



-- FOR JANUARY
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_January_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;


--FOR FEBRUARY
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_February_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR MARCH
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_March_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR APRIL
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_April_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR MAY
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_May_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR JUNE
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_June_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR JULY
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_July_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR AUGUST
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_August_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR SEPTEMBER
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_September_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR OCTOBER
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_October_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR NOVEMBER
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_November_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;



-- FOR DECEMBER
SELECT
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2) AS City,
    product,
    SUM(quantity_ordered) AS total_quantity,
    SUM(quantity_ordered) * 100.0 / SUM(SUM(quantity_ordered)) OVER (PARTITION BY PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2)) AS proportion_percentage
FROM
    Sales_December_2019
GROUP BY
    PARSENAME(REPLACE(Purchase_Address, ',', '.'), 2), product;




-- RELATIONSHIP BETWEEN QUANTITY ORDERED VS MONTHLY INCOME



SELECT 'January' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_January_2019

UNION

SELECT 'February' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_February_2019

UNION

SELECT 'March' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_March_2019

UNION

SELECT 'April' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_April_2019

UNION

SELECT 'May' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_May_2019

UNION

SELECT 'June' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_June_2019

UNION

SELECT 'July' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_July_2019

UNION

SELECT 'August' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_August_2019

UNION

SELECT 'September' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_September_2019

UNION

SELECT 'October' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_October_2019

UNION

SELECT 'November' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_November_2019

UNION

SELECT 'December' AS Month, SUM(Quantity_Ordered) AS Quantity_ordered, SUM(Quantity_Ordered * Price_Each) AS Monthly_income
FROM Sales_December_2019



-- AOV(AVERAGE ORDER VALUE) AVERAGE REVENUE GENERATED BY ORDER


SELECT 'January' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_January_2019
) AS Amount

UNION

SELECT 'February' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_February_2019
) AS Amount

UNION

SELECT 'March' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_March_2019
) AS Amount

UNION

SELECT 'April' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_April_2019
) AS Amount

UNION

SELECT 'May' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_May_2019
) AS Amount

UNION

SELECT 'June' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_June_2019
) AS Amount

UNION

SELECT 'July' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_July_2019
) AS Amount

UNION

SELECT 'August' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_August_2019
) AS Amount

UNION

SELECT 'September' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_September_2019
) AS Amount

UNION 

SELECT 'October' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_October_2019
) AS Amount

UNION

SELECT 'November' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_November_2019
) AS Amount

UNION

SELECT 'December' AS Month, AVG(Total_amount) AS AOV
FROM (
		SELECT (quantity_ordered * price_each) AS Total_amount
		FROM Sales_December_2019
) AS Amount


-- THE TOP 4 AOV WAS OBSERVED IN:
-- JUNE (190.20)
-- MAY (189.96)
-- AUGUST (187.71)
-- JANUARY (187.52)

-- THE BOTTOM 3 WAS OBSERVED IN:
-- FEBRUARY (183.84)
-- NOVEMBER (181.96)
-- SEPTEMBER (180.48)
