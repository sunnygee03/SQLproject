
USE Project
Select * from Store_sales

--Update
Update store_Sales set First_name = lower(First_name) from store_sales
Update store_Sales set Last_name = lower(Last_name) from store_sales
Update store_Sales set Country = lower(Country) from store_sales

--searching for null values
Select * from store_sales where first_name is null
--Replace null values
update store_sales set first_name= 'Not available' where first_name is null
update store_sales set last_name= 'Not available' where last_name is null
update store_sales set Customer_ID= 'Not available' where Customer_ID is null
update store_sales set Country= 'Not available' where Country is null
update store_sales set City= 'Not available' where City is null
update store_sales set State= 'Not available' where State is null

--Round to decimal place
Update store_Sales set Sales= round(sales,1) 
Update store_Sales set Discount= round(discount,2) 
Update store_Sales set Profit= round(profit,2) 
Select * from Store_sales
Order by Order_Date asc


--Questions 

-- Count of sales of all Regions
SELECT REGION , COUNT(SALES) AS Total_Sales FROM Store_sales GROUP BY REGION

--Count of sales of all regions by category 
SELECT REGION, Category ,COUNT(SALES) AS TOTAL_SALES FROM Store_sales GROUP BY REGION,Category

--Which Region is the Most Profitable
Select Region, sum(profit) AS Total_Profit from Store_sales
where profit >100
group by Region
order by Total_Profit DESC

--Total sales amount per category
Select Category, sum(Sales) as Total_sales from Store_sales
group by category 
order by Total_sales DESC

-- Total sales amount per subcategory
Select Sub_category, sum(Sales) as Total_sales from Store_sales
group by Sub_category 
order by Total_sales DESC

--Subcategories with higher than average sales amount
Select AVG(Sales) as Average_sales from Store_sales
Select Sub_category, AVG(Sales) as Average_sales from store_Sales
where Sales > (Select AVG(Sales) from Store_sales)
group by Sub_Category
order by Sub_Category

--Which Category is most Profitable
Select Category, sum(profit) AS Total_Profit from Store_sales
where profit >100
group by Category
order by Total_Profit DESC

--Which subcategory is most Profitable
Select Sub_Category, sum(profit) AS Total_Profit from Store_sales
where profit >100
group by Sub_Category
order by Total_Profit DESC

--Which subcategory is least profitable
Select Sub_Category, sum(profit) AS Sum_ProfitNegative from Store_sales
where profit <0
group by Sub_Category
order by Sum_ProfitNegative ASC

-- Count of sales in each subcategory 
Select Sub_Category, count(Sales) as Count_sales from Store_sales
group by Sub_Category
order by Count_sales DESC

--Which City has the Highest Number of Sales
Select City, sum(Sales) as Total_sales from store_sales
Where Sales > 1000
group by City
Order by Total_sales DESC

--Create View
Create View Citysales_view AS Select First_Name, Last_Name, City, Sales, Quantity from Store_sales
Select * from Citysales_view

--Inner Join
Select * from Store_sales
Select * from Returned 
Select * from Store_Sales Inner Join Returned On Store_sales.Order_ID= Returned.Order_ID

