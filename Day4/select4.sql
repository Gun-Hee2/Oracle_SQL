-- 특수 쿼리
-- CASE == switch
SELECT employee_id, first_name, phone_number, CASE SUBSTR(phone_number, 1, 3)
WHEN '515' THEN '서울' 
WHEN '590' THEN '부산' 
WHEN '650' THEN '광주'
ELSE '기타'
END AS "지역"
FROM EMPLOYEES;

SELECT employee_id, first_name, phone_number,
CASE
WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'
WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
WHEN SUBSTR(phone_number, 1, 3) = '650' THEN '광주'
ELSE '기타'
END AS "지역"
FROM EMPLOYEES;

-- DECODE
SELECT employee_id, first_name, phone_number,
DECODE(SUBSTR(phone_number, 1, 3), 
'515', '서울',
'590', '부산',
'650', '광주',
'기타') AS "지역"
FROM EMPLOYEES;

-- 집합
/*
   합집합 : UNION - FULL OUTER JOIN
   교집합 : INTERSECT - INNER JOIN
   차집합 : MINUS
*/

-- UNION
SELECT job_id
FROM employees
WHERE job_id IN('AD_VP', 'FI_ACCOUNT')
UNION ALL
SELECT job_id
FROM jobs
WHERE job_id IN('AD_VP', 'FI_ACCOUNT');

-- INTERSECT
SELECT employee_id
FROM employees
INTERSECT
SELECT manager_id
FROM employees;

-- INNER JOIN
SELECT DISTINCT b.employee_id
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- MINUS
SELECT employee_id
FROM employees
MINUS
SELECT manager_id
FROM employees;

-- OVER() 함수
-- SELECT절에서만 사용
-- GROUP BY를 보강하기 위해 나온 함수
SELECT department_id, COUNT(*) -- 에러
FROM employees;

SELECT department_id, COUNT(*) 
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*)OVER()
FROM employees;

SELECT first_name, department_id, COUNT(DISTINCT department_id)OVER()
FROM employees;

-- PARTITION BY == SELECT절 안의 GROUP BY
SELECT department_name, COUNT(*)OVER(PARTITION BY department_id)
FROM departments;

SELECT department_id, first_name, salary, job_id,
COUNT(*)OVER(PARTITION BY department_id),
SUM(salary)OVER(PARTITION BY job_id)
FROM employees;

-- COUNT(*)OVER() : 전체 행을 반환
-- COUNT(*)OVER(PARTITION BY 컬럼) : 컬럼을 그룹으로 나누어 ROW의 수를 반환

-- 분석 함수
/*
   순위 함수
   RANK()       1 2 3 3 5 6 -> 3등과 4등이 값이 같으면 3으로 둘다 3으로 표시하고 4등은 표시 안하고 넘어간다.
   DENSE_RANK() 1 2 3 3 4 5 
   ROW_NUMBER() 1 2 3 4 5 6 -> OVER()함수를 같이 써야한다.
   ROWNUM       1 2 3 4 5 6
*/
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 100 AND employee_id <= 109;

SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;

SELECT ROWNUM, employee_id, first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS "RANK",
    DENSE_RANK()OVER(ORDER BY salary  DESC) AS "DENSE_RANK",
    ROW_NUMBER()OVER(ORDER BY salary  DESC) AS "ROW_NUMBER"
FROM employees;

SELECT ROWNUM, employee_id, first_name, salary
FROM employees
WHERE ROWNUM > 10 AND ROWNUM <= 20;

-- ROWNUM
-- 1. 순위(정렬을 먼저 해줘야 한다)
-- 2. 번호를 지정해줘야 한다.
-- 3. 범위를 지정해줘야 한다.

SELECT RNUM, employee_id, first_name, salary
FROM
(SELECT ROWNUM AS "RNUM", employee_id, first_name, salary  -- 2. 번호를 지정
FROM(  
       SELECT employee_id, first_name, salary    -- 1. 순위
       FROM employees
       ORDER BY salary DESC  )
    )
WHERE RNUM >= 1 AND RNUM <= 10;   -- 3. 범위를 지정

/*
SELECT절
    SELECT 컬럼, 표준함수, 그룹함수, 서브쿼리, OVER() PARTITION BY
    FROM 테이블, 서브쿼리
    [WHERE] 조건 IN AND OR NULL(IS NULL) ALL ANY LIKE > < >= <= != <> 서브쿼리
    [GROUP BY] 컬럼
    [HAVING] 그룹핑에 대한 조건
    [ORDER BY] 컬럼 ASC, DESC
    
JOIN
    INNER
    FULL OUTER
    CROSS
    OUTER(LEFT/RIGHT)
    SELF
*/


