CREATE DATABASE university_db;
USE university_db;

CREATE TABLE department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL
);

INSERT INTO department (department_name)
VALUES
('Computer Science'),
('Mathematics'),
('Physics');

CREATE TABLE student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

INSERT INTO student (student_name, email, department_id)
VALUES
('Adnan', 'adnan@gmail.com', 1),
('Ahmed', 'ahmed@gmail.com', 1),
('Sara', 'sara@gmail.com', 2);


CREATE TABLE teacher (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    teacher_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    department_id INT,

    FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

INSERT INTO teacher (teacher_name, email, department_id)
VALUES
('Ali Khan', 'ali@gmail.com', 1),
('Usman Ahmed', 'usman@gmail.com', 2);


CREATE TABLE course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    teacher_id INT,
    department_id INT,

    FOREIGN KEY (teacher_id)
        REFERENCES teacher(teacher_id),

    FOREIGN KEY (department_id)
        REFERENCES department(department_id)
);

INSERT INTO course (course_name, teacher_id, department_id)
VALUES
('Database Systems', 1, 1),
('Python Programming', 1, 1),
('Calculus', 2, 2);

CREATE TABLE enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    course_id INT,
    enrollment_date DATE,
    grade VARCHAR(5),

    FOREIGN KEY (student_id)
        REFERENCES student(student_id),

    FOREIGN KEY (course_id)
        REFERENCES course(course_id)
);

INSERT INTO enrollment
(student_id, course_id, enrollment_date, grade)
VALUES
(1, 1, '2026-08-20', 'A'),
(1, 2, '2026-08-20', 'B'),
(2, 1, '2026-08-20', 'A'),
(3, 3, '2026-08-20', 'A');

select * from teacher