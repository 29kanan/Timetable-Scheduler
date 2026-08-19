
-- ----------------------------
-- Table structure for admin
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



----------------------------
-- Table structure for login_teacher
-- ----------------------------
DROP TABLE IF EXISTS `login_teacher`;
CREATE TABLE `login_teacher` (
  `fac_id` int(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(100) NOT NULL,
  `username` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `avail_start` time DEFAULT '10:15:00',
  `avail_end` time DEFAULT '16:30:00',
  PRIMARY KEY (`fac_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for departments
-- ----------------------------
DROP TABLE IF EXISTS `departments`;
CREATE TABLE `departments` (
  `dept_id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_name` varchar(50) NOT NULL,
  `HOD_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for subjects
-- ----------------------------
DROP TABLE IF EXISTS `subjects`;
CREATE TABLE `subjects` (
  `sub_id` int(11) NOT NULL AUTO_INCREMENT,
  `sub_name` varchar(100) NOT NULL,
  `sub_code` varchar(10) NOT NULL,
  `sub_abbr` varchar(50) DEFAULT NULL,
  `subject_type` varchar(10) DEFAULT NULL,
  `sem` varchar(10) NOT NULL,
  `dept_id` int(10) NOT NULL,
  `faculty_id` int(11) DEFAULT NULL,
  `frequency` int(10) NOT NULL,
  PRIMARY KEY (`sub_id`,`sub_code`),
    FOREIGN KEY (`faculty_id`) REFERENCES `login_teacher`(`fac_id`),
    FOREIGN KEY (`dept_id`) REFERENCES `departments`(`dept_id`)
)ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for classes_name
-- ----------------------------
DROP TABLE IF EXISTS `classes_name`;
CREATE TABLE `classes_name` (
  `class_id` int(11) NOT NULL AUTO_INCREMENT,
  `class_name` varchar(30) NOT NULL,
  `sem` varchar(10) DEFAULT NULL,
  `dept_id` int(11) NOT NULL,
  PRIMARY KEY (`class_id`),
  KEY `dept_id` (`dept_id`),
  CONSTRAINT `classes_name_ibfk_1` FOREIGN KEY (`dept_id`) REFERENCES `departments` (`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;


-- ----------------------------
-- Table structure for rooms
-- ----------------------------
DROP TABLE IF EXISTS `rooms`;
CREATE TABLE `rooms` (
  `room_id` int(11) NOT NULL AUTO_INCREMENT,
  `room_name` varchar(50) DEFAULT NULL,
  `room_num` int(11) NOT NULL,
  PRIMARY KEY (`room_id`,`room_num`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for fac_msg
-- ----------------------------
DROP TABLE IF EXISTS `fac_msg`;
CREATE TABLE `fac_msg` (
  `id` mediumint(10) NOT NULL AUTO_INCREMENT,
  `email` varchar(50) NOT NULL,
  `msg` varchar(100) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for notifications
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `message` varchar(200) DEFAULT NULL,
  `target_role` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;



-- ----------------------------
-- Table structure for register teacher
-- ----------------------------
DROP TABLE IF EXISTS `regteacher`;
CREATE TABLE `regteacher` (
  `faculty_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `dept` varchar(100) DEFAULT NULL,
  `password` varchar(100) NOT NULL,
  `avail_start` time DEFAULT '10:15:00',
  `avail_end` time DEFAULT '16:30:00',
  PRIMARY KEY (`faculty_id`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for rejected_teacher
-- ----------------------------
DROP TABLE IF EXISTS `rejected_teacher`;
CREATE TABLE `rejected_teacher` (
  `faculty_id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `dept` varchar(50) DEFAULT NULL,
  `password` varchar(50) NOT NULL,
  `avail_start` time DEFAULT '10:15:00',
  `avail_end` time DEFAULT '16:30:00',
  PRIMARY KEY (`faculty_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- ----------------------------
-- Table structure for auto_timetable
-- ----------------------------
DROP TABLE IF EXISTS `timetable`;
CREATE TABLE `timetable` (
    `timetable_id` INT AUTO_INCREMENT PRIMARY KEY,
    `class_id` INT NOT NULL,
    `day` VARCHAR(20) NOT NULL,
    `lecture_name` VARCHAR(100),
    `slot_start_time` TIME NOT NULL,
    `slot_end_time` TIME NOT NULL,
    `faculty_id` INT NOT NULL,
    `semester_type` VARCHAR(10),
    INDEX `idx_class_day` (`class_id`, `day`),
    INDEX `idx_faculty` (`faculty_id`),
    FOREIGN KEY (`faculty_id`) REFERENCES `login_teacher`(`fac_id`),
    FOREIGN KEY (`class_id`) REFERENCES `classes_name`(`class_id`)
);

-- ----------------------------
-- Table structure for time_table
-- ----------------------------
DROP TABLE IF EXISTS `time_table`;
CREATE TABLE `time_table` (
  `tt_id` int(11) NOT NULL AUTO_INCREMENT,
  `sem` varchar(20) NOT NULL,
  `day` varchar(20) NOT NULL,
  `time_slot` varchar(20) NOT NULL,
  `sub_abbr` varchar(50) DEFAULT NULL,
  `fac_id` int(11) DEFAULT NULL,
  `room_id` int(11) DEFAULT NULL,
  `dept_id` int(11) DEFAULT NULL,
  `year` varchar(11) NOT NULL,
  PRIMARY KEY (`tt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

DROP TABLE IF EXISTS `final_timetable`;
CREATE TABLE final_timetable (
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
    FOREIGN KEY (faculty_id) REFERENCES login_teacher(fac_id),
    FOREIGN KEY (class_id) REFERENCES classes_name(class_id)
);
DROP TABLE IF EXISTS `timetable_status`;
CREATE TABLE timetable_status (
  id INT PRIMARY KEY DEFAULT 1,
  is_finalized BOOLEAN DEFAULT FALSE
);
INSERT INTO timetable_status VALUES (1, FALSE);
