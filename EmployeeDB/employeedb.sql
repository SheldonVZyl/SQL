CREATE TABLE employees (
    emp_id bigserial,
    first_name varchar(50),
    surname varchar(50),
    gender varchar(1),
    address varchar(100),
    email varchar(50),
    dept_id integer REFERENCES department (dept_id),
    role_id integer REFERENCES roles (role_id),
    salary_id integer REFERENCES salaries (salary_id),
    overtime_id integer REFERENCES overtime_hrs (overtime_id),
    CONSTRAINT emp_key PRIMARY KEY (emp_id)
);

INSERT INTO employees (first_name, surname, gender, address, email, dept_id, role_id, salary_id, overtime_id)
VALUES
('Yolanda', 'Cox', 'F', '10 Ash Str', 'yolandac22@gmail.com', 4, 4, 3, 1),
('Deborah', 'Adams', 'F', '22 Arrow Ave', 'debad@gmail.com', 3, 3, 2, 2),
('India', 'Adu', 'F', '100 Susan Lane', 'Adu.India@gmail.com', 2, 2, 1, 3),
('Michael', 'Knowles', 'M', '2 Batch Str', 'knowles67@gmail.com', 1, 1, 2, 4),
('Maxwell', 'Jones', 'M', '34 Putt Lane', 'Max-J@gmail.com', 1, 1, 1, 5),
('Michelle', 'Rowland', 'F', '78 Mayne Ave', 'michelle_Rowland@gmail.com', 2, 2, 3, 1),
('Joe', 'Moore', 'M', '4 Rosa Str', 'j.moore@gmail.com', 3, 3, 2, 5),
('Kendrick', 'Hudson', 'M', '0055 Bentley Park, Yes Ave', 'ken.hud@gmail.com', 4, 4, 1, 2),
('Cynthia', 'Bailey', 'M', '7 Pine Lane', 'CynB97@gmail.com', 4, 4, 2, 3),
('Morris', 'Arie', 'M', '99 Chestnut Grove', 'arie1976@gmail.com', 3, 3, 3, 4);

CREATE TABLE department (
    dept_id bigserial,
    dept_name varchar(25),
   dept_city varchar(20),
   CONSTRAINT dept_key PRIMARY KEY (dept_id) 
);

INSERT INTO departments (dept_name, dept_city)
VALUES
('Finance', 'Sharonlee'),
('Project Management', 'Bryanston'),
('Marketing', 'Douglasdale'),
('HR', 'Northwold');

CREATE TABLE roles (
    role_id bigserial,
    role varchar(25),
    CONSTRAINT role_key PRIMARY KEY (role_id)
);

INSERT INTO roles (role)
VALUES
('Accounting'),
('Projects'),
('Advertising'),
('Recruitment');

CREATE TABLE salaries (
    salary_id bigserial,
    salary_pa integer,
    CONSTRAINT salary_key PRIMARY KEY (salary_id)
);

INSERT INTO salaries (salary_pa)
VALUES
(250000),
(100000),
(350000);

CREATE TABLE overtime_hrs (
    overtime_id bigserial,
    overtime_hrs integer,
    CONSTRAINT overtime_key PRIMARY KEY (overtime_id)
);

INSERT INTO overtime_hrs (overtime_hrs)
VALUES
(0),
(5),
(7),
(10),
(12);


SELECT emp.first_name AS first_name
, emp.surname AS surname
, emp.address AS address
, emp.email AS email
, dep.dept_name AS dept_name
, rol.role AS roles
, sal.salary_pa AS salaries
, ovr.overtime_hrs AS overtime_hrs
FROM employees emp
LEFT JOIN department dep ON emp.dept_id = dep.dept_id
LEFT JOIN roles rol ON emp.role_id = rol.role_id
LEFT JOIN salaries sal ON emp.salary_id = sal.salary_id 
LEFT JOIN overtime_hrs ovr ON emp.overtime_id = ovr.overtime_id;
