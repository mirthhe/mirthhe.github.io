# ReadMe data/relationaldata

This folder contains the data files for the assignment about using SQL for relational data.

## [gapminder_dengue_country.csv](https://github.com/mirthhe/mirthhe.github.io/blob/main/data/relationaldata/gapminder_dengue_country.csv)

- Description: This dataset is the result of joining the gapminder dataset (from R package ggplot2) and the [dengue dataset](https://github.com/mirthhe/mirthhe.github.io/blob/main/data-raw/relationaldata/dengue_data.csv) on columns 'country' and 'year' in DBeaver using SQL. It shows the amount of dengue cases and average population per country per year. The script used for the joining can be found in ../../SQL/joining_gapminder_dengue.sql.
- Date of creation: 06/12/2022
- Date of collection: 2002 - 2015
- Keywords: joined, relational, dengue, gapminder, cases, country, population
- Raw data: gapminder, [dengue_data.csv](https://github.com/mirthhe/mirthhe.github.io/blob/main/data-raw/relationaldata/dengue_data.csv)
- Joining script: ../../SQL/joining_gapminder_dengue.sql
- Dimensions: 4 columns, 130 rows
- Variables:
    - Country - Country of interest
    - Year - Year of data collection (2002 until 2015)
    - Cases - Dengue cases in country of interest during year of data collection
    - Population - Average opulation of country of interest during year of data collection


## [gapminder_flu_continent.csv](https://github.com/mirthhe/mirthhe.github.io/blob/main/data/relationaldata/gapminder_flu_continent.csv)

- Description: This dataset is the result of joining the gapminder dataset (from R package ggplot2) and the [flu dataset](https://github.com/mirthhe/mirthhe.github.io/blob/main/data-raw/relationaldata/flu_data.csv) on columns 'continent' and 'year' in DBeaver using SQL. It shows the amount of flu cases and average population per continent per year. The script used for the joining can be found in ../../SQL/joining_gapminder_flu.sql.
- Date of creation: 06/12/2022
- Date of collection: 2002 - 2015
- Keywords: joined, relational, flu, gapminder, cases, continent, population
- Raw data: gapminder, [flu_data.csv](https://github.com/mirthhe/mirthhe.github.io/blob/main/data-raw/relationaldata/flu_data.csv)
- Joining script: ../../SQL/joining_gapminder_flu.sql
- Dimensions: 4 columns, 60 rows
- Variables:
    - Continent - Continent of interest
    - Year - Year of data collection (2002 until 2015)
    - Cases - Flu cases in continent of interest during year of data collection
    - Population - Average opulation of continent of interest during year of data collection