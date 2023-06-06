CREATE DATABASE BitcoinCurrency;
USE BitcoinCurrency;

SELECT * FROM BitcoinIndex;
RENAME TABLE Bitcoinbtc to BitcoinIndex;

SELECT * FROM BitcoinCurrency.BitcoinIndex ORDER BY high DESC;
SELECT * FROM BitcoinCurrency.standardIndex ORDER BY high DESC;

-- BITCOIN OPENING VALUE DETERMINED BY HIGH AND LOW VALUES WITHIN 8 YEARS PERIOD -- 
SELECT Date, Open, High, Low
FROM BitcoinCurrency.BitcoinIndex
ORDER BY 1,2;

-- S&P500 OPENING VALUE DETERMINED BY HIGH AND LOW VALUES WITHIN 8 YEARS PERIOD -- 
SELECT Date, Open, High, Low
FROM BitcoinCurrency.standardindex
ORDER BY 1,2;

-- BITCOIN DELTA MONTH BY MONTH WITH HIGH AND LOW PRICING -- 
SELECT Date, High, Low, ((High/Low)-1)*100 AS BitcoinDelta
FROM BitcoinCurrency.BitcoinIndex
ORDER BY 2,3;

-- S&P500 DELTA MONTH BY MONTH WITH HIGH AND LOW PRICING -- 
SELECT Date, High, Low, ((High/Low)-1)*100 AS StandardPoorsDelta
FROM BitcoinCurrency.standardindex
ORDER BY 2,3;

-- OPEN VS CLOSE BITCOIN -- 
SELECT Date, Open, Close, ((Open/Close)-1)*100 as IntraDayVariation
FROM BitcoinCurrency.bitcoinindex
ORDER BY 1,2;

-- OPEN VS CLOSE S&P-- 
SELECT Date, Open, Close, ((Open/Close)-1)*100 as IntraDayVariation
FROM BitcoinCurrency.standardindex
ORDER BY 1,2;

-- BITCOIN'S HIGHEST OPEN VALUE --
SELECT Date, Open, High, Close, Volume, max(Open) AS HighestOpeningValue FROM BitcoinCurrency.bitcoinindex
GROUP BY Date, Open, High, Close, Volume
ORDER BY HighestOpeningValue DESC;

-- S&P'S HIGHEST OPEN VALUE --
SELECT Date, Open, High, Close, Volume, max(Open) AS HighestOpeningValue FROM BitcoinCurrency.standardindex
GROUP BY Date, Open, High, Close, Volume
ORDER BY HighestOpeningValue DESC;

-- BITCOIN HIGHEST CLOSING BY MONTH-- 
SELECT MONTH(date) AS Month, MAX(Close) AS HighestClosingValue 
FROM BitcoinCurrency.bitcoinindex
GROUP BY month;

-- S&P HIGHEST CLOSING BY MONTH-- 
SELECT MONTH(date) AS Month, MAX(Close) AS HighestClosingValue 
FROM BitcoinCurrency.standardindex
GROUP BY month;

-- JOIN -- 
-- SELECT bitcoinindex.Date, bitcoinindex.Close, standardindex.Date, standardindex.Close 
-- FROM BitcoinCurrency.bitcoinindex left join BitcoinCurrency.standardindex
-- on bitcoinindex.date = standardindex.date;

-- SELECT bitcoinindex.Date, bitcoinindex.Close, standardindex.Date, standardindex.Close 
-- FROM BitcoinCurrency.bitcoinindex right join BitcoinCurrency.standardindex
-- on bitcoinindex.date = standardindex.date;

SELECT bitcoinindex.Date, bitcoinindex.Open, bitcoinindex.Close, standardindex.Date, standardindex.Open, standardindex.Close
FROM BitcoinCurrency.bitcoinindex join BitcoinCurrency.standardindex
on bitcoinindex.date = standardindex.date;

-- CREATING VIEW-- 
CREATE VIEW IndexComparison AS 
SELECT bitcoinindex.Date, bitcoinindex.Open, bitcoinindex.Close, standardindex.Date s_d, standardindex.Open s_o, standardindex.Close s_c
FROM BitcoinCurrency.bitcoinindex join BitcoinCurrency.standardindex
on bitcoinindex.date = standardindex.date;



