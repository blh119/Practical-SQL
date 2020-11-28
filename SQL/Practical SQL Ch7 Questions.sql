/* Practical SQL Chapter 7 Questions */

/*

Question 1:

Modify these CREATE TABLE statements to include primary and foeign keys
plus additional constraints on both tables. Explain why you made your 
choices.

*/

ALTER TABLE albums ADD CONSTRAINT album_id_key PRIMARY KEY (album_id) ;
ALTER TABLE albums ALTER COLUMN album_title SET NOT NULL ; 
ALTER TABLE albums ALTER COLUMN album_artist SET NOT NULL ; 
ALTER TABLE albums ALTER COLUMN album_release_date SET NOT NULL ; 
ALTER TABLE songs ADD CONSTRAINT song_id_key PRIMARY KEY (song_id) ;
ALTER TABLE songs ADD CONSTRAINT album_id_ref FOREIGN KEY (album_id) REFERENCES albums (album_id) ON DELETE CASCADE ;


/*

Question 2:

Instead of using album_id as a surrogate key for your pirmary key, are 
there any columns in albums that could be useful as a natural key? What
would you have to know to decide?

*/

/*

You could possibily use the catelog_code as a nautral key if each catelog 
code is not null and has a unique value


*/


/*

Question 3:

To speed up queries, which columns are good candidates for indexes?

*/

/*

We could use artist, genre, or song because most people will try to
search for a song using these keys.

*/











