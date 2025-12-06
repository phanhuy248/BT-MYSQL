-- 1 Viết câu lệnh để lấy danh sách nhân viên và thông tin phòng ban của họ 
SELECT *
FROM `account`
INNER JOIN department
USING(department_id);
-- 2 Viết câu lệnh để lấy ra thông tin các account được tạo sau ngày 20/10/2010
SELECT *
FROM `account`
WHERE create_date > '2010-10-20';
-- 3 Viết lệnh để lấy ra tất cả các developer
SELECT *
FROM `account`
INNER JOIN `position`
USING(position_id)
WHERE position_name = 'Dev';
-- 4 Viết lệnh để lấy ra danh sách các phòng ban có >3 nhân viên
SELECT department_name,COUNT(department_id) SL
FROM `account`
INNER JOIN department
USING(department_id)
GROUP BY department_id
HAVING SL > 0;
-- 5 Viết lệnh để lấy ra danh sách câu hỏi được sử dụng trong đề thi nhiều nhất
SELECT question_id,COUNT(*) SL
FROM exam_question
GROUP BY question_id
HAVING SL = (SELECT max(SL) FROM (SELECT count(*) SL
FROM exam_question
GROUP BY question_id) TB);
-- 6 Thông kê mỗi category Question được sử dụng trong bao nhiêu Question
SELECT category_id,category_name,(category_id) SL
FROM category_question
INNER JOIN question
USING(category_id)
GROUP BY category_id;
-- 7 Thông kê mỗi Question được sử dụng trong bao nhiêu Exam
SELECT question_id,content,COUNT(question_id) SL
FROM exam_question
INNER JOIN question
USING(question_id)
GROUP BY question_id;
-- 8 Lấy ra Question có nhiều câu trả lời nhất
SELECT question_id,COUNT(*) SL
FROM answer
INNER JOIN question
USING(question_id)
GROUP BY question_id
HAVING SL = (SELECT max(SL) FROM (SELECT count(*) SL FROM answer GROUP BY question_id) TB);

-- 9 Thống kê số lượng account trong mỗi group
SELECT group_id,group_name,count(group_id) SL
FROM `group`
INNER JOIN group_account
USING(group_id)
GROUP BY group_id;
-- 10 Tìm chức vụ có ít người nhất 
SELECT position_id,position_name,count(account_id) SL
FROM `position`
LEFT JOIN `account`
USING(position_id)
GROUP BY position_id
HAVING SL = (SELECT min(SL) FROM (SELECT count(*) SL FROM `account` GROUP BY position_id) TB);
-- 11 Thống kê mỗi phòng ban có bao nhiêu Dev Test PM Scrum Master
SELECT department_id, department_name, position_id, COUNT(*) AS SL
FROM `account` 
JOIN department USING(department_id)
GROUP BY department_id, department_name, position_id;
-- 12 Lấy thông tin chi tiết của câu hỏi bao gồm: thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì, …
SELECT A.question_id,A.content QUESTION,category_id,category_name,type_id,type_name,A.creator_id,B.full_name,answer_id, C.content ANSWER
FROM question A
INNER JOIN `account` B
ON A.creator_id = B.account_id
INNER JOIN category_question
USING(category_id)
INNER JOIN type_question
USING(type_id)
INNER JOIN answer C
on A.question_id = C.question_id;
-- 13 Lấy ra số lượng câu hỏi của mỗi loại là tự luận hay trắc nghiệm
SELECT type_id,type_name,count(question_id)
FROM question
INNER JOIN type_question
USING(type_id)
GROUP BY type_id;
-- 14 Lấy ra các Group không có account nào
SELECT group_id,group_name,count(account_id) SL
FROM `group`
LEFT JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL = 0;
-- 15 Lấy ra group không có account nào
SELECT group_id,group_name,count(account_id) SL
FROM `group`
LEFT JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL = 0;
-- 16 Lấy ra question không có answer nào
SELECT A.question_id,A.content,count(answer_id) cau_tra_loi
FROM question A
LEFT JOIN answer B
ON A.question_id = B.question_id
GROUP BY question_id
HAVING cau_tra_loi = 0;
-- 2 UNiON
-- 17a Lấy ra account thuộc nhóm thứ 1
SELECT account_id,full_name
FROM `account`
INNER JOIN group_account
USING(account_id)
WHERE group_id = 1;
-- 17b Lấy ra account thuộc nhóm thứ 2
SELECT account_id,full_name
FROM `account`
INNER JOIN group_account
USING(account_id)
WHERE group_id = 2;
-- 17c Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT account_id,full_name
FROM `account`
INNER JOIN group_account
USING(account_id)
WHERE group_id = 1
UNION
SELECT account_id,full_name
FROM `account`
INNER JOIN group_account
USING(account_id)
WHERE group_id = 2;
-- 18a Lấy các group có lớn hơn 5 thành viên
SELECT group_id,group_name,count(account_id) SL
FROM `group`
INNER JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL > 5;
-- 18b Lấy các group có nhỏ hơn 7 thành viên
SELECT group_id,group_name,count(account_id) SL
FROM `group`
INNER JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL < 7;
-- 18c Ghép 2 kết quả từ câu a) và câu b).
SELECT group_id,group_name,count(account_id) SL
FROM `group`
INNER JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL > 5
UNION
SELECT group_id,group_name,count(account_id) SL
FROM `group`
INNER JOIN group_account
USING(group_id)
GROUP BY group_id
HAVING SL < 7;





