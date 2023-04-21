-- Checking the columnnames and types
select
	column_name, data_type 
from
	information_schema.columns
where
	table_schema = 'public'
	and table_name = 'gapminder';

-- Checking the timeframe in which the data has been collected
select
   distinct year
from
   gapminder
order by
	year desc; -- from 1960 to 2016
	
-- Checking the countries with the highest and lowest average population over this timeframe
select
	country,
	AVG (population):: NUMERIC(11,0)
from 
	gapminder 
group by
	country
order by 
	avg desc; -- China has the highest with around 1,000,000,000 and Greenland the lowest with around 51,000	
	
-- Checking the countries with the highest and lowest average life expectancy per year over this timeframe
select
	country,
	AVG (life_expectancy):: NUMERIC(6,2)
from
	gapminder
where life_expectancy is not null
group by
	country
order by 
	avg desc; -- Iceland has the highest with 78.17 and Central Africa Republic the lowest with 46.31

-- Checking how many countries are noted in the data
select
	count(distinct country)
from gapminder; -- 185 different countries
	
