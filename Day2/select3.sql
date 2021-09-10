/*
    ORDER BY == Sorting
    
    SELECT COLUMN VALUE SUBQUERY
    FROM TABLE SUBQUERY
    WHERE 
   
    ORDER BY COLUMN (ASC/DESC)   
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
ORDER BY ANNSAL DESC;

SELECT first_name, NVL(commission_pct, 0)
FROM employees
ORDER BY commission_pct ASC NULLS FIRST;  -- LAST

/*
    GROUP BY : 그룹으로 묶는 기능
    HAVING : 묶었을 때 조건    
*/
SELECT job_id
FROM employees
GROUP BY job_id;

/*
    통계 - GROUP FUNCTION
    COUNT
    SUM
    AVG
    MAX
    MIN
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
SELECT job_id, SUM(salary)    -- 5
FROM employees                -- 1
WHERE salary >= 5000          -- 2
GROUP BY job_id               -- 3
HAVING SUM(salary) > 20000    -- 4
ORDER BY SUM(salary);         -- 6







