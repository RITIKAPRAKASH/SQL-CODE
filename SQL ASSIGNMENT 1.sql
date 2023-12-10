

------------------SQL Assignment no 1-------------------------
CREATE DATABASE BRANDS
USE BRANDS
CREATE TABLE ITEMS_TABLE(
ITEM_ID INT PRIMARY KEY,
ITEM_DESCRIPTION VARCHAR(50),
VENDOR_NOS INT,
VENDOR_NAME VARCHAR(100),
BOTTLE_SIZE INT,
BOTTLE_PRICE MONEY
)
---------------------------------------------------------------------------------------
SELECT * FROM ITEMS_TABLE

INSERT INTO ITEMS_TABLE VALUES(1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,$9.77)
INSERT INTO ITEMS_TABLE VALUES(2,'Daristi Xtabentun',391,'Anchor Distilling(preiss Import)',750,$14.12)
INSERT INTO ITEMS_TABLE VALUES(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,$6.50)
INSERT INTO ITEMS_TABLE VALUES(4,'Oak Cross Whisky',305,'Mhw Ltd',750,$25.33)
INSERT INTO ITEMS_TABLE VALUES(5,'Uv Red(cherry)Vodka',380,'Phillips Beverage Company',200,$1.97)
INSERT INTO ITEMS_TABLE VALUES(6,'Heaven Hill Old Style White Lable',259,'Heaven Hill Distilleries Inc.',750,$6.37)
INSERT INTO ITEMS_TABLE VALUES(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06)
INSERT INTO ITEMS_TABLE VALUES(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61)

--------------------------------------------------------------------------------------------------------
CREATE DATABASE PRODUCTS
USE PRODUCTS

CREATE TABLE PRODUCT_TABLE(
Product_Id INT PRIMARY KEY,
Country varchar(50),
Product varchar(50),
Units_Sold INT,
Manufacturing_Price money,
Sale_Price money,
Gross_Sales money,
Sales money,
COGS money,
Profit money,
Date date,
Month_Number INT,
Month_Name Varchar(50),
Year int
)

SELECT * FROM PRODUCT_Table
-------------------------------------------------
insert into PRODUCT_TABLE values(1,'Canada','Carretera', 1618.5,$3.00,$20.00,$32370.00,$32370.00,$16185.00,$16185.00,'01-01-2014',1,'January',2014)
insert into PRODUCT_TABLE values
(2,'Germany','Carretera',1321,$3.00, $20.00, $26420.00, $26420.00, $13210.00,$13210.00,'01-01-2014',1,	'January',2015),
(3,'France','Carretera',2178,$3.00, $15.00, $32670.00,$32670.00, $21780.00,$10890.00,'01-06-2014',6,'June',2016),
(4,'Germany','Carretera',888,$3.00,$15.00,$13320.00,$13320.00, $8880.00,$4440.00,'01-06-2014',6,'June',2017),
(5,'Mexico','Carretera',2470,$3.00,$15.00,$37050.00,$37050.00,$24700.00,$12350.00,'01-06-2014',6,'June',2018),
(6,'Germany','Carretera',1513,$3.00,$350.00,$529550.00,$529550.00,$393380.00,$136170.00,'01-12-2014',12,'December', 2019),
(7,'Germany','Montana',921,$5.00,$15.00,$13815.00,$13815.00,$9210.00,$4605.00,'01-03-2014',3,'March',2020),
(8,'Canada','Montana',2518,$5.00,$12.00,$30216.00,$30216.00,$7554.00,$22662.00,'01-06-2014',6,'June',2021);

--------------------------------------------------------------------------------------------------------------------
------------Delete those product who having unit sold (1618.5,888,2470)------------------
Delete from PRODUCT_TABLE where Units_Sold in (1618.5,888,2470)

-----------------Drop Table and create again--------------------
drop table PRODUCT_TABLE

CREATE TABLE PRODUCT_TABLE(
Product_Id INT PRIMARY KEY,
Country varchar(50),
Product varchar(50),
Units_Sold  float,
Manufacturing_Price money,
Sale_Price money,
Gross_Sales money,
Sales money,
COGS money,
Profit money,
Date date,
Month_Number INT,
Month_Name Varchar(50),
Year INT
);

insert into PRODUCT_TABLE values(1,'Canada','Carretera', 1618.5,$3.00,$20.00,$32370.00,$32370.00,$16185.00,$16185.00,'01-01-2014',1,'January',2014)
insert into PRODUCT_TABLE values
(2,'Germany','Carretera',1321,$3.00, $20.00, $26420.00, $26420.00, $13210.00,$13210.00,'01-01-2014',1,	'January',2015),
(3,'France','Carretera',2178,$3.00, $15.00, $32670.00,$32670.00, $21780.00,$10890.00,'01-06-2014',6,'June',2016),
(4,'Germany','Carretera',888,$3.00,$15.00,$13320.00,$13320.00, $8880.00,$4440.00,'01-06-2014',6,'June',2017),
(5,'Mexico','Carretera',2470,$3.00,$15.00,$37050.00,$37050.00,$24700.00,$12350.00,'01-06-2014',6,'June',2018),
(6,'Germany','Carretera',1513,$3.00,$350.00,$529550.00,$529550.00,$393380.00,$136170.00,'01-12-2014',12,'December', 2019),
(7,'Germany','Montana',921,$5.00,$15.00,$13815.00,$13815.00,$9210.00,$4605.00,'01-03-2014',3,'March',2020),
(8,'Canada','Montana',2518,$5.00,$12.00,$30216.00,$30216.00,$7554.00,$22662.00,'01-06-2014',6,'June',2021);

Select * from PRODUCT_TABLE;

