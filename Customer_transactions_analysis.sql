


							/*	Customer Transactions data for analysis	*/




CREATE TABLE customer_transactions2 (CustomerID int, InvoiceDate date, Quantity int, UnitPrice float)


INSERT INTO customer_transactions2 (CustomerID, InvoiceDate, Quantity, UnitPrice) VALUES
(7, '2024-01-01', 2, 37.00),
(4, '2024-01-02', 1, 41.43),
(8, '2024-01-03', 7, 20.69),
(5, '2024-01-04', 7, 9.33),
(7, '2024-01-05', 8, 47.32),
(10, '2024-01-06', 5, 22.89),
(3, '2024-01-07', 3, 28.30),
(7, '2024-01-08', 8, 42.70),
(8, '2024-01-09', 6, 35.41),
(5, '2024-01-10', 3, 38.08),
(3, '2024-01-11', 4, 38.57),
(10, '2024-01-12', 1, 9.73),
(6, '2024-01-13', 6, 7.35),
(7, '2024-01-14', 7, 24.43),
(4, '2024-01-15', 3, 15.47),
(8, '2024-01-16', 8, 16.65),
(2, '2024-01-17', 4, 30.92),
(6, '2024-01-18', 7, 11.45),
(1, '2024-01-19', 2, 22.50),
(4, '2024-01-20', 8, 46.10),
(3, '2024-01-21', 4, 10.45),
(9, '2024-01-22', 2, 27.98),
(6, '2024-01-23', 6, 21.60),
(8, '2024-01-24', 7, 25.88),
(5, '2024-01-25', 1, 16.11),
(1, '2024-01-26', 9, 48.50),
(2, '2024-01-27', 7, 22.19),
(10, '2024-01-28', 4, 30.07),
(5, '2024-01-29', 2, 36.61),
(4, '2024-01-30', 9, 45.67),
(3, '2024-01-31', 5, 9.80),
(8, '2024-02-01', 3, 39.16),
(7, '2024-02-02', 6, 22.39),
(10, '2024-02-03', 8, 48.60),
(2, '2024-02-04', 2, 31.88),
(9, '2024-02-05', 4, 11.19),
(8, '2024-02-06', 1, 14.54),
(10, '2024-02-07', 5, 41.75),
(7, '2024-02-08', 9, 30.93),
(4, '2024-02-09', 7, 19.13),
(1, '2024-02-10', 3, 28.82),
(3, '2024-02-11', 6, 5.98),
(2, '2024-02-12', 4, 47.71),
(9, '2024-02-13', 1, 38.57),
(6, '2024-02-14', 8, 25.26),
(10, '2024-02-15', 3, 42.79),
(8, '2024-02-16', 6, 33.63),
(7, '2024-02-17', 2, 18.49),
(1, '2024-02-18', 5, 6.11),
(5, '2024-02-19', 9, 8.79),
(4, '2024-02-20', 1, 12.50),
(9, '2024-02-21', 8, 23.57),
(6, '2024-02-22', 2, 41.80),
(3, '2024-02-23', 5, 27.29),
(8, '2024-02-24', 3, 10.57),
(7, '2024-02-25', 6, 45.88),
(2, '2024-02-26', 4, 29.57),
(1, '2024-02-27', 7, 39.43),
(9, '2024-02-28', 2, 32.01),
(10, '2024-03-01', 5, 16.99),
(3, '2024-03-02', 1, 21.75),
(4, '2024-03-03', 8, 11.44),
(7, '2024-03-04', 2, 30.10),
(8, '2024-03-05', 4, 37.40),
(2, '2024-03-06', 6, 15.50),
(9, '2024-03-07', 3, 27.29),
(10, '2024-03-08', 9, 12.55),
(1, '2024-03-09', 7, 46.11),
(3, '2024-03-10', 4, 30.19),
(6, '2024-03-11', 2, 22.71),
(5, '2024-03-12', 6, 28.39),
(4, '2024-03-13', 5, 8.18),
(9, '2024-03-14', 1, 13.93),
(8, '2024-03-15', 8, 29.37),
(7, '2024-03-16', 3, 43.90),
(2, '2024-03-17', 7, 26.52),
(6, '2024-03-18', 4, 40.75),
(3, '2024-03-19', 9, 6.15),
(1, '2024-03-20', 2, 14.33),
(5, '2024-03-21', 5, 31.78),
(10, '2024-03-22', 8, 38.11),
(4, '2024-03-23', 6, 47.28),
(9, '2024-03-24', 7, 7.75),
(8, '2024-03-25', 3, 23.50),
(2, '2024-03-26', 1, 12.40),
(6, '2024-03-27', 5, 10.95),
(3, '2024-03-28', 4, 5.90),
(1, '2024-03-29', 6, 36.17),
(7, '2024-03-30', 2, 33.28),
(10, '2024-03-31', 9, 24.15);




