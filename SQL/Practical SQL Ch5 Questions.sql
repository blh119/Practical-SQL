/* Practical SQL Chapter 5 Questions */

/*

Question 1:

Write an SQL statement for calculating the area of a circle whose radius is 
5 inches. (If you don't remember the formula, it's an easy web search.) Do
you need parentheses in your calculation? Why or why not?

/*

SELECT 3.14 * POWER(5,2) ;

/* Yes, I needed parentheses for the power function */

/*

Question 2:

Using the 2010 Census county data, find out which New York State county
has the highest percentage of the population that identified as "American
Indian/Alaska Native Alone." What can you learn about that county from
online research that explains the relatively large proportion of American
Indian population compared with other New York counties?

*/

SELECT geo_name,
       state_us_abbreviation AS "state",
	   ROUND((CAST(p0010005 AS numeric(8,2)) 
			 / p0010001) * 100, 2) AS pct_native,
	   p0010001 AS total_pop,
	   p0010005 AS "Indian/Alaska Native Alone"
FROM us_counties_2010 
WHERE state_us_abbreviation = 'NY'
ORDER BY pct_native DESC
;

/* 

Franklin County comprises the Malone, NY Micropolitan Statistical Area. 
Much of Franklin County is within Adirondack Park. 
Within the border of the county is the St. Regis Mohawk Reservation, 
or Akwesasne in the Mohawk language. 

*/


/* 

Question 3:

Was the 2010 median county population higher in California or New York?

*/ 


SELECT state_us_abbreviation,
       percentile_cont(0.5)
          WITHIN GROUP (ORDER BY p0010001) AS median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation
;

