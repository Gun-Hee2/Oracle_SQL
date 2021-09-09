# Day1

## 테이블

테이블은 데이타베이스의 기본적인 데이타 저장 단위 이다.

데이타베이스 테이블은 사용자가 접근 가능한 모든 데이타를 보유하며 레코드와 컬럼으로 구성 된다.

컬럼(Column) : 테이블의 각 컬럼은 엔티티의 한 속성을 표현한다.

행(Row, 레코드) : 테이블의 데이터는 행에 저장된다.

* 테이블  생성

```sql
CREATE TABLE 테이블명(
    컬럼명1 자료형,
    컬럼명2 자료형,
    
);
```

* 대표적인 자료형

문자열 : **VARCHAR2**, CHAR, LONG
정수 : INTEGER, **NUMBER**
실수 : NUMBER
날짜 : **DATE**

->  VARCHAR2, NUMBER, DATE가 가장 흔하게 사용된다.

## 표준함수

```sql
-- DUAL TABLE : 가상 테이블 -> 실행 결과 확인 테이블
SELECT 1 FROM DUAL;
SELECT 'A' FROM DUAL;
SELECT 36 * 24 FROM DUAL;

-- 문자 함수
-- CHR( NUMBER ) : ASCII 값을 문자로 변환하는 함수 A == 65
SELECT CHR(65) FROM DUAL;
SELECT CHR(48) FROM DUAL;

-- CONCAT
SELECT CONCAT('HELLO', 'WOLRD') FROM DUAL;

SELECT '내 점수는 ' || CHR(65) || '입니다' FROM DUAL;
-- JAVA == "내 점수는" + "A" + "입니다"

-- LPAD(RPAD) : 총칸 수의 빈칸을 지정문자(빈문자)로 채우는 함수(지정문자가 없다면 빈문자로 채움)
SELECT LPAD('BBB', 10) FROM DUAL;
SELECT RPAD('BBB', 10) FROM DUAL;
SELECT LPAD('BBB', 10, '-') FROM DUAL;
SELECT LPAD('BBB', 10, '0') FROM DUAL;

-- INSTR == indexOf    "abcde"라고 문자열이 있을 때 indexOf('b') -> 1
SELECT INSTR('123ABC456DEFABC', 'A') FROM DUAL;
SELECT INSTR('123ABC456DEFABC', 'A', 6) FROM DUAL;
SELECT INSTR('123ABC456DEFABCABC', 'A', 6, 2) FROM DUAL;
SELECT INSTR('123ABC456DEFABC', 'X') FROM DUAL;

-- REPLACE : 문자열 치환
SELECT REPLACE('AAAAABCD', 'A') FROM DUAL;
SELECT REPLACE('AAAAABCD', 'A', 'a') FROM DUAL;
SELECT REPLACE('AAAAABCD', 'AA', 'a') FROM DUAL;

-- SUBSTR 시작위치 지정후 원하는 위치까지 출력 
SELECT SUBSTR('ABCDE', 3) FROM DUAL;     -- 3번지부터 끝가지
SELECT SUBSTR('ABCDE', 3, 2) FROM DUAL;  -- 3번지부터 2문자

-- 숫자
-- 올림
SELECT CEIL(13.1) FROM DUAL;

-- 내림
SELECT FLOOR(13.9) FROM DUAL;

-- 나눈 나머지
SELECT MOD(3, 2) FROM DUAL;

-- 승수 
SELECT POWER(3, 2) FROM DUAL;

-- 반올림
SELECT ROUND(13.5) FROM DUAL;

-- 부호 1 0 -1
SELECT SIGN(13.4) FROM DUAL;
SELECT SIGN(0) FROM DUAL;
SELECT SIGN(-0.1) FROM DUAL;

-- 버림(소수)
SELECT TRUNC(123.4567) FROM DUAL;
SELECT TRUNC(123.4567, 2) FROM DUAL;


-- 변환함수
-- TO_CHAR = DATE -> VARCHAR2
SELECT TO_CHAR(SYSDATE) FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD-HH-MI-SS') FROM DUAL;
SELECT TO_CHAR(SYSDATE, 'YYYY-MM-DD HH:MI:SS') FROM DUAL;

SELECT TO_CHAR(COL1, 'YYYY-MM-DD HH:MI:SS') FROM TB_DATE;

SELECT TO_CHAR(10000000, '$999,999,999') FROM DUAL;

-- TO_DATE = VARCHAR2 -> DATE
SELECT TO_DATE('20210909') FROM DUAL;
SELECT TO_DATE('20210909', 'YYYYMMDD') FROM DUAL;

-- TO_NUMBER  VARCHAR2 -> NUMBER
SELECT TO_NUMBER('12345') + 45 FROM DUAL;

-- LAST_DAY
SELECT LAST_DAY('21/09/09') FROM DUAL;
```

## SELECT문

```sql
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
```

## WHERE절

```sql
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
   WHERE절에서 사용
   ALL(=AND), ANY(=OR) 
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

SELECT first_name, salary 
FROM employees
WHERE salary BETWEEN 3200 AND 9000;
-- WHERE salary >= 3200 AND salary <= 9000;

SELECT first_name, salary 
FROM employees
WHERE salary NOT BETWEEN 3200 AND 9000;

-- LIKE
SELECT first_name 
FROM employees
WHERE first_name LIKE 'K%y';  -- % = 중간에 글자가 무엇이든 K로 시작하고 y로 끝나는 모든 문자를 찾는다

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06%'; -- 06으로 시작하는 모든 문자를 찾는다

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%06'; -- 06으로 끝나는 모든 문자를 찾는다

SELECT first_name
FROM employees
WHERE first_name LIKE '%h%'; -- -- 06이 포함되는 모든 문자를 찾는다
```





