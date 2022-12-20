-- First we check the columnnames and types
select
	column_name, data_type 
from
	information_schema.columns
where 
	table_schema = 'public'
	and table_name = 'flu';

-- We check in which timeframe the data has been collected
select
   distinct year
from
   flu
order by
	year desc; -- from 2002 to 2015
	
-- We check which countries had the most and least flu cases on average over this timeframe
select 
	country,
	AVG (cases):: NUMERIC(6,1)
from
	flu
group by
	country
order by 
	avg desc; -- South Africa had the most with 2698.8 on average, Sweden the least 5.5

-- We check how many countries are noted in the data and if they are spelled correctly
select
	distinct country
from flu; -- 29 different countries, all spelled correctly