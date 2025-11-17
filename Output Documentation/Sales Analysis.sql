-- Expoloring the dataset holistically
SELECT *
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- Exploring the highest sales made of the product
SELECT MAX(SALES) AS Highest_sale
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- Exploring the lowest sale made of the product
SELECT MIN(SALES) AS Lowest_sale
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- Exploring the average sale of the product
SELECT AVG(SALES) AS Average_sale
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- Unit cost of the product
SELECT DIV0NULL(COST_OF_SALES, QUANTITY_SOLD) AS Unit_Cost
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- Profit and loss margins for the product
SELECT (SALES-COST_OF_SALES) AS Profit_and_loss_margins
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;
-- When writing the main syntax the profit and loss margins will be fully
-- explored in terms of percenatge loss and profit

-- DateFunctions
-- Fixing the Date Column to the correct format
SELECT TO_CHAR(TO_TIMESTAMP(DATE,'DD/MM/YYYY'),'YYYY-MM-DD') AS Correct_Date_Format
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

-- As I finished my syntax below I had a VarChar date error
-- Below I am trying to explore the datefunction further to fix the syntax
SELECT DATE
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

SELECT DISTINCT LEN(DATE)
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD;

SELECT *
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD
WHERE LEN(DATE) = 8;

-------------------------------------------------------------------------------  
SELECT DATE,
       TO_DATE(DATE,'DD/MM/YYYY') AS Sale_Date,
       DAYOFMONTH(Sale_Date) AS Date_of_Sale,
       DAYNAME(TO_DATE(Sale_Date)) AS Day_of_Sale,
       CASE
       WHEN Day_of_sale IN ('Sat', 'Sun') THEN 'Weekend'
       Else 'Weekday'
       END AS Time_of_Week,
       MONTHNAME(Sale_Date) AS Month_of_Sale,
       CASE
       WHEN Month_of_Sale IN ('Dec','Jan','Feb') THEN 'Summer'
       WHEN Month_of_Sale IN ('Mar', 'Apr', 'May') THEN 'Autumn'
       WHEN Month_of_Sale IN ('Jun', 'Jul', 'Aug') THEN 'Winter'
       WHEN Month_of_Sale IN ('Sep', 'Oct', 'Nov') THEN 'Spring'
       END AS Season_of_Sale,
       YEAR(Sale_Date),
       SALES,
       CASE
       WHEN SALES BETWEEN 20495 AND 69999 THEN 'Below Average'
       WHEN SALES BETWEEN 69999.01 AND 117502 THEN 'Average Sale'
       WHEN SALES BETWEEN 117502.01 AND 964180 THEN 'Above Average Sale'
       WHEN SALES > 964180.01 THEN 'Best Sale'
       END AS Sales_Bucket,
       COST_OF_SALES,
       (SALES-COST_OF_SALES) AS Profit_and_loss_margins,
       ROUND(Profit_and_loss_margins/NULLIF(COST_OF_SALES, 0)  * 100 , 2 ) AS Profit_and_Loss_Percentage,
       QUANTITY_SOLD,
       DIV0NULL(COST_OF_SALES, QUANTITY_SOLD) AS Unit_Cost,
       CASE
       WHEN Unit_Cost < 33 THEN 'On Promotion'
       WHEN Unit_Cost = 33 THEN 'Normal Price'
       WHEN Unit_Cost > 33 THEN 'Above Normal Price'
       END AS Price_Bucket,
       (Unit_Cost*QUANTITY_SOLD) AS Revenue
FROM CASESTUDY3.SALESANALYSIS.UNITSOLD
LIMIT 1000;
