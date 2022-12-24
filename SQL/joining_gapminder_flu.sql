-- First we get the average amount of cases per year per country instead of multiple observations per year
create table flu_per_year as
 select 
	country,
	year,
	avg (cases):: numeric(10,1) as cases
from
	flu
group by
	year,
	country
order by 
	country desc,
	year desc;

-- The columns we want to bring to the joined table are 
-- flu.flu_cases, flu.country, flu.year
-- gapminder.life_expectancy, gapminder.population, gapminder.country, gapminder.continent, gapminder.year

-- We join the flu and gapminder data
create table gapminder_flu_country as
select 
	gapminder.country, 
	gapminder.year, 
	gapminder.population,
	gapminder.continent,
	flu_per_year.cases
from 
	gapminder
inner join 
	flu_per_year
on 
	gapminder.country = flu_per_year.country
	and gapminder.year = flu_per_year.year;

-- We focus on continents instead of countries
create table gapminder_flu_continent as
 select
 	continent,
	year,
	sum (cases)::numeric(6,1) as cases,
	sum (population)::numeric(20,2) as population
from
	gapminder_flu_country
group by
	continent,
	year
order by 
	continent desc,
	year desc;