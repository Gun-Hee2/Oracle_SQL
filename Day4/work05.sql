-- 문제1) EMPLOYEES 테이블에서 (Kochhar(last_name)의 급여)보다 많은 사원의 정보를 사원번호,이름,담당업무,급여를 출력하라.
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE salary > (SELECT salary 
                FROM employees 
                WHERE last_name = 'Kochhar');
     
-- 문제2) EMPLOYEES 테이블에서 (급여의 평균)보다 적은 사원의 사원번호,이름,담당업무,급여,부서번호를 출력하여라.  
SELECT employee_id, last_name, job_id, salary, department_id
FROM employees
WHERE salary < (SELECT AVG(salary)
                FROM employees);

-- 문제3) EMPLOYEES 테이블에서 (100번 부서의 최소 급여)보다 최소 급여가 많은 다른 모든 부서를 출력하라. ?
SELECT department_id, MIN(salary)
FROM employees
GROUP BY department_id
HAVING MIN(salary) > (SELECT MIN(salary)
                      FROM employees
                      WHERE department_id = 100);

-- 문제4) (업무별로 최소 급여를 받는 사원)의 정보를 사원번호,이름,업무,부서번호를 출력하여라. 
-- 단 업무별로 정렬하여라.
SELECT employee_id, last_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, MIN(salary)
                          FROM employees
                          GROUP BY job_id)
ORDER BY job_id;        

-- 문제5) EMPLOYEES 과 DEPARTMENTS 테이블에서 (업무가 SA_MAN 사원)의 정보를 이름,업무,부서명,근무지를 출력하라.
SELECT e.first_name, e.job_id, d.department_name, l.city
FROM (SELECT first_name, job_id, department_id 
                  FROM employees 
                  WHERE job_id = 'SA_MAN') e, departments d, locations l
WHERE e.department_id = d.department_id AND d.location_id = l.location_id;

-- 문제6) EMPLOYEES 테이블에서 (가장 많은 사원을 갖는 MANAGER의 사원번호)를 출력하라.?
SELECT manager_id
FROM employees
GROUP BY manager_id
HAVING COUNT(manager_id) IN(SELECT MAX(COUNT(manager_id))
                            FROM employees
                            GROUP BY manager_id);

-- 문제7) EMPLOYEES 테이블에서 (가장 많은 사원이 속해 있는 부서 번호)와 사원수를  출력하라.?
SELECT department_id, COUNT(employee_id)
FROM employees
GROUP BY department_id
HAVING COUNT(employee_id) IN(SELECT MAX(COUNT(employee_id))
                             FROM employees
                             GROUP BY department_id);
    
-- 문제8) EMPLOYEES 테이블에서 (사원번호가 123인 사원의 직업)과 같고 (사원번호가 192인 사원의 급여)보다 많은 사원의 사원번호,이름,직업,급여를 출력하라.
SELECT employee_id, last_name, job_id, salary
FROM employees
WHERE job_id = (SELECT job_id 
                FROM employees 
                WHERE employee_id = 123) 
AND salary > (SELECT salary 
              FROM employees 
              WHERE employee_id = 192);
        
-- 문제9)(직업별로 최소급여)를 받는 사원의 정보를 사원번호,이름,업무,부서명을 출력하라.
-- 조건1 :직업별로 내림차순정렬
SELECT employee_id, last_name, job_id, department_id, salary
FROM employees
WHERE (job_id, salary) IN(SELECT job_id, MIN(salary)
                          FROM employees
                          GROUP BY job_id)
ORDER BY job_id DESC;

-- 문제10) EMPLOYEES 테이블에서 (50번 부서의 최소 급여)를 받는 사원보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단 50번은 제외
SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MIN(salary)
                FROM employees
                WHERE department_id = 50) AND department_id != 50;

-- 문제11) EMPLOYEES 테이블에서 (50번 부서의 최고 급여)를 받는 사원보다 많은 급여를 받는 사원의 정보를 사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 
-- 단50번은 제외
SELECT employee_id, last_name, job_id, hire_date, salary, department_id
FROM employees
WHERE salary > (SELECT MAX(salary)
                FROM employees
                WHERE department_id = 50) AND department_id != 50;

(SELECT department_id, ROUND(AVG(salary)) AS "AVG", MAX(salary) AS "MAX", MIN(salary) AS "MIN"
FROM employees
GROUP BY department_id) e, department_id d





