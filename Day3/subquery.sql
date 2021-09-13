-- sub query
/*
   Query안의 Query
   
   SELECT 단일 ROW 단일 CULUMN (산출되는 데이터는 무조건 한개, 컬럼도 한개)
   FROM   다중 ROW 다중 CULUMN
   WHERE  다중 ROW 다중 CULUMN
*/

-- SELECT
SELECT employee_id, first_name, 
    (SELECT first_name
     FROM employees
     WHERE employee_id = 100)
FROM employees;

SELECT employee_id, 
      (SELECT SUM(salary) FROM employees),
      (SELECT TRUNC(AVG(salary)) FROM employees)
FROM employees;

-- FROM
SELECT first_name, salary
FROM (SELECT employee_id, first_name, salary 
        FROM employees
        WHERE department_id = 100)
WHERE salary > 8000;

-- 업무별로 급여의 합계, 인원수, 사원명, 월급
/* -> 오류
SELECT job_id, SUM(salary), COUNT(*), first_name
FROM employees
GROUP BY job_id;
*/

SELECT e.employee_id, e.salary, e.job_id, j."급여의 합계", j."인원 수"
FROM employees e, (SELECT job_id, SUM(salary) AS "급여의 합계", COUNT(*) AS "인원 수" 
                   FROM employees 
                   GROUP BY job_id) j
WHERE e.job_id = j.job_id;                   

-- WHERE
-- 평균 급여보다 많이 받는 사원
SELECT first_name, salary
FROM employees
WHERE salary > (SELECT AVG(salary)FROM employees);

-- department_id = 90인 사원의 업무
SELECT job_id, first_name, department_id
FROM employees
WHERE job_id IN(SELECT job_id FROM employees WHERE department_id = 90);

-- 부서별로 가장 급여를 적게 받는 사원과 같은 급여를 받는 사원
SELECT first_name, salary, department_id
FROM employees
WHERE salary IN(SELECT MIN(salary) FROM employees GROUP BY department_id);

-- 부서별로 가장 급여를 적게 받는 사원의 이름, 급여, 부서번호
SELECT department_id, salary, first_name
FROM employees
WHERE (department_id, salary) IN(SELECT department_id, MAX(salary) FROM employees GROUP BY department_id)
ORDER BY department_id ASC;