select top 20 * from customer_transactions2




-- Q1.	When is the sales the most, i.e. on which days of the week and compare weekday sales to weekend sales for each week of the month

				/*Business wants to consider Friday, Saturday and Sunday as weekends and rest of the days as weekdays*/



SELECT *,
		CASE WHEN [Weekend Sale] is null or [Weekday Sale] is null
			 THEN 'No weekday/weekend sales OR no weekday/weekend'
			 ELSE '' END AS [Comment]
	
	FROM (
			SELECT DATETRUNC(MONTH, InvoiceDate) [year_month],
					DATEPART(ISO_WEEK, InvoiceDate) [week num],
					SUM(CASE WHEN FORMAT(InvoiceDate, 'ddd') NOT IN ('Fri', 'Sat', 'Sun') THEN UnitPrice*Quantity end) [Weekday Sale],
					SUM(CASE WHEN FORMAT(InvoiceDate, 'ddd') IN ('Fri', 'Sat', 'Sun') THEN UnitPrice*Quantity end) [Weekend Sale],
					
					CAST(100.0*(SUM(CASE WHEN FORMAT(InvoiceDate, 'ddd') IN ('Fri', 'Sat', 'Sun') THEN UnitPrice*Quantity end)
						- SUM(CASE WHEN FORMAT(InvoiceDate, 'ddd') NOT IN ('Fri', 'Sat', 'Sun') THEN UnitPrice*Quantity end))
					/SUM(CASE WHEN FORMAT(InvoiceDate, 'ddd') NOT IN ('Fri', 'Sat', 'Sun') THEN UnitPrice*Quantity end)
					AS DECIMAL(10,2)) [% change in weekend sales]
					
			FROM customer_transactions2
			group by DATETRUNC(MONTH, InvoiceDate), 
					 DATEPART(ISO_WEEK, InvoiceDate)
			) s1
	
	order by 1



/*		Exceute Query below to verify the above query's result with actual dataset

select *,
FORMAT(InvoiceDate, 'yyyy-MMM') [year_month],
DATEPART(ISO_WEEK, InvoiceDate) [week number]
from customer_transactions2;

*/




--	Q2.	Identify the top 5 customers for each month who have brought most sales to the store



WITH compiled_sales as (SELECT CustomerID, DATETRUNC(MONTH, InvoiceDate) [Year_month],
							   SUM(UnitPrice*Quantity) [Sales amount]
							
							FROM customer_transactions2
							GROUP BY CustomerID, DATETRUNC(MONTH, InvoiceDate)
							order by DATETRUNC(MONTH, InvoiceDate), [Sales amount] desc
							OFFSET 0 ROW)

SELECT CustomerID, FORMAT([Year_month], 'yyyy-MMM') [Year_month],
		[Sales amount]

FROM (SELECT *,
		DENSE_RANK() over(partition by [Year_month] order by [Sales amount] desc) [Purchase Rank]
		
		FROM compiled_sales
	   ) s1

WHERE [Purchase Rank] <= 5




--Q3.	From above finding, determine how much to the total sales have the top 5 customers contributed each month



	/*	we can run the same query in Q2 and modify it accordingly to include net sales and then compare		*/

WITH compiled_sales as (SELECT CustomerID, DATETRUNC(MONTH, InvoiceDate) [Year_month],
							   SUM(UnitPrice*Quantity) [Sales amount]
							
							FROM customer_transactions2
							GROUP BY CustomerID, DATETRUNC(MONTH, InvoiceDate)
							order by DATETRUNC(MONTH, InvoiceDate), [Sales amount] desc
							OFFSET 0 ROW),

top_5_customers as (SELECT CustomerID, FORMAT([Year_month], 'yyyy-MMM') [Year_month],
								[Sales amount]
						
						FROM (SELECT *,
								DENSE_RANK() over(partition by [Year_month] order by [Sales amount] desc) [Purchase Rank]
								
								FROM compiled_sales
							   ) s1
						
						WHERE [Purchase Rank] <= 5)

