# 1. Average Daily Trading Volume

use stockmarket_analytics;

SELECT ticker, AVG(volume) AS average_daily_volume
FROM synthetic_stock_data
GROUP BY ticker;

# 2. synthetic_stock_dataMost Volatile Stocks (Stocks with the highest Beta values)

select ticker, round(avg(Beta),5) AS most_volatile_stocks
FROM synthetic_stock_data
GROUP BY ticker
order by ticker desc;

# 3. Stocks with Highest Dividend and Lowest Dividend

#alter table synthetic_stock_data rename column `Dividend Amount` to Dividend_Amount;

#----Highest Dividend Amount-----

select ticker, sum(Dividend_Amount) AS Highest_Dividend_Amount
FROM synthetic_stock_data
GROUP BY ticker
order by ticker desc;

#----Lowest Dividend Amount-----

SELECT Ticker, SUM(Dividend_Amount) AS lowest_dividend_amount
FROM synthetic_stock_data
GROUP BY Ticker
ORDER BY lowest_dividend_amount ASC
LIMIT 1;

# 4. Highest and Lowest P/E Ratios

#alter table synthetic_stock_data rename column `PE Ratio` to PE_Ratio;

# (highest_PE_Ratio)

SELECT Ticker, max(PE_Ratio) AS highest_PE_Ratio
FROM synthetic_stock_data
GROUP BY Ticker
ORDER BY highest_PE_Ratio desc
Limit 1;

# (lowest_PE_Ratio)

SELECT Ticker, min(PE_Ratio) AS lowest_PE_Ratio
FROM synthetic_stock_data
GROUP BY Ticker
ORDER BY lowest_PE_Ratio asc
Limit 1;

# 5) Stocks with Highest Market Cap

#alter table synthetic_stock_data rename column `Market Cap` to Market_Cap;

select Ticker, sum(Market_Cap) As Stocks_with_highest_Market_Cap
from synthetic_stock_data
group by Ticker
order by Stocks_with_highest_Market_Cap desc
Limit 1;

# 6) Stocks Near 52 Week High and 52 week low

#alter table synthetic_stock_data rename column `52 Week High` to 52_week_high;

select Ticker, concat(round(sum(52_week_high)/1000000,3),'M') AS stocks_near_52_week_high
from synthetic_stock_data
group by ticker
order by stocks_near_52_week_high desc;

# 7) Stocks Near 52 Week low

#alter table synthetic_stock_data rename column `52 Week Low` to 52_week_Low;

select Ticker, round(sum(52_week_Low)) AS stocks_near_52_week_Low
from synthetic_stock_data
group by ticker
order by stocks_near_52_week_Low asc;

# 8) Stocks with Strong Buy Signals and stocks with Strong Selling Signal

#use stockmarket_analytics;

#alter table synthetic_stock_data rename column `RSI (14 days)` to RSI_14_days;

#alter table synthetic_stock_data rename column `Stocks with strong buy & selling signals` to Stocks_with_strong_buy_and_selling_signals;

# Stocks with Strong Buying Signals

SELECT *
FROM synthetic_stock_data
WHERE RSI_14_days < 45 AND MACD > 0;

# Stocks with Strong selling Signals

SELECT *
FROM synthetic_stock_data
WHERE (RSI_14_days > 69 OR RSI_14_days = 69) AND MACD < 0;

# Stocks with Neutral Zone

SELECT *
FROM synthetic_stock_data
WHERE RSI_14_days > 45 AND RSI_14_days < 80;



