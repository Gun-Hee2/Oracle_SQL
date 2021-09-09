/*
   형식:
       SELECT (값, 컬럼(항목)명, 함수, SUB QUERY)
       FROM (테이블명, SUB QUERY)
   
*/

SELECT * FROM EMPLOYEES;

SELECT * FROM TAB;

SELECT employee_id, first_name, salary FROM EMPLOYEES;

SELECT employee_id, first_name, salary * 12 FROM EMPLOYEES;

-- ALIAS
SELECT employee_id AS 사원번호, salary as 월급, salary * 12 "일년치 연봉" FROM EMPLOYEES;

-- XXX의 월급은 XXX입니다  "이름 + 월급"
SELECT first_name || '의 월급은 ' || salary || '입니다' AS "이름 + 월급" FROM EMPLOYEES;

-- distinct : 중복행을 삭제
SELECT DISTINCT department_id FROM EMPLOYEES;

-- 문제1) EMPLOYEES Table의 모든 자료를 출력하여라.
SELECT * FROM EMPLOYEES;

-- 문제2) EMPLOYEES Table의 컬럼들을 모두 출력하라.
DESC EMPLOYEES;
SELECT * FROM COLS WHERE TABLE_NAME = 'EMPLOYEES';

-- 문제3) EMPLOYEES Table에서 사원 번호, 이름, 급여, 담당업무를 출력하여라.
SELECT employee_id, first_name, salary, job_id FROM EMPLOYEES;

-- 문제4) 모든 종업원의 급여를 $300증가 시키기 위해서 덧셈 연산자를 사용하고 결과에 SALARY+300을 디스플레이 합니다.
SELECT first_name, salary, salary + 300 FROM EMPLOYEES;

-- 문제5) EMP 테이블에서 사원번호, 이름, 급여, 보너스, 보너스 금액을 출력하여라. 
-- (참고로 보너스는 월급 + (월급*커미션))
SELECT employee_id, first_name, salary, salary + NVL(salary * commission_pct, 0) AS BONUS FROM EMPLOYEES;
/*
   NVL(컬럼, 컬럼의 값이 null이면 설정되는 값)
*/

-- 문제6) EMPLOYEES 테이블에서 LAST_NAME을 이름으로 SALARY을 급여로 출력하여라.
SELECT last_name AS "이름", salary AS "급여" FROM EMPLOYEES;

-- 문제7) EMPLOYEES 테이블에서 LAST_NAME을 Name으로 SALARY * 12를 Annual Salary(연봉)로 출력하여라
SELECT last_name AS "Name", salary * 12 AS "Annual Salary" FROM EMPLOYEES;

-- 문제8) EMPLOYEES 테이블에서 이름과 업무를 연결하여 출력하여라. 
SELECT first_name || ' ' || job_id FROM EMPLOYEES;

-- 문제9) EMPLOYEES 테이블에서 이름과 업무를 “KING is a PRESIDENT” 형식으로 출력하여라. 
SELECT first_name || ' is a ' || job_id FROM EMPLOYEES;

-- 문제10) EMPLOYEES 테이블에서 이름과 연봉을 “KING: 1 Year salary = 60000” 형식으로 출력하여라. 
SELECT first_name || ': 1 Year salary = ' || salary * 12 FROM EMPLOYEES;

-- 문제11) EMPLOYEES 테이블에서 JOB을 모두 출력하라.
SELECT job_id FROM EMPLOYEES;






