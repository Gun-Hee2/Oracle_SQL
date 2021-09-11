# DAY2

## ORDER BY절

```sql
/*
    ORDER BY == Sorting
    
    SELECT COLUMN VALUE SUBQUERY
    FROM TABLE SUBQUERY
    WHERE 
    ORDER BY COLUMN (ASC/DESC);   
*/

SELECT first_name, hire_date
FROM EMPLOYEES
ORDER BY hire_date ASC; -- ORDER BY절에서 ASC는 생략을 해도 자동으로 오름차순 정렬이 된다.

SELECT first_name, salary
FROM employees
ORDER BY salary DESC;

-- ALIAS
SELECT employee_id, first_name, salary * 12 AS "ANNSAL"
FROM employees
ORDER BY ANNSAL DESC; -- AS로 지정해준 문자열로 ORDER절에 대입할 수 있다. 

SELECT first_name, NVL(commission_pct, 0)
FROM employees
ORDER BY commission_pct ASC NULLS FIRST;  -- 오름차순으로 정렬했을 때 맨 밑에 위치하는 NULL값을 처음순서로 바꿔준다.
```

## GROUP BY & HAVING절

```sql
/*
    GROUP BY : 그룹으로 묶는 기능
    HAVING : 묶었을 때 조건    
*/

/* ex)
SELECT job_id
FROM employees
GROUP BY job_id;
*/

/*
    GROUP FUNCTION - 통계
    COUNT - 개수
    SUM - 합계
    AVG - 평균
    MAX - 최대
    MIN - 최소
*/

SELECT COUNT(salary), COUNT(*), SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employees
WHERE job_id = 'IT_PROG';

SELECT job_id, COUNT(*), SUM(salary), AVG(salary), MAX(salary), MIN(salary)
FROM employees
GROUP BY job_id
ORDER BY COUNT(*) DESC;


SELECT department_id, SUM(salary)
FROM employees
GROUP BY department_id
HAVING SUM(salary) >= 50000;

-- 급여가 5000이상 받는 사원만으로 합계를 내서 업무(JOB_ID)로 그룹화하여
-- 급여의 합계가 20000을 초과하는 업무명을 구하라.
SELECT job_id, SUM(salary)    -- 5(순서)
FROM employees                -- 1
WHERE salary >= 5000          -- 2
GROUP BY job_id               -- 3
HAVING SUM(salary) > 20000    -- 4
ORDER BY SUM(salary);         -- 6
```

