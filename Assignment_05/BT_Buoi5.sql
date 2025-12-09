-- Câu 1 Tạo view có chứa danh sách nhân viên thuộc phòng ban sale
CREATE OR REPLACE VIEW v_employee_sale AS
SELECT *
FROM `account`
JOIN department 
USING(department_id)
WHERE department_name = 'Sale';
SELECT * FROM v_employee_sale;
-- Câu 2 Tạo view có chứa thông tin các account tham gia vào nhiều group nhất
CREATE OR REPLACE VIEW v_account_most_groups AS
SELECT account_id,full_name,COUNT(account_id) SL
FROM `account`
INNER JOIN group_account
USING(account_id)
GROUP BY account_id
HAVING SL = (SELECT max(SL) FROM (SELECT count(account_id) SL
FROM group_account
GROUP BY account_id) TB);
SELECT * from v_account_most_groups;
-- Câu 3 Tạo view có chứa câu hỏi có những content quá dài (content quá 300 từ được coi là quá dài) và xóa nó đi
CREATE OR REPLACE VIEW long_question AS
SELECT * FROM question WHERE char_length(content) > 300;
SELECT * FROM long_question;
-- Câu 4 Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất
CREATE OR REPLACE VIEW max_account_department AS
SELECT department_id,department_name,COUNT(department_id) SL
FROM `account`
INNER JOIN department
USING(department_id)
GROUP BY department_id
HAVING SL = (SELECT max(SL) FROM (SELECT count(department_id) SL
FROM `account`
GROUP BY department_id
) TB);
SELECT * FROM max_account_department;
-- Câu 5 Tạo view có chứa tất các các câu hỏi do user họ Nguyễn tạo.
CREATE OR REPLACE VIEW creator_question AS
SELECT A.question_id,A.content,B.account_id,B.full_name 
FROM question A
INNER JOIN `account` B
ON A.creator_id = B.account_id
WHERE B.full_name LIKE 'Nguyễn%';
SELECT * FROM creator_question;