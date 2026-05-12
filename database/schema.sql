CREATE TABLE faculties (
    fac_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL,
    phone VARCHAR(15),
    dept VARCHAR(20),
    password VARCHAR(10) NOT NULL,
    avail_start TIME DEFAULT '10:15:00',
	avail_end TIME DEFAULT '16:30:00'
);
CREATE TABLE Subjects (
    sub_id INT AUTO_INCREMENT PRIMARY KEY,
    sub_code VARCHAR(10),
    sub_name VARCHAR(50) NOT NULL,
    sub_abbr VARCHAR(50) NOT NULL,
    subject_type ENUM('Lab', 'Theory'),
    faculty_id INT,
    sem VARCHAR(2) NOT NULL,
    dept_id INT NOT NULL,
    frequency INT DEFAULT NULL,
    FOREIGN KEY (faculty_id) REFERENCES faculties(fac_id),
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);
CREATE TABLE Departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(30) UNIQUE NOT NULL,
    HOD_name VARCHAR(50) NOT NULL
);

CREATE TABLE classes_name (
    class_id INT AUTO_INCREMENT PRIMARY KEY,
    class_name VARCHAR(30),
    sem VARCHAR(2),
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id)
);

CREATE TABLE timetable (
    timetable_id INT AUTO_INCREMENT PRIMARY KEY,
    class_id INT NOT NULL,
    day VARCHAR(20) NOT NULL,
    lecture_name VARCHAR(100),
    slot_start_time TIME NOT NULL,
    slot_end_time TIME NOT NULL,
    faculty_id INT NOT NULL,
    semester_type VARCHAR(10),
    INDEX idx_class_day (class_id, day),
    INDEX idx_faculty (faculty_id),
    FOREIGN KEY (faculty_id) REFERENCES faculties(fac_id),
    FOREIGN KEY (class_id) REFERENCES classes_name(class_id)
);
