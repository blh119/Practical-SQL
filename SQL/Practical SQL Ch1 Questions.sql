/*

Ch1: Creating Your First Database and Table

*/

/*

Question 1:

Imagine you're building a database to catalog all animals at your local
zoo. You want one table to track the kinds of animals in the collection and
another table to track the specifies on each animals. Write CREATE TABLE
statements for each table that include some of the columns you need. Why
did you include the columns you chose?

*/

/* CREATE TABLE classification (
	kingdom varchar(50),
	phylum varchar(50),
	class varchar(50),
	order_ varchar(50),
	subfamily varchar(50),
	tribe varchar(50),
	genus varchar(50),
	species varchar(50)
) ; */

/*

Question 2

Now create INSERT statements to load sample data into the tables. How 
can you view the data via the pgAdmin tool? Create an additional INSERT
statement for one of your tables. Purposely amit one of the required commas
seperating the entries in the VALUES clause of the query. What is the error
message? Would it help you find the error in the code?

*/

INSERT INTO animals (species, sex, years, months, location)
VALUES ('black bear', 'female', 11, 9, 'North American Wing'),
       ('chimpanzee', 'male', 34, 2, 'Africa Wing'),
	   ('reindeer', 'female', 2, 11, 'North America Wing')
;