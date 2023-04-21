-- First we get the average amount of cases per year per country instead of multiple observations per year
create table dengue_per_year as
 select 
	country,
	year,
	avg (cases):: numeric(7,6) as cases
from
	dengue
group by
	year,
	country
order by 
	country desc,
	year desc;

-- The columns we want to bring to the joined table are 
-- dengue.dengue_cases, dengue.country, dengue.year
-- gapminder.population, gapminder.country, gapminder.year

-- Then we add the gapminder data
create table gapminder_dengue_country as
select 
	dengue_per_year.country,
	dengue_per_year.year,
	dengue_per_year.cases,
	gapminder.population
from 
	dengue_per_year
inner join 
	gapminder
on 
	dengue_per_year.country = gapminder.country 
	and dengue_per_year.year = gapminder.year;