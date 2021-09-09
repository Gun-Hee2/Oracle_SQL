/*
   ����:
       SELECT (��, �÷�(�׸�)��, �Լ�, SUB QUERY)
       FROM (���̺��, SUB QUERY)
   
*/

SELECT * FROM EMPLOYEES;

SELECT * FROM TAB;

SELECT employee_id, first_name, salary FROM EMPLOYEES;

SELECT employee_id, first_name, salary * 12 FROM EMPLOYEES;

-- ALIAS
SELECT employee_id AS �����ȣ, salary as ����, salary * 12 "�ϳ�ġ ����" FROM EMPLOYEES;

-- XXX�� ������ XXX�Դϴ�  "�̸� + ����"
SELECT first_name || '�� ������ ' || salary || '�Դϴ�' AS "�̸� + ����" FROM EMPLOYEES;

-- distinct : �ߺ����� ����
SELECT DISTINCT department_id FROM EMPLOYEES;

-- ����1) EMPLOYEES Table�� ��� �ڷḦ ����Ͽ���.
SELECT * FROM EMPLOYEES;

-- ����2) EMPLOYEES Table�� �÷����� ��� ����϶�.
DESC EMPLOYEES;
SELECT * FROM COLS WHERE TABLE_NAME = 'EMPLOYEES';

-- ����3) EMPLOYEES Table���� ��� ��ȣ, �̸�, �޿�, �������� ����Ͽ���.
SELECT employee_id, first_name, salary, job_id FROM EMPLOYEES;

-- ����4) ��� �������� �޿��� $300���� ��Ű�� ���ؼ� ���� �����ڸ� ����ϰ� ����� SALARY+300�� ���÷��� �մϴ�.
SELECT first_name, salary, salary + 300 FROM EMPLOYEES;

-- ����5) EMP ���̺��� �����ȣ, �̸�, �޿�, ���ʽ�, ���ʽ� �ݾ��� ����Ͽ���. 
-- (����� ���ʽ��� ���� + (����*Ŀ�̼�))
SELECT employee_id, first_name, salary, salary + NVL(salary * commission_pct, 0) AS BONUS FROM EMPLOYEES;
/*
   NVL(�÷�, �÷��� ���� null�̸� �����Ǵ� ��)
*/

-- ����6) EMPLOYEES ���̺��� LAST_NAME�� �̸����� SALARY�� �޿��� ����Ͽ���.
SELECT last_name AS "�̸�", salary AS "�޿�" FROM EMPLOYEES;

-- ����7) EMPLOYEES ���̺��� LAST_NAME�� Name���� SALARY * 12�� Annual Salary(����)�� ����Ͽ���
SELECT last_name AS "Name", salary * 12 AS "Annual Salary" FROM EMPLOYEES;

-- ����8) EMPLOYEES ���̺��� �̸��� ������ �����Ͽ� ����Ͽ���. 
SELECT first_name || ' ' || job_id FROM EMPLOYEES;

-- ����9) EMPLOYEES ���̺��� �̸��� ������ ��KING is a PRESIDENT�� �������� ����Ͽ���. 
SELECT first_name || ' is a ' || job_id FROM EMPLOYEES;

-- ����10) EMPLOYEES ���̺��� �̸��� ������ ��KING: 1 Year salary = 60000�� �������� ����Ͽ���. 
SELECT first_name || ': 1 Year salary = ' || salary * 12 FROM EMPLOYEES;

-- ����11) EMPLOYEES ���̺��� JOB�� ��� ����϶�.
SELECT job_id FROM EMPLOYEES;






