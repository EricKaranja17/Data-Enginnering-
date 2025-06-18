-- Showing the whole table
select country_name, country_code, indicator_name, indicator_code, debt 
from debt.international_debt_with_missing_values;

 -- What is the total amount of debt owed by all countries in the dataset?
select sum(debt) as total_debt
from debt.international_debt_with_missing_values
where debt is not null;

-- How many distinct countries are recorded in the dataset?
SELECT distinct country_name AS number_of_countries
FROM debt.international_debt_with_missing_values
where country_name <> '';

select count(distinct country_name)
from debt.international_debt_with_missing_values
where country_name <> '';

-- What are the distinct types of debt indicators, and what do they represent?
SELECT DISTINCT indicator_name
FROM debt.international_debt_with_missing_values;

-- Which country has the highest total debt, and how much does it owe?
SELECT country_name, SUM(debt) AS total_debt
FROM debt.international_debt_with_missing_values
GROUP BY country_name
having length(country_name) > 0
ORDER BY total_debt DESC
LIMIT 1;



-- What is the average debt across different debt indicators?
SELECT indicator_name,AVG(debt) AS average_debt
FROM debt.international_debt_with_missing_values
GROUP BY indicator_name;

-- Which country has made the highest amount of principal repayments?
select country_name, sum(debt) as principal_repayment
from debt.international_debt_with_missing_values
where indicator_name like '%Principal repayments%' and country_name <> ''
group by country_name
having sum(debt) > 0
order by principal_repayment desc
limit 1;

-- What is the most common debt indicator across all countries?
select indicator_name, count (*) as frequency
from debt.international_debt_with_missing_values
where indicator_name <> ''
group by indicator_name
order by frequency desc
limit 1;

-- Identify any other key debt trends and summarize your findings
-- Top 5 Most Common Debt Indicators

SELECT indicator_name, COUNT(*) AS frequency
FROM debt.international_debt_with_missing_values
WHERE indicator_name IS NOT NULL
GROUP BY indicator_name
ORDER BY frequency DESC
LIMIT 5;
