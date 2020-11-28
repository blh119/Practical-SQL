/* Practical SQL Chapter 8 Questions */

/*

Question 1:

We saw that library visits have declined recently in most places. But
what is the pattern in the use of technology in libraries? Both the 2014
and 2009 library survey tables contain the columns gpterms (the number
of internet-connected computers used by the public) and pitusr (uses of
public internet computers per year). Modify the code in Listing 8-13 to cal-
culate the percentage change in the sum of each column over time. Watch out
for negative values!

*/

SELECT pls14.stabr,
       sum(pls14.gpterms) AS num_computers_14,
	   sum(pls09.gpterms) AS num_computers_09,
	   round( (CAST(sum(pls14.gpterms) AS decimal(10,2)) - sum(pls09.gpterms)) / 
			sum(pls09.gpterms) * 100, 2) AS pct_change_computer_use,
	   sum(pls14.pitusr) AS num_users_14,
	   sum(pls09.pitusr) AS num_users_09,
	   round( (CAST(sum(pls14.pitusr) AS decimal(10,2)) - sum(pls09.pitusr)) /
			sum(pls09.pitusr) * 100, 2) AS pct_change_users
FROM pls_fy2014_pupld14a pls14 INNER JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr 
ORDER BY pct_change_users ASC ;

/*

Question 2:

Both library survey tables contain a column called obereg, a two-digit
Bureau of Economic Analysis Code that classifies each library agency
according to a region of the United States, such as New England, Rocky
Mountains, and so on. Just as we calculated the percentage change in visits
grouped by the state, do the same to group percentage changes in visits by U.S.
region using obereg. Consult the survey documentation to find the meaning
of each region code. For a bonus challenge, create a table with the obereg
code as the primary key and the region name as text, and join it to the 
summary query to group by the region name rather than the code. 
*/

CREATE TABLE obe_region (
	obe_region_number integer NOT NULL,
	obe_region_name varchar(50) NOT NULL,
	PRIMARY KEY (obe_region_number)
) ; 

INSERT INTO obe_region (obe_region_number, obe_region_name)
VALUES (1, 'New England'),
       (2, 'Mid East'),
	   (3, 'Great Lakes'),
	   (4, 'Plains'),
	   (5, 'South East'),
	   (6, 'South West'),
	   (7, 'Rocky Mountains'),
	   (8, 'Far West') ; 
	   

SELECT obe_region.obe_region_number, obe_region.obe_region_name,
	   round( (CAST(sum(pls14.pitusr) AS decimal(10,2)) - sum(pls09.pitusr)) /
			sum(pls09.pitusr) * 100, 2) AS pct_change_users, 
	   round( (CAST(sum(pls14.gpterms) AS decimal(10,2)) - sum(pls09.gpterms)) / 
			sum(pls09.gpterms) * 100, 2) AS pct_change_computer_use,
       sum(pls14.gpterms) AS num_computers_14,
	   sum(pls09.gpterms) AS num_computers_09,
	   sum(pls14.pitusr) AS num_users_14,
	   sum(pls09.pitusr) AS num_users_09
FROM pls_fy2014_pupld14a pls14 
INNER JOIN pls_fy2009_pupld09a pls09 ON pls14.fscskey = pls09.fscskey
INNER JOIN obe_region ON pls14.obereg = obe_region.obe_region_number
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY obe_region.obe_region_number
ORDER BY obe_region.obe_region_number ASC ;

/*

Question 3:

Thinking back to the types of joins you learned in Chapter 6, which join 
type will show you all the rows in both tables, including those without a
match? Write such a query and add an IS NULL filter in a WHERE clause to
show agencies not included in one or the other table. 

*/

/*

A FULL OUTER JOIN will show all rows in both tables. Using the IS NULL statements
in the WHERE clause limit results to those that do not appear in both tables.

*/

SELECT
  pls14.fscskey,
  pls14.libname,
  pls14.city,
  pls14.stabr,
  pls14.statstru,
  pls14.c_admin,
  pls14.branlib,
  pls09.fscskey,
  pls09.libname,
  pls09.city,
  pls09.stabr,
  pls09.statstru,
  pls09.c_admin,
  pls09.branlib
FROM
  pls_fy2014_pupld14a AS pls14
  FULL OUTER JOIN pls_fy2009_pupld09a AS pls09 ON pls14.fscskey = pls09.fscskey
WHERE
  pls14.fscskey IS NULL
  OR pls09.fscskey IS NULL;






