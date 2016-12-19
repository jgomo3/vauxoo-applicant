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
    department_fk integer REFERENCES employee_department (id),
    boss_fk integer REFERENCES employee (id)
);

CREATE TABLE employee_hobby (
    id serial PRIMARY KEY,
    name text,
    description text
);

CREATE TABLE employee_employee_hobby (
    employee_fk integer REFERENCES employee (id),
    hobby_fk integer REFERENCES employee_hobby (id),
    CONSTRAINT employee_employee_hobby_pk PRIMARY KEY (employee_fk, hobby_fk)
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

INSERT INTO employee_hobby (name, description) VALUES
    ('Go', 'Ancient board game'),
    ('Futbol', 'The foot and ball sport with an actual foot kicking a ball'),
    ('Painting', 'One of the many arts');

INSERT INTO employee_employee_hobby (employee_fk, hobby_fk)
    SELECT EI.id, HI.id FROM
    (VALUES
        ('Employee0', 'Cero', 'Go'),
        ('Employee0', 'Cero', 'Futbol'),
        ('Employee1', 'Uno', 'Painting'),
        ('Employee1', 'Uno', 'Futbol'),
        ('Employee2', 'Dos', 'Painting'),
        ('Employee2', 'Dos', 'Go'),
        ('Employee3', 'Tres', 'Futbol'),
        ('Employee3', 'Tres', 'Go')
    ) ET (first_name, last_name, hobby)
    INNER JOIN
    employee EI
    ON ET.first_name = EI.first_name AND ET.last_name = EI.last_name
    INNER JOIN
    employee_hobby HI
    ON ET.hobby = HI.name;

UPDATE employee EE SET boss_fk = B.id
FROM
    (VALUES
        ('Employee0', 'Cero', 'Employee0', 'Cero'), -- Cero has no boss \m/
        ('Employee1', 'Uno', 'Employee0', 'Cero'),
        ('Employee2', 'Dos', 'Employee1', 'Uno'),
        ('Employee3', 'Tres', 'Employee1', 'Uno')
    ) ET (employee_first_name, employee_last_name, boss_first_name, boss_last_name)
    INNER JOIN
    employee E
    ON ET.employee_first_name = E.first_name AND ET.employee_last_name = E.last_name
    INNER JOIN
    employee B
    ON ET.boss_first_name = B.first_name AND ET.boss_last_name = B.last_name
WHERE EE.id = E.id;
