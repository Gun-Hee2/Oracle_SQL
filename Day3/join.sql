/*
    JOIN
    두 개 이상의 테이블의 데이터를 검색하는 방법이다.
    보통 두 개 이상의 행(ROW)들의 공통된 값(기본키, 외래키)를 사용해서 JOIN한다.
    
    기본키(Primary Key): 테이블에서 중복이 되지 않는 키 -> PK
    외래키(Foreign Key): 다른 테이블에서 Primary Key인 경우가 많다. -> FK
    
    JOIN 종류
    inner join = 교집합       *****
    full outer join = 합집합
    cross join
    outer join
        left join            ***
        right join           ***
    self join                *****
*/

-- inner join
-- ansi SQL (표준 SQL)
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM EMPLOYEES e INNER JOIN departments d
    ON e.department_id = d.department_id;

-- Oracle
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT e.employee_id, e.first_name, e.job_id, j.job_id, j.job_title 
FROM employees e, jobs j
WHERE e.job_id = j.job_id AND e.job_id = 'IT_PROG';

-- cross join 사용빈도 거의 없다.
-- ansi SQL (표준 SQL)
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e CROSS JOIN departments d;

-- Oracle
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d;

-- Full outer join
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id;

-- Oracle
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
UNION
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;

-- Outer join
-- left/right join
-- ansi
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e LEFT OUTER JOIN departments d
ON e.department_id = d.department_id;

-- Oracle
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);

-- 차집합
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+) AND e.department_id IS NULL;

SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id
AND e.department_id IS NULL;

-- 교집합의 여집합
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e FULL OUTER JOIN departments d
ON e.department_id = d.department_id
WHERE e.department_id IS NULL OR d.department_id IS NULL;

-- 부서명, 업무명 (Nancy) 2개의 조인
SELECT e.first_name, e.department_id, d.department_id, e.job_id, j.job_id, d.department_name, j.job_title
FROM employees e, departments d, jobs j
WHERE e.first_name = 'Nancy'
AND e.department_id = d.department_id AND e.job_id = j.job_id;

-- Self Join : 동일한 테이블을 조인
SELECT a.employee_id, a.first_name, a.manager_id, b.employee_id, b.first_name
FROM employees a, employees b  -- a: 사원 b: 상사
WHERE a.manager_id = b.employee_id;





