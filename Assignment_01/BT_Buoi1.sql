drop database if exists testing_system;
create database testing_system;
use testing_system;

CREATE TABLE department (
    department_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    department_name VARCHAR(50) NOT NULL
);

CREATE TABLE `position` (
    position_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    position_name ENUM('Dev', 'Test', 'Scrum Mater', 'PM') NOT NULL
);

CREATE TABLE `account` (
    account_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(30) NOT NULL,
    user_name VARCHAR(20) NOT NULL,
    full_name VARCHAR(30) NOT NULL,
    department_id TINYINT UNSIGNED NOT NULL,
    position_id TINYINT UNSIGNED NOT NULL,
    create_date DATE,
    CONSTRAINT fk_account_department FOREIGN KEY (department_id)
        REFERENCES department (department_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_account_position FOREIGN KEY (position_id)
        REFERENCES `position` (position_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE `group` (
    group_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    group_name VARCHAR(30) NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATE,
    CONSTRAINT fk_group_account FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE group_account (
    group_id TINYINT UNSIGNED NOT NULL,
    account_id TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (group_id , account_id),
    join_date DATE,
    CONSTRAINT fk_group FOREIGN KEY (group_id)
        REFERENCES `group` (group_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_account FOREIGN KEY (account_id)
        REFERENCES `account` (account_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE type_question (
    type_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    type_name ENUM('Essay', 'Multiple-Choice') NOT NULL
);

CREATE TABLE category_question (
    category_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(10) NOT NULL
);

CREATE TABLE question (
    question_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    category_id TINYINT UNSIGNED NOT NULL,
    type_id TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATE,
    CONSTRAINT fk_question_category FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_question_type FOREIGN KEY (type_id)
        REFERENCES type_question (type_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_question_creator FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE answer (
    answer_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    content TEXT NOT NULL,
    question_id TINYINT UNSIGNED NOT NULL,
    is_correct BOOLEAN,
    CONSTRAINT fk_answer_question FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE exam (
    exam_id TINYINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    code_id TINYINT UNSIGNED NOT NULL,
    title VARCHAR(50) NOT NULL,
    category_id TINYINT UNSIGNED NOT NULL,
    duration TINYINT UNSIGNED NOT NULL,
    creator_id TINYINT UNSIGNED NOT NULL,
    create_date DATE,
    CONSTRAINT fk_exam_category FOREIGN KEY (category_id)
        REFERENCES category_question (category_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_exam_creator FOREIGN KEY (creator_id)
        REFERENCES `account` (account_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

CREATE TABLE exam_question (
    exam_id TINYINT UNSIGNED NOT NULL,
    question_id TINYINT UNSIGNED NOT NULL,
    PRIMARY KEY (exam_id , question_id),
    CONSTRAINT fk_exam FOREIGN KEY (exam_id)
        REFERENCES exam (exam_id)
        ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT fk_exam_question FOREIGN KEY (question_id)
        REFERENCES question (question_id)
        ON DELETE RESTRICT ON UPDATE CASCADE
);

INSERT INTO department(department_name)
	VALUES
			('Marketing'),
            ('Sale'),
            ('Bảo vệ'),
            ('Nhân sự'),
            ('Kỹ thuật'),
            ('Tài chính'),
            ('Phó giám đốc'),
            ('Giám đốc'),
            ('Thư ký');
            
INSERT INTO `position`(position_name)
	VALUES
			('Dev'),
            ('Test'),
            ('PM'),
            ('Scrum Mater'),
            ('Test'),
            ('Dev'),
            ('PM'),
            ('Test'),
            ('Scrum Mater');
            
INSERT INTO `account`(email,user_name,full_name,department_id,position_id,create_date)
	VALUES
			('huy@gmail.com','huy123','Phan Quang Huy',1,1,'2025-11-27'),
            ('hung@gmail.com','hung123','Nguyễn Văn Hùng',2,2,'2025-11-25'),
            ('tuan@gmail.com','tuan124','Lê Văn Tuấn',3,3,'2025-10-27'),
            ('ha@gmail.com','ha123','Trần Thị Hà',4,4,'2025-09-27'),
            ('nghia@gmail.com','nghia123','Nguyễn Văn Nghĩa',5,5,'2024-11-27');
            
INSERT INTO `group`(group_name,creator_id,create_date)
	VALUES
			('NHóm 1',1,'2025-12-08'),
            ('NHóm 2',2,'2025-11-08'),
            ('NHóm 3',3,'2025-10-08'),
            ('NHóm 4',4,'2025-09-08'),
            ('NHóm 5',5,'2025-12-01');
            
INSERT INTO group_account(group_id,account_id,join_date)
	VALUES
			(1,1,'2025-12-12'),
            (2,2,'2025-11-12'),
            (3,3,'2025-10-12'),
            (4,4,'2025-09-12'),
            (5,5,'2025-12-05');
            
INSERT INTO type_question(type_name)
	VALUES
			('Essay'),
            ('Multiple-Choice'),
            ('Essay'),
            ('Multiple-Choice'),
            ('Multiple-Choice');
            
INSERT INTO category_question(category_name)
	VALUES
			('Java'),
            ('NET'),
            ('SQL'),
            ('Postman'),
            ('Ruby');
            
INSERT INTO question(content,category_id,type_id,creator_id,create_date)
	VALUES
			('Kiến thức về Java',1,1,1,'2025-12-12'),
            ('Kiến thức về NET',2,2,2,'2025-11-12'),
            ('Kiến thức về SQL',3,3,3,'2025-10-12'),
            ('Kiến thức về Postman',4,4,4,'2025-09-12'),
            ('Kiến thức về Ruby',5,5,5,'2025-12-09');
            
INSERT INTO answer(content,question_id,is_correct)
	VALUES
			('Java là ngôn ngữ lp hướng đối tượng',1,1),
            ('NET là một ngôn ngữ lập trình',2,0),
            ('SQL là ngôn ngữ truy vấn có cấu trúc',3,1),
            ('Postman là một giao diện giao tiếp với API',4,1),
            ('Ruby là một ngôn ngữ lập trình',5,1);
            
INSERT INTO exam(code_id,title,category_id,duration,creator_id,create_date)
	VALUES
			(111,'Giữa kỳ',1,45,1,'2025-12-12'),
			(001,'Cuối kỳ',1,60,2,'2025-11-12'),
            (003,'Giữa kỳ',1,45,3,'2025-10-12'),
            (004,'Cuối kỳ',1,60,4,'2025-09-12'),
            (005,'Giữa kỳ',1,45,5,'2025-12-15');
            
INSERT INTO exam_question(exam_id,question_id)
	VALUES
			(1,1),
            (2,2),
            (3,3),
            (4,4),
            (5,5);
            


            
            
            

            