---------------------Find the total sales price and gross sales -------------------------------
select sum(Sale_Price) as "Total_sale_price"
from PRODUCT_TABLE;

select sum(Gross_Sales) as "Total_gross_sales"
from PRODUCT_TABLE;

---------------------------------------------------------------------------------

----------- In which year we have got the highest sales------------------
select sales,year from PRODUCT_TABLE
where sales = (select max(sales) from PRODUCT_TABLE);

-----------------------------------------------------------------------
---------------------which product having the sales of $37,050.00------------------
select Product_id,sales from PRODUCT_TABLE
where sales=$37050.00;
----------------------------------------------------
---------------------which countries lies between profit of $4,605 to $22,662.00-------------------
select Country,Profit from PRODUCT_TABLE
where Profit between 4605.00 and 22662.00
----------------------------------------------------------------------------
--------------------which product_id having the sales of $24,700.00------------------
select Product_id,COGS from PRODUCT_TABLE
where COGS=24700;
------------------------------------------------------------------------
-------------------------Small table---------------
select * from ITEMS_TABLE;
--------------------Find the item_description having the bottle size of 750----------------
select item_description,bottle_size from ITEMS_TABLE
where BOTTLE_SIZE=750;
-------------------------------------------------------------------
-------------------find the vendor name having the vendor nos 305,380,391----------------
select vendor_nos,vendor_name from ITEMS_TABLE
where VENDOR_NOS in (305,380,391);
-------------------------------------------------------------------------
-------------------what is total Bottle_price----------------
select sum(Bottle_price) as "Total_Bottle_price"
from ITEMS_TABLE;
-------------------------------------------------------------
-------------------make primary key to item_id-----------------
alter table items_table
add primary key(item_id);
---------------------------------------------------------------
--------------------which item_id having the bottle_price of 5.06-------------
select item_id,bottle_price from ITEMS_TABLE
where BOTTLE_PRICE=5.06;
----------------------------------------------------------------------

------------------------Advance Queastions-----------------------
-------------Apply INNER  , FULL OUTER , LEFT JOIN types on both the table ---------
drop table ITEMS_TABLE1
use PRODUCTS
CREATE TABLE ITEMS_TABLE1(
ITEM_ID INT,
ITEM_DESCRIPTION VARCHAR(50),
VENDOR_NOS INT,
VENDOR_NAME VARCHAR(100),
BOTTLE_SIZE INT,
BOTTLE_PRICE MONEY,
Product_id INT primary key
)
select * from ITEMS_TABLE1

INSERT INTO ITEMS_TABLE1 VALUES(1,'Travis Hasse Apple Pie',305,'Mhw Ltd',750,$9.77,1)
INSERT INTO ITEMS_TABLE1 VALUES(2,'Daristi Xtabentun',391,'Anchor Distilling(preiss Import)',750,$14.12,2)
INSERT INTO ITEMS_TABLE1 VALUES(3,'Hiram Walker Peach Brandy',370,'Pernod Ricard Usa/austin Nichols',1000,$6.50,3)
INSERT INTO ITEMS_TABLE1 VALUES(4,'Oak Cross Whisky',305,'Mhw Ltd',750,$25.33,4)
INSERT INTO ITEMS_TABLE1 VALUES(5,'Uv Red(cherry)Vodka',380,'Phillips Beverage Company',200,$1.97,12)
INSERT INTO ITEMS_TABLE1 VALUES(6,'Heaven Hill Old Style White Lable',259,'Heaven Hill Distilleries Inc.',750,$6.37,66)
INSERT INTO ITEMS_TABLE1 VALUES(7,'Hyde Herbal Liqueur',194,'Fire Tail Brands Llc',750,$5.06,13)
INSERT INTO ITEMS_TABLE1 VALUES(8,'Dupont Calvados Fine Reserve',403,'Robert Kacher Selections',750,$23.61,56)
---------------------------------------------------------------------------------------------------------
--inner join----
select * from ITEMS_TABLE1
join
PRODUCT_TABLE
on
ITEMS_TABLE1.Product_id=PRODUCT_TABLE.Product_Id
-------------------------------------------------------
---Full outer join---
select * from ITEMS_TABLE1
Full outer join
PRODUCT_TABLE
on
ITEMS_TABLE1.Product_id=PRODUCT_TABLE.Product_Id
---------------------------------------------------------
-----------left join----------
select * from ITEMS_TABLE1
left join
PRODUCT_TABLE
on
ITEMS_TABLE1.Product_id=PRODUCT_TABLE.Product_Id
-----------------------------------------------------------
--------------Apply outer ,right join,cross join types on both the table----------
---right join--
select * from ITEMS_TABLE1
right join
PRODUCT_TABLE
on
ITEMS_TABLE1.Product_id=PRODUCT_TABLE.Product_Id
-------------------------------------------------------
-----cross join---
select ITEM_ID from ITEMS_TABLE1
cross join PRODUCT_TABLE
---------------------------------------------------------
-----------------Find the item_description and Product having the gross sales of 13,320.00----------------
select * from PRODUCT_TABLE

select item_description from ITEMS_TABLE1
right join 
PRODUCT_TABLE
on
ITEMS_TABLE1.Product_id=PRODUCT_TABLE.Product_Id
where Gross_Sales=13320.00
----------------------------------------------------------------------------------------------------
-----------Split the Item_description Column into Columns Item_desc1 and Item_desc2-----------

select  
SUBSTRING(Item_description,1 , CHARINDEX(' ',Item_description)-1) AS Item_desc1,
SUBSTRING(Item_description , CHARINDEX(' ' ,Item_description)+1, LEN(Item_description))AS Item_Desc2
FROM ITEMS_Table1
-----------------------------------------------------------------------------------------------------








