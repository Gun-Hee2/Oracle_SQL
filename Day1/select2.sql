/*
   SELECT
   FROM
   WHERE   조건절 -> if
   
   비교연산자( >, <, >=, <=, =, !=, <>(!=와같다) )
   NULL, IS NULL, IS NOT NULL
   AND(&&), OR(||), (우선비교)
*/
-- 이름 -> Julia
SELECT first_name, last_name, salary 
FROM EMPLOYEES 
WHERE first_name = 'Julia';

-- 월급이 $9000 이상인 사원
SELECT first_name, salary
FROM EMPLOYEES 
WHERE salary >= 9000;

-- 이름이 shanta 보다 큰 이름
SELECT first_name
FROM EMPLOYEES
WHERE first_name >= 'Shanta';

-- 이름의 첫문자가 J보다 큰 이름
SELECT first_name
FROM employees
WHERE first_name > 'J';

-- 매니저가 없는 사원
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- &&(Java) = AND
-- 이름이 John, 월급이 5000이상인 사람
SELECT first_name, salary
FROM employees
WHERE first_name = 'John' 
    AND salary >= 5000;
    
-- || = OR
SELECT first_name, last_name
FROM employees
WHERE first_name = 'John'
    OR last_name = 'Vollman';
    

-- 2007년 12월 31일 이후에 입사한 사원을 출력
SELECT first_name, hire_date
FROM employees
WHERE hire_date > '07/12/31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231', 'YYYYMMDD');

/*
   ALL(=AND), ANY(=OR) WHERE절에서만 사용
   IN -> OR과 거의 같다, NOT IN
   BETWEEN
   LIKE

*/

SELECT first_name
FROM employees
WHERE first_name = ALL('Julia', 'John');
-- first_name = 'Julia' AND first_name = 'John'

SELECT first_name
FROM employees
WHERE first_name = ANY('Julia', 'John');
-- first_name = 'Julia' OR first_name = 'John'

SELECT first_name,salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);

SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200, 6000);

SELECT first_name, salary 
FROM employees
-- WHERE salary >= 3200 AND salary <= 9000;
WHERE salary BETWEEN 3200 AND 9000;

SELECT first_name, salary 
FROM employees
WHERE salary NOT BETWEEN 3200 AND 9000;

--LIKE
SELECT first_name 
FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _ 한글자

SELECT first_name 
FROM employees
WHERE first_name LIKE 'K%y';  -- % = 중간에 글자가 무엇이든 허용

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%06';

SELECT first_name
FROM employees
WHERE first_name LIKE '%h%';




