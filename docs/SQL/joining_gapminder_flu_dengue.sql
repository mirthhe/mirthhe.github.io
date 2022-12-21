-- First we get the average amount of cases per year per country instead of multiple observations per year
create table flu_per_year as
 select 
	country,
	year,
	AVG (cases):: NUMERIC(6,1)
from
	flu
group by
	year,
	country
order by 
	country desc,
	year desc;

-- We do the same for the dengue data
create table dengue_per_year as
 select 
	country,
	year,
	AVG (cases):: NUMERIC(7,6)
from
	dengue
group by
	year,
	country
order by 
	country desc,
	year desc;

-- Then we make sure the AVG columns have unique names
alter table flu_per_year
rename column avg to flu_cases;

alter table dengue_per_year
rename column avg to dengue_cases;

-- The columns we want to bring to the joined table are 
-- flu.flu_cases, flu.country, flu.year
-- dengue.dengue_cases, dengue.country, dengue.year
-- gapminder.life_expectancy, gapminder.gdp, gapminder.population, gapminder.country, gapminder.year

-- We join the flu and dengue data first
create table flu_dengue as
select
	flu_per_year.flu_cases, 
	flu_per_year.country, 
	flu_per_year.year, 
	dengue_per_year.dengue_cases 
from 
	flu_per_year
inner join
	dengue_per_year
on
	flu_per_year.country = dengue_per_year.country
	and flu_per_year.year = dengue_per_year.year;

-- Then we add the gapminder data
create table gapminder_flu_dengue as
select 
	gapminder.country, 
	gapminder.year, 
	gapminder.life_expectancy, 
	gapminder.gdp,
	gapminder.population,
	flu_dengue.flu_cases, 
	flu_dengue.dengue_cases 
from 
	gapminder
inner join 
	flu_dengue
on 
	gapminder.country = flu_dengue.country
	and gapminder.year = flu_dengue.year;