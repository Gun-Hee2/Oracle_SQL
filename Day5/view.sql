/*
   View : 가상 테이블
          실체가 없는 테이블
   
   테이블 <----View----- User       
   한 개의 뷰로 여러개의 테이블을 검색할 수 있다.
   속도가 빠르다
   제한설정이 가능하다. --> readonly
   
*/

CREATE VIEW UB_TEST01
AS
SELECT job_id, job_title, min_salary
FROM jobs;

SELECT *
FROM ub_test01;

INSERT INTO ub_test01(job_id, job_title, min_salary)
VALUES('DEVELOPER', '웹 개발자', 10000);

SELECT *
FROM jobs;

ROLLBACK; -- 되돌림
COMMIT; -- 적용

-- READONLY 정보만 볼수있고, 수정(DML 작업)은 불가능
CREATE VIEW DEPTVIEW
AS
SELECT department_id, department_name, location_id
FROM departments
WITH READ ONLY;

SELECT *
FROM deptview;

-- 사원번호, 이름, 부서번호, 부서명, 지역번호
CREATE VIEW DEFT_EMP_VIEW
AS
SELECT e.employee_id, e.first_name, d.department_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT *
FROM deft_emp_view
WHERE employee_id = 100;











