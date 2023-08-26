SELECT 
    first_name, last_name
FROM
    employees;
SELECT 
    *
FROM
    employees;
    
SELECT 
    dept_no
FROM
    departments;

SELECT 
    *
FROM
    departments;
    
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
ORDER BY emp_no ASC;

SELECT * FROM employees
WHERE first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis' AND gender = 'M';


-- AND-- Conditions set on different columns--

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie' AND gender = 'F';

-- OR Conditions set on the same column--

  SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Denis'
        OR first_name = 'Elvis';

SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Kellie'
        OR first_name = 'Aruna';

-- Operator Precedance logical order--first AND then OR--

SELECT 
    *
FROM
    employees
WHERE
    last_name = 'Denis' AND (gender = 'M'
        OR gender = 'F');
        
SELECT 
    *
FROM
    employees
WHERE
    gender = 'F'
        AND (first_name = 'Kellie'
        OR first_name = 'Aruna');

-- IN-NOT IN--
-- way 1--
SELECT 
    *
FROM
    employees
WHERE
    first_name = 'Cathie'
        OR (first_name = 'Mark'
        OR first_name = 'Nathan');

-- way 2--

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('Cathie' , 'Mark', 'Nathan');

SELECT 
    *
FROM
    employees
WHERE
    first_name IN ('Denis' , 'Elvis');
    
    
    SELECT 
    *
FROM
    employees
WHERE
    first_name NOT IN ('John' , 'Mark', 'Jacob');
    
    
-- like/not like--

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar%');

-- % - a substitute for a sequence of characters--

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar');
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('%ar%');
    
-- _(underscore) helps you match a single character--

SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mar_');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Mar%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name LIKE ('Mark%');

SELECT 
    *
FROM
    employees
WHERE
    hire_date LIKE ('%2000%');
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no LIKE ('1000_');
    
-- wildcard characters--'%','_','*'--

SELECT 
    *
FROM
    employees
WHERE
    first_name  LIKE ('%Jack%');
    
SELECT 
    *
FROM
    employees
WHERE
    first_name NOT LIKE ('%Jack%');


-- between -and--

SELECT * FROM salaries;

SELECT 
    *
FROM
    Salaries
WHERE
    salary BETWEEN 66000 AND 70000;
    
SELECT 
    *
FROM
    employees
WHERE
    emp_no NOT BETWEEN 10004 AND 10012;

SELECT 
    *
FROM
    departments
WHERE
    dept_no BETWEEN 'd003' AND 'd006';
    
-- other comparison operators >, >=, <, <=, <>,!=...

SELECT 
    *
FROM
    employees
WHERE
    hire_date >= '2000-01-01' AND gender = 'F';
    
SELECT 
    *
FROM
    salaries
WHERE
    salary > 150000;
    
-- select distinct

SELECT DISTINCT
    gender
FROM
    employees;
    
SELECT DISTINCT
    hire_date
FROM
    employees;
    
-- aggregate functions

-- count()
SELECT 
    COUNT(emp_no)
FROM
    employees;

SELECT 
    COUNT(first_name)
FROM
    employees;
    
SELECT 
    COUNT(DISTINCT first_name)
FROM
    employees;

SELECT 
    COUNT(salary)
FROM
    salaries
WHERE
    salary >= 100000;
    
SELECT 
    COUNT(*)
FROM
    dept_manager;
    
-- order by

SELECT 
    *
FROM
    employees
ORDER BY first_name DESC;

SELECT 
    *
FROM
    employees
ORDER BY first_name , last_name ASC;

SELECT 
    *
FROM
    employees
ORDER BY hire_date DESC;

-- group by

SELECT 
    first_name
FROM
    employees
GROUP BY first_name;

select distinct first_name
from employees;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name;

SELECT 
    first_name, COUNT(first_name)
FROM
    employees
GROUP BY first_name
ORDER BY first_name;

use employees;
-- Having
 
SELECT 
    emp_no, AVG(salary)
FROM
    salaries
GROUP BY emp_no
HAVING AVG(salary) > 120000
ORDER BY emp_no;

SELECT 
    first_name, COUNT(first_name) AS name_count
FROM
    employees
WHERE
    hire_date > '1999-01-01'
GROUP BY first_name
HAVING COUNT(first_name) < 200
ORDER BY first_name DESC;

SELECT 
    emp_no
FROM
    dept_emp
WHERE
    from_date > '2000-01-01'
GROUP BY emp_no
HAVING COUNT(from_date) > 1
ORDER BY emp_no
LIMIT 10;

select * from dept_emp;

select * from salaries
where salary > 160000
order by salary DESC
limit 10;

SELECT 
    *
FROM
    dept_emp
LIMIT 100;

-- insert into

select * from employees
limit 10;

-- inset into --> new table

CREATE TABLE department_dup (
    dep_no CHAR(40) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

drop table department_dup;

CREATE TABLE department_dup (
    dept_no CHAR(40) NOT NULL,
    dept_name VARCHAR(40) NOT NULL
);

insert into department_dup(dept_no,dept_name)
select * from departments;

SELECT 
    *
FROM
    department_dup;

insert into department_dup
 values ('d010','Business Analysis');

select * from department_dup
order by dept_no; 


-- rollback and commit
-- update statement

commit;

UPDATE department_dup 
SET 
    dept_no = 'd011',
    dept_name = 'Quality Control';
    
select * from department_dup;
rollback;
select * from department_dup;

commit;
     
UPDATE departments 
SET 
    dept_name = 'Data Analysis'
WHERE
    dept_no = 'd010';


select * from departments;

-- delete statement

CREATE TABLE Area (
    patient_id VARCHAR(255) PRIMARY KEY,
    streetNo INT NOT NULL,
    city VARCHAR(40),
    pincode INT NOT NULL
);


delete from Area;
describe Area;
drop table Area;

-- drop, truncate,delete


-- round()

SELECT 
    ROUND(AVG(salary), 2)
FROM
    salaries;
    

-- if null/coalesce()

alter table department_dup
change column dept_name dept_name varchar(40);

alter table department_dup
change column dept_name dept_name varchar(40) null;

SELECT 
    *
FROM
    department_dup
ORDER BY dept_no;

insert into department_dup (dept_no) values ('d011'),('d012');


delete from department_dup
where dept_no = 'd011' and dept_no = 'd012';

select * from department_dup
order by dept_no;

alter table employees.department_dup
add column dept_manager varchar(255) null after dept_name;

select * from department_dup
order by dept_no;

commit;

SELECT 
    dept_no,
    IFNULL(dept_name,
            'Department name not provided') as dept_name
FROM
    department_dup;
    
    
-- coalesce()


SELECT 
    dept_no,
    COALESCE(dept_name,
            'Department name not provided') as dept_name
FROM
    department_dup;
    

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_manager, dept_name, 'N/A') AS dept_manager
FROM
    department_dup;

SELECT 
    dept_no,
    dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    department_dup
ORDER BY dept_no;


SELECT 
    IFNULL(dept_no, 'N/A') as dept_no,
    IFNULL(dept_name,
            'Department name not Provided') AS dept_name,
    COALESCE(dept_no, dept_name) AS dept_info
FROM
    department_dup
ORDER BY dept_no;
   