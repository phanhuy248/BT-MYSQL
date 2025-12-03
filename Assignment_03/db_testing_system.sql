drop database if exists testing_system;
create database testing_system;
use testing_system;

CREATE TABLE department (
    department_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) UNIQUE KEY NOT NULL
);

            
CREATE TABLE `position` (
    position_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name 		ENUM('Dev', 'Test', 'Scrum Mater', 'PM') UNIQUE KEY NOT NULL-- LIỆT KÊ
);


CREATE TABLE `account` (
    account_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email 				VARCHAR(30) UNIQUE KEY,
    user_name 			VARCHAR(20) UNIQUE KEY NOT NULL,
    full_name 			VARCHAR(30) NOT NULL,
    department_id 		TINYINT UNSIGNED,
    position_id 		TINYINT UNSIGNED,
    create_date 		DATE DEFAULT(now()),
    CONSTRAINT fk_account_department FOREIGN KEY (department_id)
        REFERENCES department (department_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_account_position FOREIGN KEY (position_id)
        REFERENCES `position` (position_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE `group` (
    group_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name 			VARCHAR(30) UNIQUE KEY NOT NULL,
    creator_id 			TINYINT UNSIGNED NOT NULL,
    create_date 		DATE DEFAULT(now()),
    CONSTRAINT fk_group_account FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE group_account (
    group_id 			TINYINT UNSIGNED NOT NULL,
    account_id 			TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (group_id , account_id),
    join_date 			DATE DEFAULT(now()),
    CONSTRAINT fk_group FOREIGN KEY (group_id)
        REFERENCES `group` (group_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_account FOREIGN KEY (account_id)
        REFERENCES `account` (account_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE type_question (
    type_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name 			ENUM('Essay', 'Multiple-Choice') UNIQUE KEY NOT NULL 
);


CREATE TABLE category_question (
    category_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name 		VARCHAR(10)UNIQUE KEY NOT NULL 
);
            
            
CREATE TABLE question (
    question_id 		TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 			TEXT NOT NULL,
    category_id 		TINYINT UNSIGNED NOT NULL,
    type_id 			TINYINT UNSIGNED NOT NULL,
    creator_id 			TINYINT UNSIGNED NOT NULL,
    create_date 		DATE DEFAULT(now()),
    CONSTRAINT fk_question_category FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_question_type FOREIGN KEY (type_id)
        REFERENCES type_question (type_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_question_creator FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE answer (
    answer_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content 			TEXT,
    question_id 		TINYINT UNSIGNED NOT NULL,
    is_correct 			BOOLEAN,
    CONSTRAINT fk_answer_question FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE exam (
    exam_id 			TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code_id 			TINYINT UNSIGNED UNIQUE KEY NOT NULL,
    title 				VARCHAR(50) NOT NULL,
    category_id 		TINYINT UNSIGNED NOT NULL,
    duration 			TINYINT UNSIGNED NOT NULL,
    creator_id 			TINYINT UNSIGNED NOT NULL,
    create_date 		DATE DEFAULT(now()),
    CONSTRAINT fk_exam_category FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_exam_creator FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE exam_question (
    exam_id 			TINYINT UNSIGNED NOT NULL,
    question_id 		TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (exam_id , question_id),
    CONSTRAINT fk_exam FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_exam_question FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON DELETE CASCADE ON UPDATE CASCADE
);
            

            


            
            
            

            


