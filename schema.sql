-- Run this script in MySQL Workbench or the MySQL command-line client.
CREATE DATABASE IF NOT EXISTS student_management
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

USE student_management;

CREATE TABLE IF NOT EXISTS students (
    id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
    full_name VARCHAR(120) NOT NULL,
    email VARCHAR(160) NOT NULL,
    phone VARCHAR(25) NULL,
    course VARCHAR(100) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (id),
    UNIQUE KEY uq_students_email (email),
    KEY idx_students_name (full_name),
    KEY idx_students_course (course)
) ENGINE=InnoDB;

-- Optional sample rows (remove the comments to insert them).
-- INSERT INTO students (full_name, email, phone, course) VALUES
-- ('Aarav Kumar', 'aarav@example.com', '9876543210', 'Computer Science'),
-- ('Diya Sharma', 'diya@example.com', '9123456780', 'Information Science');
