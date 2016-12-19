-- Your sql code in this file
-- NOTE: Please, don't add sentence to create database in this script file.
--       You can create database locally to test it.
--       Consider add ';' at end sentence.

-- DDL

CREATE TABLE employee_department (
    id serial PRIMARY KEY,
    name text,
    description text
);

CREATE TABLE employee (
    id serial PRIMARY KEY,
    first_name text,
    last_name text,
    department_fk integer REFERENCES employee_department (id)
);

CREATE TABLE employee_hobby (
);

-- Data
INSERT INTO employee_department (name, description) VALUES
    ('Engeneering', 'Products development'),
    ('Research', 'Products evaluation and design'),
    ('QA', 'Products quality assurance'),
    ('Administration', 'Enterprise Resource Administration'),
    ('Legal', 'Lawyers'),
    ('Marketing', 'Market studying and approach');

INSERT INTO employee (first_name, last_name, department_fk)
    SELECT E.first_name, E.last_name, D.id FROM
    (VALUES
        ('Employee0', 'Cero', 'Engeneering'),
        ('Employee1', 'Uno', 'Engeneering'),
        ('Employee2', 'Dos', 'Research'),
        ('Employee3', 'Tres', 'Administration')
    ) E (first_name, last_name, department)
    INNER JOIN
    employee_department D
    ON E.department = D.name;


