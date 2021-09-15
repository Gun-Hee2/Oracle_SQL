/*
   View : ���� ���̺�
          ��ü�� ���� ���̺�
   
   ���̺� <----View----- User       
   �� ���� ��� �������� ���̺��� �˻��� �� �ִ�.
   �ӵ��� ������
   ���Ѽ����� �����ϴ�. --> readonly
   
*/

CREATE VIEW UB_TEST01
AS
SELECT job_id, job_title, min_salary
FROM jobs;

SELECT *
FROM ub_test01;

INSERT INTO ub_test01(job_id, job_title, min_salary)
VALUES('DEVELOPER', '�� ������', 10000);

SELECT *
FROM jobs;

ROLLBACK; -- �ǵ���
COMMIT; -- ����

-- READONLY ������ �����ְ�, ����(DML �۾�)�� �Ұ���
CREATE VIEW DEPTVIEW
AS
SELECT department_id, department_name, location_id
FROM departments
WITH READ ONLY;

SELECT *
FROM deptview;

-- �����ȣ, �̸�, �μ���ȣ, �μ���, ������ȣ
CREATE VIEW DEFT_EMP_VIEW
AS
SELECT e.employee_id, e.first_name, d.department_id, d.department_name, d.location_id
FROM employees e, departments d
WHERE e.department_id = d.department_id;

SELECT *
FROM deft_emp_view
WHERE employee_id = 100;











