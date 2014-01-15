-- 1. Create a database called wizards.The rest of the assesment all will take place in the wizards db.
 
-- 2. Create a table called wizards with the following columns (name, age).

CREATE TABLE wizards(
id integer NOT NULL Primary Key AUTO_INCREMENT,
name TEXT, 
age INTEGER
)
 
-- 3. Write a statement to count the number of rows in the wizards table.  How many wizards are there?

SELECT COUNT(name) FROM wizards;
 
-- 4. Insert a wizard into the database.

INSERT into wizards (name, age) 
VALUES ("Harry Potter", 11)
 
-- 5. Write a statement to count the number of rows in the wizards table.  How many wizards are there now?

SELECT COUNT(name) FROM wizards;
 
-- 6. Insert another wizard into the database.

INSERT into wizards (name, age) 
VALUES ("Hermione Granger", 21)
 
-- 7. Write a statement to change the second wizards age to 21.

UPDATE wizards SET age = 21 WHERE id = 2
 
-- 8. Write a statement to change all wizards ages to 40.

UPDATE wizards SET age = 40
 
-- 9. Write a statement to delete the last wizard.

SELECT * FROM powers WHERE id = (SELECT MAX(id) FROM powers);
 
-- 10. Write a statement to delete the wizards table.

DROP TABLE wizards;
 
-- 11. Create two data models for wizards.  The wizards are going to have a name, an age and two powers each.  
-- Let's pretend we're in a world where wizards have many powers, but powers belong to one wizard (two wizards cant have the same power)  Each power is going to have a name and a damage amount.  
-- Write out the sql to create the two schemas and some sample records.  What are the costs/benefits of the two approaches?  If you only see one way of doing this that's ok.  Please explain any potential problems with your approach.  What questions can this schema answer easily?  What questions can this schema not answer easily?

CREATE TABLE wizard(
id integer NOT NULL Primary Key AUTO_INCREMENT,
name TEXT, 
age INTEGER
) 

CREATE TABLE power(
id integer NOT NULL Primary Key AUTO_INCREMENT, 
name TEXT, 
damage INTEGER
wizard_id INTEGER  
)

SELECT wizard.name, power.name
FROM wizard
JOIN power
ON wizard.id = power.wizard_id
GROUP BY user.name

-- 12. Retrieve all the wizards with powers that have the letter "l" in them.

SELECT wizard.name, power.name
FROM wizard
JOIN power
ON wizard.id = power.wizard_id
WHERE power.name 
GROUP BY wizard.name

SELECT project.title, project.category, SUM(pledge.amount)
FROM project 
JOIN pledge
ON project.id = pledge.project_id 
WHERE project.category = 'books'
GROUP BY project.title 

 
-- 13. Retrieve all the wizards who have a combined damage of 10 or more.
SELECT wizard.name, power.name, SUM(power.damage)
FROM wizard
JOIN power
ON wizard.id = power.wizard_id
GROUP BY wizard.name
 
 
-- 14. Retrieve all the wizards sorted by their total damage.  Your returned data should look like so..
-- wizard_name, total_damage.

SELECT wizard.name, power.damage, SUM(power.damage_amount) as totalpower
FROM wizard
JOIN power
ON wizard.id = power.wizard_id
GROUP BY wizard.name
SORT BY totalpower

 
-- 15. Create a wizard that has no powers.

INSERT into wizards (name, age) 
VALUES ("Lucius Malfoy", 20)
 
-- 16. Retrieve all wizards that have no powers.

SELECT wizard.name, power.name
FROM wizard
JOIN power
ON wizard.id = power.wizard_id
WHERE power.name = nil 
GROUP BY wizard.name

-- 17. Create a data model for wizards for a world where wizards have many powers and multiple wizards can have the same power. Create some sample records.
 
-- 18. Retrieve the first wizard and any powers he/she has with damage greater than 5.
 
-- 19. What's the difference between an outer and inner join?
 
-- 20. If I just write JOIN, is that an inner or outer join?
 
-- 21. When would I want to use an outer join?