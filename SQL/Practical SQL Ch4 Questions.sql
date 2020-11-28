/* Practical SQL Chapter 4 Questions */

/*

Question 1:

Write a WITH statement to include with COPY to handle the import of an
imaginary text file first couple of rows look like this:

/*-----------------------------------------------------------------*/

id:movie:actor
50:#Mission: Impossible#:Tom Cruise

/*

COPY actors 
FROM 'filepath'
WITH (FORMAT TXT, HEADER, DELIMITER '#') ;


/*

Question 2:

Using the table us_counties_2010 you created and filled in this chapter, 
export to a CSV file the 20 counties in the United States that have the most
number of housing units. (Hint: Housing units are totaled for each county
in the column housing_unit_count_100_percent)

*/

COPY (
    SELECT geo_name, state_us_abbreviation, housing_unit_count_100_percent
    FROM us_counties_2010 ORDER BY housing_unit_count_100_percent DESC LIMIT 20
     )
TO 'C:\YourDirectory\us_counties_housing_export.txt'
WITH (FORMAT CSV, HEADER);



/* Number 3 */ 

/* numeric(8,3) */




