-- 12
DELETE FROM EMP WHERE USER_NO = 'A100';

-- 13
DELETE FROM STUDENT WHERE GRADE > 4;

-- 14
DELETE FROM MEMBER WHERE EMAIL IS NULL;

-- 15 BETWEEN A AND B
DELETE FROM CUSTOMER WHERE YEAR BETWEEN 2010 AND 2015;

-- 16
DELETE FROM PRODUCT WHERE '상품명' LIKE '테스트%';

-- 17
DELETE FROM 계좌 WHERE 잔고 IS NOT NULL;

-- 18
DELETE FROM 학생 WHERE 학과 != '컴퓨터공학';
DELETE FROM 학생 WHERE 학과 <> '컴퓨터공학';

-- 19
SELECT 학번, 점수 FROM 성적 WHERE 점수 >= 70 AND 점수 <= 80; 

-- 20
SELECT 학번, 이름 FROM 학생 WHERE 이름 LIKE '김%';

-- 21
SELECT FROM 학번, 학생명 FROM 학적 WHERE 전화번호 IS NOT NULL;

-- 22
SELECT DISTINCT 학과 FROM 학생;

-- 23
SELECT 이름, 나이 FROM 사원정보 ORDER BY 나이 DESC;

-- 34
SELECT SNO, SNAME FROM STUDENT WHERE YEAR = 4;

-- 35
ㄱ: ORDER BY ㄴ: DESC ㄷ: ASC

-- 37 김_ 한글자만 허용
SELECT 회원 FROM 회원 WHERE 나이 BETWEEN 20 AND 30 AND 이름 LIKE '김_';

-- 38
도서명 LIKE '%액세스%'

-- 40
가: 130 나: 3

-- 41 NULL 은 COUNT 안함
1: 3 / 2:  3 / 3: 2

-- 42
1: 5 / 2: 3 / 3: 2