SELECT ns.Year_month [Year-Month], CustomerID,
		CAST(100.0*[Sales amount]/[Net sales] AS decimal(10,2)) [% sales contribution]

FROM (SELECT FORMAT(InvoiceDate, 'yyyy-MMM') [Year_month],
			 SUM(UnitPrice*Quantity) [Net sales]
		
		from customer_transactions2
		group by FORMAT(InvoiceDate, 'yyyy-MMM')) ns

JOIN top_5_customers tc ON tc.Year_month = ns.Year_month




-- Q4.	BU wants to know if top 5 customers are making a bulk transactions or if their purchase is spread over a month, derive metrics for the same



	/*	We can again use the query from Q2 to answer this with additional modifications to it as needed	*/

WITH compiled_sales as (SELECT CustomerID, DATETRUNC(MONTH, InvoiceDate) [Year_month],
							   SUM(UnitPrice*Quantity) [Sales amount]
							
							FROM customer_transactions2
							GROUP BY CustomerID, DATETRUNC(MONTH, InvoiceDate)
							order by DATETRUNC(MONTH, InvoiceDate), [Sales amount] desc
							OFFSET 0 ROW),

top_5_customers as (SELECT CustomerID, FORMAT([Year_month], 'yyyy-MMM') [Year_month],
								[Sales amount]
						
						FROM (SELECT *,
								DENSE_RANK() over(partition by [Year_month] order by [Sales amount] desc) [Purchase Rank]
								
								FROM compiled_sales
							   ) s1
						
						WHERE [Purchase Rank] <= 5)

SELECT tc.CustomerID, tc.[Year_month], [Sales amount], [frequency of purchase], [Weekend purchases], [Weekday purchases]

FROM top_5_customers tc

JOIN (SELECT FORMAT(InvoiceDate, 'yyyy-MMM') [year_month], CustomerID,
				COUNT(CustomerID) [frequency of purchase],
				COUNT(CASE WHEN FORMAT(InvoiceDate, 'ddd') IN ('Fri', 'Sat', 'Sun') THEN 1 END) [Weekend purchases],
				COUNT(CASE WHEN FORMAT(InvoiceDate, 'ddd') NOT IN ('Fri', 'Sat', 'Sun') THEN 1 END) [Weekday purchases]
		
		FROM customer_transactions2
		GROUP BY FORMAT(InvoiceDate, 'yyyy-MMM'), CustomerID) fc

ON fc.year_month = tc.Year_month AND fc.CustomerID = tc.CustomerID
ORDER BY 2, 3 desc




-- Q5.	Derive a query to compare M-O-M sales and also compare sales for the first 15 days (from 1st to 15th) to last 15 days (from 16th to EOM) for each month 


WITH fortnight_sale AS (SELECT DATETRUNC(MONTH, InvoiceDate) [year_month],
							SUM(UnitPrice*Quantity) [Net monthly sales],
							SUM(CASE WHEN InvoiceDate <= DATEADD(DAY, 14, DATETRUNC(MONTH, InvoiceDate)) THEN (UnitPrice*Quantity) END) [First 15 Day Sales],
							SUM(CASE WHEN InvoiceDate > DATEADD(DAY, 14, DATETRUNC(MONTH, InvoiceDate)) THEN (UnitPrice*Quantity) END) [Last 15 Day Sales]

						FROM customer_transactions2
						GROUP BY DATETRUNC(MONTH, InvoiceDate)
					  )

SELECT FORMAT(year_month, 'yyyy-MMM') [year_month], [Net monthly sales],

		ISNULL(CAST(100.0*([Net monthly sales] - LAG([Net monthly sales], 1) OVER(ORDER BY year_month))
			/(LAG([Net monthly sales], 1) OVER(ORDER BY year_month)) AS varchar(20)), '-') [% difference - M-O-M sale],

		[First 15 Day Sales], [Last 15 Day Sales],

		CAST(100.0*([Last 15 Day Sales] - [First 15 Day Sales])
				/[First 15 Day Sales] AS DECIMAL(10, 2)) [% change in fortnight Sales]

FROM fortnight_sale





			-----==============================CLOSE OF BUSINESS HOURS 😉================================-----

