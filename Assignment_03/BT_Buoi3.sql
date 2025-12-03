-- 2 lấy ra tất cả các phòng ban
SELECT * FROM department;

-- 3 lấy ra id của phòng ban "Sale"
SELECT department_id FROM department WHERE department_name = 'Sale';

-- 4 lấy ra thông tin account có tên dài nhất
SELECT *
FROM `account`
WHERE
    CHAR_LENGTH(full_name) = (SELECT 
            MAX(CHAR_LENGTH(full_name))
FROM `account`);

-- 5 Lấy ra thông tin của account có full name dài nhất và thuộc phòng ban có id = 3
SELECT *
FROM `account`
WHERE
char_length(full_name) = (SELECT MAX(char_length(full_name)) FROM `account` WHERE department_id = 3) AND department_id = 3;

-- 6 : Lấy ra tên group đã tham gia trước ngày 20/12/2019
SELECT group_name FROM `group` WHERE create_date < '2019-12-20';

-- 7  Lấy ra id của các question có >=4 câu trả lời
SELECT question_id, COUNT(question_id) so_luong
FROM answer
GROUP BY(question_id)
HAVING so_luong >= 4;

-- 8 Lấy ra các mã đề thi có thời gian thi >= 60 và được tạo trước ngày 20/12/2022
SELECT code_id FROM exam WHERE duration >= 60 AND create_date < '2022-12-20';

-- 9 Lấy ra 5 group được tạo gần nhất 
SELECT *
FROM `group`
ORDER BY create_date DESC LIMIT 5;

-- 10 Đếm số nhân viên thuộc phòng ban có id = 2
SELECT department_id,COUNT(*) SO_LUONG FROM `account` WHERE department_id = 2; 

-- 11 lấy ra tên nhân viên bắt đầu bằng chữ "D" và kết thúc bằng chữ "o";
SELECT * FROM `account` WHERE SUBSTRING_INDEX(full_name," ",-1) LIKE 'D%o';

-- 12 Xóa tất cả các exam được tạo trước ngày 20/12/2019
DELETE
FROM `exam`
WHERE create_date < '2019-12-20';

-- 13 Xóa tất cả các question có nội dung bắt đầu từ "câu hỏi"
DELETE
FROM question
WHERE content LIKE 'câu hỏi%';

-- 14 update thông tin account có id = 5 thành tên "Nguyễn Bá Lộc" và email thành loc.nguyenba@vti.com.vn
UPDATE `account`
SET full_name = 'Nguyễn Bá Lộc', email = 'loc.nguyenba@vti.com.vn'
WHERE account_id = 5;

--  15 upadte account có id = 5 sẽ thuộc group  có id = 4
UPDATE group_account
SET account_id = 5
WHERE group_id = 4;








