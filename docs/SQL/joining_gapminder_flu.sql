-- The columns we want to bring to the joined table are 
-- flu.flu_cases, flu.country, flu.year
-- gapminder.life_expectancy, gapminder.population, gapminder.country, gapminder.continent, gapminder.year

-- We join the flu and gapminder data
create table gapminder_flu as
select 
	gapminder.country, 
	gapminder.year, 
	gapminder.life_expectancy,
	gapminder.population,
	gapminder.continent,
	gapminder.gdp,
	flu_per_year.flu_cases
from 
	gapminder
inner join 
	flu_per_year
on 
	gapminder.country = flu_per_year.country
	and gapminder.year = flu_per_year.year;

create table gapminder_flu_continent as
 select
 	continent,
	year,
	avg (life_expectancy)::numeric(3,1) as life_expectancy,
	sum (gdp)::numeric(20,2) as gdp,
	sum (flu_cases)::numeric(6,1) as flu_cases,
	sum (population)::numeric(20,2) as population
from
	gapminder_flu
group by
	continent,
	year
order by 
	continent desc,
	year desc;
	
