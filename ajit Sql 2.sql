/*Northwind Database Exercises */

/* 1 Write a query to get Product name and quantity/unit */

select ProductName as 'Product name', QuantityPerUnit as 'Quantity/unit' from northwind.products;


/* 2 Write a query to get current Product list (Product ID and name) */

select concat(ProductID, ' : ', ProductName) as 'Current Product List' from northwind.products
where Discontinued = 0 order by ProductName;

/* 3 Write a query to get discontinued Product list (Product ID and name) */

select concat(ProductID, ' : ', ProductName) as ' Discontinued Product List' from northwind.products
where Discontinued = 1 order by ProductName;

/* 4 Write a query to get most expense and least expensive Product list (name and unit price) */

select ProductName as 'Product Name', round(UnitPrice,2) as 'Expenses' from northwind.products
order by UnitPrice desc;

/* 5 Write a query to get Product list (id, name, unit price) where current products cost less than $20 */

select ProductID, ProductName, round(UnitPrice,2) as 'Price'  from northwind.products
where Discontinued = 0 and UnitPrice <20 order by UnitPrice desc;

/* 6 Write a query to get Product list (id, name, unit price) where products cost between $15 and $25 */

select ProductID, ProductName, round(UnitPrice,2) as 'Price'  from northwind.products
where UnitPrice between 15 and 25 and Discontinued = 0 order by UnitPrice desc;


/* 7 Write a query to get Product list (name, unit price) of above average price */

select  distinct(ProductName) as 'Product Name', round(UnitPrice,2) as 'Unit Price' from northwind.products
where UnitPrice >
(select avg(UnitPrice) from northwind.products)
order by UnitPrice;


/* 8 Write a query to get Product list (name, unit price) of ten most expensive products */

select  distinct(ProductName) as 'Ten most expensive products', round(UnitPrice,2) as 'Unit Price' 
from northwind.products order by UnitPrice desc limit 10;

/*9 Write a query to count current and discontinued products */

select  count(ProductName) as "Product", Discontinued from northwind.products group by Discontinued;

/* 10 Write a query to get Product list (name, units on order , units in stock)
 of stock is less than the quantity on order */

select ProductName as 'Product Name', UnitsOnOrder, UnitsInStock  from northwind.products
where discontinued = 0 and UnitsInStock < UnitsOnOrder;