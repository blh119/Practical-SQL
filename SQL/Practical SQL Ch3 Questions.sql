/* Practical SQL Chapter 3 Questions */

/* 

Question 1 

Your company delivers fruit and vegetables to local grocery stores, and
you need to track the mileage driven by each driver each day to a tenth
of a mile. Assuming no driver would ever travel more than 999 miles in a
day, what would be an appropriate data type for the mileage column in
your table? Why?

Answer: 

numeric(3,1)

*/

/*

Question 2

In the table listing each driver in your company, what are appropriate
data types for the drivers' first and last names? Why is it a good idea to 
seperate first and last names into two columns rather than having one
larger name column?

Answer:

Is it a good idea because you might want to query through each of these
columns seperately. This is impossible when they are together

*/

/*

Question 3

Assume you have a text column that includes strings formatted as dates.
One of the string is written as '4//2017'. What will happen when you try
to convert that string to the timestamp data type?

Answer:

It will give an error

*/
