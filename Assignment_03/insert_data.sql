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
            ('Thư ký'),
            ('Chủ tịch');
            
INSERT INTO `position`(position_name)
	VALUES
			('Dev'),
            ('Test'),
            ('PM'),
            ('Scrum Mater');
            
INSERT INTO `account`(email,user_name,full_name,department_id,position_id,create_date)
	VALUES
			('huy@gmail.com','huy123','Phan Quang Huy',1,1,'2025-11-27'),
            ('hung@gmail.com','hung123','Nguyễn Văn Hùng',2,2,'2025-11-25'),
            ('tuan@gmail.com','tuan124','Lê Văn Tuấn',3,3,'2025-10-27'),
            ('ha@gmail.com','ha123','Trần Thị Hà',4,4,'2025-09-27'),
            ('nghia@gmail.com','nghia123','Nguyễn Văn Nghĩa',5,4,'2024-11-27'),
            ('ngoc@gmail.com','ngoc123','Nguyễn Thị Ngọc',6,3,'2024-08-27'),
            ('hong@gmail.com','hong123','Nguyễn Văn Hồng',7,2,'2024-06-27'),
            ('sapatv@gmail.com','sapa123','Nguyễn Văn Sa',8,1,'2024-11-25'),
            ('loc@gmail.com','loc123','Nguyễn Văn Lộc',9,4,'2027-11-27'),
            ('nhan@gmail.com','nhan123','Nguyễn Văn Nhân',10,3,'2022-11-27');
            
INSERT INTO `group`(group_name,creator_id,create_date)
	VALUES
			('NHóm 1',1,'2025-12-08'),
            ('NHóm 2',2,'2025-11-08'),
            ('NHóm 3',3,'2025-10-08'),
            ('NHóm 4',4,'2025-09-08'),
            ('NHóm 5',5,'2025-07-08'),
            ('NHóm 6',6,'2025-06-08'),
            ('NHóm 7',7,'2025-05-08'),
            ('NHóm 8',8,'2025-04-08'),
            ('NHóm 9',9,'2025-03-08'),
            ('NHóm 10',10,'2025-12-01');
            
INSERT INTO group_account(group_id,account_id,join_date)
	VALUES
			(1,1,'2025-12-12'),
            (2,2,'2025-11-12'),
            (3,3,'2025-10-12'),
            (4,4,'2025-09-12'),
            (5,5,'2025-12-05'),
            (6,6,'2025-12-05'),
            (7,7,'2025-12-05'),
            (8,8,'2025-12-05'),
            (9,9,'2025-12-05'),
            (10,10,'2025-12-05');

INSERT INTO type_question(type_name)
	VALUES
			('Essay'),
            ('Multiple-Choice');
            
INSERT INTO category_question(category_name)
	VALUES
			('Java'),
            ('NET'),
            ('SQL'),
            ('Postman'),
            ('Ruby'),
            ('Python'),
            ('C#'),
            ('Golang'),
            ('PHP'),
            ('C++');
            
INSERT INTO question(content,category_id,type_id,creator_id,create_date)
	VALUES
			('Kiến thức về Java',1,1,1,'2025-12-12'),
            ('Kiến thức về NET',2,2,2,'2025-11-12'),
            ('Kiến thức về SQL',3,1,3,'2025-10-12'),
            ('Kiến thức về Postman',4,2,4,'2025-09-12'),
            ('Kiến thức về Ruby',5,1,5,'2025-12-09'),
            ('Kiến thức về Python',5,1,5,'2025-12-09'),
            ('Kiến thức về C#',5,1,5,'2025-12-09'),
            ('Kiến thức về Golang',5,1,5,'2025-12-09'),
            ('Kiến thức về PHP',5,1,5,'2025-12-09'),
            ('Kiến thức về C++',5,1,5,'2025-12-09');
            
INSERT INTO answer(content,question_id,is_correct)
	VALUES
			('Java là ngôn ngữ lp hướng đối tượng',1,1),
            ('NET là một ngôn ngữ lập trình',2,0),
            ('SQL là ngôn ngữ truy vấn có cấu trúc',3,1),
            ('Postman là một giao diện giao tiếp với API',4,1),
            ('Ruby là một ngôn ngữ lập trình',5,1),
            ('Câu trả lời 6',5,1),
            ('Câu trả lời 7',5,1),
            ('Câu trả lời 8',5,1),
            ('Câu trả lời 9',5,1),
            ('Câu trả lời 10',5,1);
            
INSERT INTO exam(code_id,title,category_id,duration,creator_id,create_date)
	VALUES
			(111,'Giữa kỳ',1,45,1,'2025-12-12'),
			(001,'Cuối kỳ',1,60,2,'2025-11-12'),
            (003,'Giữa kỳ',1,45,3,'2025-10-12'),
            (004,'Cuối kỳ',1,60,4,'2025-09-12'),
            (005,'Giữa kỳ',1,60,4,'2025-08-12'),
            (006,'Giữa kỳ',1,60,4,'2025-07-12'),
            (007,'Cuối kỳ',1,60,4,'2025-06-12'),
            (008,'Giữa kỳ',1,60,4,'2025-05-12'),
            (009,'Cuối kỳ',1,60,4,'2025-04-12'),
            (010,'Giữa kỳ',1,45,5,'2025-12-15');
            
INSERT INTO exam_question(exam_id,question_id)
	VALUES
			(1,1),
            (2,2),
            (3,3),
            (4,4),
            (5,5),
            (6,6),
            (7,7),
            (8,8),
            (9,9),
            (10,10);