-- First we check the columnnames and types
select
	column_name, data_type 
from
	information_schema.columns
where 
	table_schema = 'public'
	and table_name = 'dengue';

-- We check in which timeframe the data has been collected
select
   distinct year
from
   dengue
order by
	year desc; -- from 2002 to 2015
	
-- We check which countries had the most and least dengue cases on average over this timeframe
select 
	country,
	AVG (cases):: NUMERIC(6,4)
from
	dengue
group by
	country
order by 
	avg desc; -- Venezuela had the most with 0.2774 on average, Bolivia the least with 0.0447

-- We check how many countries are noted in the data and if they are spelled correctly
select
	distinct country
from dengue; -- 10 different countries, all spelled correctly