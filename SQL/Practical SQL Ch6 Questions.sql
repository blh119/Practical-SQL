/* Practical SQL Chapter 6 Questions */

/*

Question 1:

The table us_counties_2010 contains 3,143 rows, and us_counties_2000
has 3,143. That reflects the ongoing adjustments to county-level geographies
that typically result from government decision making. Using appropiate
joins the NULL value, identify which counties don't exist both 
tables. For fun, search online to find out why they're missing.

/*

SELECT 
	c2010.county_fips,
	c2000.county_fips,
	c2010.geo_name,
	c2000.geo_name
FROM us_counties_2010 c2010 LEFT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips  
AND c2010.county_fips = c2000.county_fips 
WHERE c2000.geo_name IS NULL 
;

/*

Question 2:

Using either the median() or percentile_cont() functions in Chapter 5,
determine the median of the percent change in county population.

*/

SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2000.geo_name
FROM us_counties_2010 c2010 LEFT JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
WHERE c2000.geo_name IS NULL;

/*

Question 3:

Which county had the greatest percentage loss of population between
2000 and 2010? Do you have idea why? (Hint: A major weather
event happened in 2005.)

*/

SELECT c2010.geo_name,
       c2010.state_us_abbreviation AS state,
	   c2000.p0010001 AS pop_2000,
	   c2010.p0010001 AS pop_2010, 
       round( (CAST(c2010.p0010001 AS numeric(10,2)) - c2000.p0010001 )
	   / c2000.p0010001 * 100, 2) AS pct_change  
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000 
ON c2010.state_fips = c2000.state_fips
AND c2010.county_fips = c2000.county_fips
ORDER BY pct_change ASC
;


   
