#1--Find the maximum Qty sold in the transactions

select max(Quantity),count(*) as totaltransactions from tr_orderdetails

#2--Find the unique products in all the transactions

select distinct(ProductId),Quantity from tr_orderdetails
where Quantity=3
order by ProductID asc, Quantity desc

#3--find the unique propertyID
SELECT Distinct(PropertyID) FROM tr_orderdetails

#4--Find the product category that has maximum products

SELECT COUNT(ProductName) AS Totalproducts,ProductCategory FROM superstoresale.tr_products
GROUP BY ProductCategory
order by Totalproducts desc

#5--Find the PropertyState which has more stores present

SELECT PropertyState,COUNT(PropertyState) AS TotalStates FROM superstoresale.tr_propertyinfo
GROUP BY PropertyState
order by TotalStates desc

#6--Find the Top 5 ProductIDS that did the maximum sales in terms of Quantity

select ProductID,sum(Quantity) as TotalQTY from tr_orderdetails
group by ProductID
order by 2 desc
limit 5

#6--Find the Top 5 Propertstates that did the maximum sales 

select PropertyID,sum(Quantity) as TotalQTY from tr_orderdetails
group by PropertyID
order by 2 desc
limit 5

#7 Find the top 5 product names that did maximum sales in terms of quantity

select o.*,p.ProductName,p.ProductCategory,p.Price from tr_orderdetails as o left join tr_products as p
 on o.ProductID=p.ProductID
 
select p.ProductName,SUM(o.Quantity) AS TotalQTY from tr_orderdetails as o left join tr_products as p
 on o.ProductID=p.ProductID
 GROUP BY p.ProductName
 order by 2
 #8 Find the top 5 product names that did maximum sales in terms of sales
 
select p.ProductName,sum(p.Price *o.Quantity) AS TotalSales from tr_orderdetails as o left join tr_products as p
 on o.ProductID=p.ProductID
 GROUP BY p.ProductName
 order by TotalSales desc
 limit 5
 
 #9 Top 5 Cities that did maximum sale
 
 select pi.PropertyCity, sum(p.Price *o.Quantity) AS TotalSales from tr_orderdetails as o left join tr_products as p
 on o.ProductID=p.ProductID left join tr_propertyinfo as pi on o.PropertyID=pi.`Prop ID`
 GROUP BY pi.PropertyCity
 order by TotalSales desc
 limit 5
 
 #10 Total number of sale in Arlington
 
 select pi.PropertyCity,p.ProductName,sum(p.Price *o.Quantity) AS TotalSales from tr_orderdetails as o left join tr_products as p
 on o.ProductID=p.ProductID left join tr_propertyinfo as pi on o.PropertyID=pi.`Prop ID`
 where pi.PropertyCity = 'Arlington'
 GROUP BY pi.PropertyCity,p.ProductName
order by  TotalSales desc
 


