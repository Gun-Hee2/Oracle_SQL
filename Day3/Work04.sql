-- ����1) ������� �̸�, �μ���ȣ, �μ����� ����϶�
SELECT e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id;

-- ����2) 30�� �μ��� ������� �̸�,����,�μ����� ����϶�
SELECT e.first_name, e.job_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_id = 30;

-- ����3) Ŀ�̼��� �޴� ����� �̸�, ����, �μ���ȣ,�μ����� ����϶�
SELECT e.first_name, e.job_id, e.salary * e.commission_pct AS "BONUS", d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND (e.salary * e.commission_pct) IS NOT NULL;

-- ����4) ������ȣ 2500 ���� �ٹ��ϴ� ����� �̸�, ����,�μ���ȣ,�μ����� ����϶�
SELECT e.first_name, e.job_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.location_id = 2500;

-- ����5) �̸��� A�� ���� ������� �̸��� �μ��̸��� ����϶�
SELECT e.first_name, e.job_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.first_name LIKE '%A%';
-- AND SUBSTR(first_name, 1,1) = 'A';

-- ����6) ����̸��� �� ����� ������ �̸��� ����϶�
SELECT a.first_name AS "���", b.first_name AS "������"
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- ����7) ����̸��� �μ���� ������ ����ϴµ� ������ 3000 �̻��� ����� ����϶�
SELECT e.first_name, d.department_name, e.salary
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.salary >= 3000;
--ORDER BY e.salary ASC;

-- ����8) TJ �̶� ������� �ʰ� �Ի��� ����� �̸��� �Ի����� ����϶�
SELECT a.first_name, a.hire_date, b.first_name, b.hire_date
FROM employees a, employees b
WHERE b.hire_date > a.hire_date AND a.first_name = 'TJ';
--ORDER BY b.hire_date ASC;

-- ����9) �޿��� 3000���� 5000������ ����� �̸��� �ҼӺμ��� ����϶�
SELECT e.first_name, e.salary, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND e.salary >= 3000 AND e.salary <= 5000;
--ORDER BY e.salary ASC;

-- ����10) ACCOUNTING �μ� �Ҽ� ����� �̸��� �Ի��� ����϶�
SELECT e.first_name, e.hire_date
FROM employees e, departments d
WHERE e.department_id = d.department_id
AND d.department_name = 'Accounting';

-- ����11) �޿��� 3000������ ����� �̸��� �޿�, �ٹ���
SELECT e.first_name, e.salary, i.city
FROM employees e, departments d, locations i
WHERE e.department_id = d.department_id AND d.location_id = i.location_id
AND e.salary <= 3000;
--ORDER BY e.salary ASC;

-- ����12) 101�� ����� ���� �Ʒ��� ����� �����ϴ� ������ �ۼ��� ����.
---------------------------------------------------------------------
���   �����   job��Ī   job��������   job��������   job����μ���
---------------------------------------------------------------------
SELECT e.employee_id, e.first_name, j.job_title, jh.start_date, jh.end_date, d.department_name
FROM employees e, jobs j , job_history jh, departments d
WHERE e.employee_id = 101 AND e.job_id = j.job_id AND e.employee_id = jh.employee_id AND d.department_id = jh.department_id;


