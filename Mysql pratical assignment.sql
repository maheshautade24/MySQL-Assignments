create database assignment;
use assignment;

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    department_id INT,
    age INT,
    salary DECIMAL(10, 2),
    birthdate DATE
);


INSERT INTO Employees (employee_id, name, department_id, age, salary, birthdate)
VALUES
(1, 'John Doe', 101, 30, 60000, '1994-05-15'),
(2, 'Jane Smith', 102, 28, 50000, '1996-09-10'),
(3, 'Alice Johnson', 101, 35, 75000, '1988-03-25'),
(4, 'Bob Brown', 103, 40, 85000, '1983-01-05');


CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(100)
);


INSERT INTO Departments (department_id, department_name)
VALUES
(101, 'Sales'),
(102, 'Marketing'),
(103, 'HR');


CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    age INT
);


INSERT INTO Customers (customer_id, name, email, age)
VALUES
(1, 'Eve White', 'eve@example.com', 32),
(2, 'Charlie Green', 'charlie@example.com', 25),
(3, 'David Black', 'david@example.com', 38),
(4, 'Grace Blue', 'grace@example.com', 29);


CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE
);


INSERT INTO Users (user_id, username)
VALUES
(1, 'john_doe'),
(2, 'jane_smith'),
(3, 'alice_johnson'),
(4, 'bob_brown');


CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);


INSERT INTO Orders (order_id, customer_id)
VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4);


/* Question-1
 Write a query to select all records from the "Employees" table.
*/
SELECT * FROM Employees;

/* Question-2 
How do you select distinct values from a column?*/

SELECT DISTINCT column_name FROM table_name;

/*Question-3
 Write a query to retrieve the first 10 rows from the "Customers" table.*/

SELECT * FROM Customers LIMIT 10;

/*Question-4 
 Write a query to fetch records where the age is greater than 25.*/

SELECT * FROM table_name WHERE age > 25;

/*Question-5 
 How do you sort records in descending order?*/

SELECT * FROM table_name ORDER BY column_name DESC;

/*Question-6 
Write a query to perform an INNER JOIN between two tables: Employees and Departments on department_id.*/

SELECT Employees.*, Departments.* 
FROM Employees 
INNER JOIN Departments 
ON Employees.department_id = Departments.department_id;

/*Question-7 
 Write a query to count the number of employees.*/

SELECT COUNT(*) AS employee_count FROM Employees;

/*Question-8 
Write a query to find the total salary for each department.*/

SELECT department_id, SUM(salary) AS total_salary 
FROM Employees 
GROUP BY department_id;

/*Question-9 
 Write a query to display departments having a total salary greater than 50000.*/

SELECT department_id, SUM(salary) AS total_salary 
FROM Employees 
GROUP BY department_id 
HAVING total_salary > 50000;

/*Question-10 
 How do you find the maximum value in a column? */

SELECT MAX(column_name) AS max_value FROM table_name;

/*Question-11
 Write a query to find the employee with the highest salary.*/

SELECT * FROM Employees 
WHERE salary = (SELECT MAX(salary) FROM Employees);

/*Question-12
 Write a query to calculate the average salary of employees.*/

SELECT AVG(salary) AS average_salary FROM Employees;

/*Question-13
 Write a query using a subquery to find employees whose salary is higher than the average salary.*/

SELECT * FROM Employees 
WHERE salary > (SELECT AVG(salary) FROM Employees);

/*Question-14
Write a query to combine results from two tables, table1 and table2, using UNION.*/

SELECT column_name FROM table1
UNION
SELECT column_name FROM table2;

/*Question-15
Write a query to display "High Salary" if salary is greater than 50000, else display "Low Salary".*/

SELECT employee_id, 
       CASE 
           WHEN salary > 50000 THEN 'High Salary'
           ELSE 'Low Salary'
       END AS salary_category 
FROM Employees;

/*Question-16
 Write a query to add a NOT NULL constraint to the "email" column in the "Customers" table.*/

ALTER TABLE Customers 
MODIFY email VARCHAR(255) NOT NULL;

/*Question-17
 Write a query to add a UNIQUE constraint to the "username" column in the "Users" table.*/

ALTER TABLE Users 
ADD CONSTRAINT unique_username UNIQUE (username);

/*Question-18
 Write an SQL query to create a table with a primary key.*/

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10, 2)
);

/*Question-19
Write an SQL query to create a table with a foreign key.*/

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

/*Question-20
 How do you update multiple rows with a single query?*/

UPDATE Employees 
SET department_id = 3 
WHERE job_title = 'Manager';

/*Question-21
 How do you insert data into a table?*/

INSERT INTO Employees (employee_id, name, salary) 
VALUES (1, 'John Doe', 50000);

/*Question-22
Write an SQL query using ALL to find employees whose salary is greater than all employees in a different department.*/

SELECT * FROM Employees 
WHERE salary > ALL (SELECT salary FROM Employees WHERE department_id = 2);

/*Question-23
 Write an SQL query using ANY to find employees whose salary is greater than any employee in a different department.*/

SELECT * FROM Employees 
WHERE salary > ANY (SELECT salary FROM Employees WHERE department_id = 2);

/*Question-24
 Write an SQL query to find all employees whose names contain the letter 'e'.*/

SELECT * FROM Employees 
WHERE name LIKE '%e%';

/*Question-25
 Write an SQL query to find all customers whose email address contains the domain 'example.com'.*/

SELECT * FROM Customers 
WHERE email LIKE '%@example.com';

/*Question-26
 Write an SQL query to find all employees with a salary between 50000 and 80000.*/

SELECT * FROM Employees 
WHERE salary BETWEEN 50000 AND 80000;

/*Question-27
 Write an SQL query to drop a column named birthdate from a table called employees.*/

ALTER TABLE Employees 
DROP COLUMN birthdate;

/*Question-28
 Write an SQL query to rename a table called employees to staff.*/

RENAME TABLE Employees TO Staff;