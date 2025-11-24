-- SQL Sample demonstrating all token types and syntax

-- Single line comment
/* Multi-line
   comment */

-- DDL (Data Definition Language)

-- Create database
CREATE DATABASE IF NOT EXISTS my_database;
USE my_database;

-- Create table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(50) NOT NULL UNIQUE,
    email VARCHAR(100) NOT NULL,
    age INT CHECK (age >= 0),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    is_active BOOLEAN DEFAULT TRUE,
    salary DECIMAL(10, 2),
    profile_data JSON,
    CONSTRAINT uk_email UNIQUE (email),
    INDEX idx_username (username)
);

-- Create table with foreign key
CREATE TABLE posts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    title VARCHAR(255) NOT NULL,
    content LONGTEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

-- Create view
CREATE VIEW active_users AS
SELECT id, username, email FROM users WHERE is_active = TRUE;

-- Create index
CREATE INDEX idx_posts_user_id ON posts(user_id);

-- Create stored procedure
CREATE PROCEDURE get_user_posts(IN user_id INT)
BEGIN
    SELECT * FROM posts WHERE posts.user_id = user_id;
END;

-- Create trigger
CREATE TRIGGER update_user_timestamp
BEFORE UPDATE ON users
FOR EACH ROW
BEGIN
    SET NEW.created_at = NOW();
END;

-- DML (Data Manipulation Language)

-- Insert single row
INSERT INTO users (username, email, age, salary)
VALUES ('john_doe', 'john@example.com', 30, 50000.00);

-- Insert multiple rows
INSERT INTO users (username, email, age) VALUES
('jane_smith', 'jane@example.com', 28),
('bob_wilson', 'bob@example.com', 35),
('alice_brown', 'alice@example.com', 32);

-- Insert with SELECT
INSERT INTO users (username, email, age)
SELECT CONCAT('user_', id), CONCAT('user', id, '@example.com'), 25
FROM users LIMIT 5;

-- Select statements

-- Basic SELECT
SELECT id, username, email FROM users;

-- SELECT with WHERE
SELECT * FROM users WHERE age > 30 AND is_active = TRUE;

-- SELECT with comparison operators
SELECT * FROM users
WHERE salary >= 50000
AND age BETWEEN 25 AND 40
AND username LIKE 'john%'
AND email IN ('john@example.com', 'jane@example.com');

-- SELECT with IS NULL
SELECT * FROM users WHERE salary IS NULL;
SELECT * FROM users WHERE salary IS NOT NULL;

-- SELECT with ORDER BY
SELECT * FROM users ORDER BY age DESC, username ASC;

-- SELECT with GROUP BY
SELECT age, COUNT(*) as user_count, AVG(salary) as avg_salary
FROM users
GROUP BY age
HAVING COUNT(*) > 1
ORDER BY user_count DESC;

-- SELECT with JOIN
SELECT u.id, u.username, p.title, p.created_at
FROM users u
INNER JOIN posts p ON u.id = p.user_id;

SELECT u.username, COUNT(p.id) as post_count
FROM users u
LEFT JOIN posts p ON u.id = p.user_id
GROUP BY u.id, u.username;

-- SELECT with subquery
SELECT * FROM users
WHERE id IN (SELECT DISTINCT user_id FROM posts);

SELECT u.username,
       (SELECT COUNT(*) FROM posts WHERE user_id = u.id) as post_count
FROM users u;

-- SELECT with UNION
SELECT username as name, 'user' as type FROM users
UNION
SELECT title, 'post' FROM posts;

-- SELECT with window functions
SELECT username, age, salary,
       ROW_NUMBER() OVER (PARTITION BY age ORDER BY salary DESC) as rank,
       AVG(salary) OVER (PARTITION BY age) as age_avg_salary,
       LAG(salary) OVER (ORDER BY salary) as prev_salary,
       LEAD(salary) OVER (ORDER BY salary) as next_salary
FROM users;

-- SELECT with CTE (Common Table Expression)
WITH user_stats AS (
    SELECT user_id, COUNT(*) as post_count
    FROM posts
    GROUP BY user_id
)
SELECT u.username, us.post_count
FROM users u
JOIN user_stats us ON u.id = us.user_id;

-- SELECT with DISTINCT
SELECT DISTINCT age FROM users;

-- SELECT with LIMIT/OFFSET
SELECT * FROM users LIMIT 10 OFFSET 20;

-- Update statements
UPDATE users SET is_active = FALSE WHERE age > 65;

UPDATE users
SET salary = salary * 1.1, modified_at = NOW()
WHERE age >= 30 AND is_active = TRUE;

-- Delete statements
DELETE FROM users WHERE id = 1;

DELETE FROM users WHERE age < 18 AND is_active = FALSE;

-- Transactions
START TRANSACTION;
INSERT INTO users (username, email) VALUES ('new_user', 'new@example.com');
UPDATE users SET salary = 60000 WHERE username = 'new_user';
COMMIT;

BEGIN;
DELETE FROM posts WHERE user_id = 1;
ROLLBACK;

-- Numeric literals
SELECT 123, 123.45, 1.5e2, 0xFF, 0b1010;

-- String literals
SELECT 'single quoted string';
SELECT "double quoted string";
SELECT 'string with ''escaped quotes''';

-- Functions
SELECT
    -- String functions
    UPPER(username) as upper_username,
    LOWER(email) as lower_email,
    LENGTH(username) as username_length,
    SUBSTRING(email, 1, 5) as email_prefix,
    CONCAT(username, '@example.com') as full_email,
    REPLACE(email, 'example.com', 'newdomain.com') as new_email,
    TRIM(username) as trimmed_username,
    
    -- Math functions
    ABS(age - 30) as age_diff,
    ROUND(salary, 2) as rounded_salary,
    CEIL(salary / 1000) as salary_thousands_ceil,
    FLOOR(salary / 1000) as salary_thousands_floor,
    
    -- Date functions
    NOW() as current_datetime,
    CURDATE() as current_date,
    YEAR(created_at) as year_created,
    MONTH(created_at) as month_created,
    DATE_FORMAT(created_at, '%Y-%m-%d') as formatted_date,
    DATEDIFF(NOW(), created_at) as days_since_creation,
    
    -- Conditional functions
    CASE WHEN age < 25 THEN 'Young' WHEN age < 35 THEN 'Adult' ELSE 'Senior' END as age_group,
    IF(is_active = 1, 'Active', 'Inactive') as status,
    COALESCE(salary, 0) as salary_with_default,
    
    -- Aggregate functions
    COUNT(*) as total_count,
    SUM(salary) as total_salary,
    AVG(salary) as average_salary,
    MIN(salary) as min_salary,
    MAX(salary) as max_salary,
    GROUP_CONCAT(username) as all_usernames

FROM users;

-- ALTER statements
ALTER TABLE users ADD COLUMN phone_number VARCHAR(20);
ALTER TABLE users MODIFY COLUMN email VARCHAR(150);
ALTER TABLE users DROP COLUMN phone_number;
ALTER TABLE users RENAME TO user_accounts;

-- DROP statements
DROP TABLE IF EXISTS posts;
DROP DATABASE IF EXISTS test_db;
DROP INDEX idx_username ON users;

-- Keywords
SELECT * FROM users WHERE username = 'john' OR email LIKE '%@example.com%';
SELECT DISTINCT * FROM users UNION ALL SELECT * FROM user_backup;
