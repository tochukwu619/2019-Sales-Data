# 2019-Sales-Data
An analysis for the key sales metric in a store

---
### TABLE OF CONTENT

1. [PROJECT OVERVIEW](#project-overview)
2. [DATA SOURCE](#data-source)
3. [TOOLS](#tools)
4. [DATA PREPARATION](#data-preparation)
5. [EXPLORATORY DATA ANALYSIS](#exploratory-data-analysis)
6. [DATA ANALYSIS](#data-analysis)
7. [RESULTS](#results)
8. [RECOMMENDATION](#recommendation)
9. [LIMITATION](#limitation)
10. [REFERENCE](#reference)

---
### PROJECT OVERVIEW

The project is on the analysis of a dataset containing the monthly sales record of a store for the year 2019. The task is to uncover trends and patterns for the 2019 sales year and also generate key sales metrics.

![2019 sales dashboard](https://github.com/tochukwu619/2019-Sales-Data/assets/125865918/53659c06-8306-4466-b77d-bc49266520f8)


### DATA SOURCE

The dataset used for this project was gotten from a Data Challenge Community. The file name is ‘Sale_2019.bak’. Each table contains order id, product, quantity ordered, unit price, order date and purchase address. Each table is for every month of the year. 

### TOOLS

-	Microsoft SQL
-	Microsoft Power BI

### DATA PREPARATION

Using Microsoft SQL, the data was cleaned by ensuring that there were no duplicates. Spelling checks were also performed on the fields for consistency. Blank-value check was done to ensure that there was no inappropriate blank cell. The order date was formatted to give a correct date for the data.

```
UPDATE Sales_January_2019
SET Order_Date = FORMAT(Order_Date, '20dd-MM-yy') FROM Sales_January_2019;
```


### EXPLORATORY DATA ANALYSIS

The KPI asked during this project was:
-	Total sales by month
-	Total sales by city
-	Bestselling products per month
-	Quantity of orders per month
-	Correlation between quantity of products ordered and unit price
-	Proportion of products sold by city
-	Relationship between monthly sales and quantity ordered



### DATA ANALYSIS

Using Microsoft Power BI, a dashboard was developed to provide a visual insight on the key sales metrics. Measures were created for:
Total amount per order
```
Total Amount = Table_name[Quantity_Ordered] * Table_name[Price_Each]
```

Total sales per month
```
Total Sales = SUM(Table_name[Total Amount]) 
```

Total quantity of products ordered per month
```
Total Quantity Ordered = SUM(Table_name[Quantity_Ordered])
```

 Total orders placed per month
```
Total order = COUNT(Table_name[Order_id])
```

Overall sales for the year
```
Overall Sales = Table_name[April Sales] + Table_name[August Sales] + Table_name[December Sales] + Table_name[February Sales] + Table_name[January Sales] + Table_name[July Sales] + Table_name[June Sales] + Table_name[March Sales] + Table_name[May Sales] + Table_name[November Sales] + Table_name[October Sales] + Table_name[September Sales]
```

Overall quantity of products for the year
```
Overall Quantity ordered = Table_name[April Quantity Ordered] + Table_name[August Quantity Ordered] + Table_name[December Quantity Ordered] + Table_name[February Quantity Ordered] + Table_name[January Quantity Ordered] + Table_name[July Quantity Ordered] + Table_name[June Quantity Ordered] + Table_name[March Quantity ordered] + Table_name[May Quantity Ordered] + Table_name[November Quantity Ordered] + Table_name[October Quantity Ordered] + Table_name[September Quantity Ordered]
```

Overall number of orders for the year
```
Overall Number of Orders = COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) + COUNT(Table_name[Order_ID]) 
```


### RESULTS

It was observed that:
-	It was observed that the least revenue was in January (#1,815,335) and the most revenue was in December (#4,619,297).
-	It was observed that the top 3 revenue are: San Francisco (#8,262,203), Los Angeles (#5,452,570), New York city (#4,664,317) while the bottom 3 are: Seattle (#2,747,755), Portland (#2,320,490), Austin (#1,819,581).
-	The best-selling products, in order, in 2019 are: USB-C charging cable, lightning charging cable, AA batteries (4-pack), AAA batteries (4-pack), wired headphones, apple air pods headphones.
-	The top 3 quantity ordered was recorded in: December, October, April.
-	There is a correlation between the quantity ordered and unit price. Products with the lowest unit price have the highest quantity ordered with the exception of Apple air pods headphones.



### RECOMMENDATION

More products with a low unit price should be stocked in the store for frequent sales.

### LIMITATION

Information about the customer was not given. This could give information on why such trend is observed in the store.

### REFERENCE

[YouTube](www.youtube.com)

