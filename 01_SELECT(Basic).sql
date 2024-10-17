-- 1. 학과 이름과 계열 표시

SELECT * FROM TB_DEPARTMENT; -- 학과

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT;

---------------------------------------------------------------------------


-- 2. 학과의 학과 정원 출력

SELECT * FROM TB_DEPARTMENT; -- 학과

SELECT DEPARTMENT_NAME,'의 정원은', CAPACITY, '명 입니다.'
FROM TB_DEPARTMENT;

----------------------------------------------------------------------------


-- 3. 
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_STUDENT;


-- 국어국문학과 번호조회
SELECT DEPARTMENT_NO, DEPARTMENT_NAME 
FROM TB_DEPARTMENT
WHERE DEPARTMENT_NAME = '국어국문학과'; -- 학과번호 : 001

-- 휴학중인 여학생 조회
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE ABSENCE_YN = 'Y'
AND SUBSTR(STUDENT_SSN ,8,1) = '2';
-- 주민등록번호의 8번째 위치에서 1글자(즉, 뒷자리 첫 번째 숫자)를 추출
-- 여자니까 '2'

SELECT STUDENT_NAME
FROM TB_DEPARTMENT
JOIN TB_STUDENT USING(DEPARTMENT_NO)
WHERE ABSENCE_YN = 'Y'
AND SUBSTR(STUDENT_SSN ,8,1) = '2' 
AND DEPARTMENT_NAME = '국어국문학과'; -- 결과 : 한수현

-------------------------------------------------------------------------------

-- 4. 
SELECT * FROM TB_STUDENT;

-- 학생들의 학번 조회
SELECT STUDENT_NAME
FROM TB_STUDENT
WHERE STUDENT_NO IN('A513079', 'A513090', 'A513091', 'A513110', 'A513119')
ORDER BY STUDENT_NAME DESC; -- DESC : 내림차순 정렬

---------------------------------------------------------------------------------

-- 5. 

SELECT * FROM TB_DEPARTMENT;

SELECT DEPARTMENT_NAME, CATEGORY
FROM TB_DEPARTMENT
WHERE CAPACITY >= 20
AND CAPACITY  <= 30; 

---------------------------------------------------------------------------------
SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_GRADE;

------------------------------------------------------------------------

-- 6. 

SELECT PROFESSOR_NAME
FROM TB_PROFESSOR
WHERE DEPARTMENT_NO IS NULL;


-------------------------------------------------------------------------

-- 7.
SELECT DEPARTMENT_NO, DEPARTMENT_NAME, STUDENT_NAME
FROM TB_STUDENT
JOIN TB_DEPARTMENT USING (DEPARTMENT_NO)
WHERE DEPARTMENT_NAME IS NULL; -- 학과가 지정되어 있지 않은 학생이 없음


----------------------------------------------------------------------------------

-- 8.
SELECT CLASS_NO
FROM TB_CLASS
WHERE PREATTENDING_CLASS_NO IS NOT NULL;

----------------------------------------------------------------------------------

-- 9.
SELECT DISTINCT CATEGORY -- DISTINCT : 조회 시 컬럼에 포함된 중복값을 한번만 표기
FROM TB_DEPARTMENT;

----------------------------------------------------------------------------------

SELECT * FROM TB_PROFESSOR;
SELECT * FROM TB_DEPARTMENT;
SELECT * FROM TB_CLASS;
SELECT * FROM TB_CLASS_PROFESSOR;
SELECT * FROM TB_STUDENT;
SELECT * FROM TB_GRADE;

-- 10.
SELECT STUDENT_NO, STUDENT_NAME, STUDENT_SSN
FROM TB_STUDENT
WHERE
EXTRACT(YEAR FROM ENTRANCE_DATE) = 2002 ---- EXTRACT (YEAR FROM 컬럼명) : 년도만 추출
AND STUDENT_ADDRESS LIKE '전주%'
AND ABSENCE_YN = 'N';

















