--1. employees ���̺��� ����̸� �� a�� ���Ե� ����̸��� ���ϰ� �� �̸� �� �տ��� 3�ڸ� �����Ͽ� ����϶�.
SELECT last_name, SUBSTR(last_name, 0, 3)
FROM EMPLOYEES
WHERE last_name LIKE '%a%'
GROUP BY last_name;

--2. �̸��� ����° ���ڰ� a�� ��� ����� �̸��� ǥ���Ͻÿ�.
SELECT last_name 
FROM EMPLOYEES
WHERE INSTR(last_name, 'a') = 3;

--3. �̸��� J,A �Ǵ� M���� �����ϴ� ��� ����� �̸�(ù ���ڴ� �빮�ڷ�, ������ ���ڴ� �ҹ��ڷ� ǥ��) �� �̸��� ���̸� ǥ���Ͻÿ�.(�� ���̺��� name�� length�� ǥ��)
SELECT INITCAP(last_name), LENGTH(last_name) 
FROM EMPLOYEES
WHERE last_name LIKE 'J%' OR last_name LIKE 'A%' OR last_name LIKE 'M%';

--4. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �ҹ��ڷ� �̸��� ����Ͻÿ�
SELECT last_name, LOWER(last_name) 
FROM EMPLOYEES
WHERE LENGTH(last_name) = 6;

--5. �̸��� ���ڼ��� 6�� �̻��� ����� �̸��� �տ��� 3�ڸ� ���Ͽ� �ҹ��ڷ� ����Ͻÿ�.
SELECT last_name, SUBSTR(last_name, 0, 3) 
FROM EMPLOYEES
WHERE LENGTH(last_name) = 6;

--6. ��� ����� �̸��� �޿��� ǥ���Ͻÿ�. �޿��� 15�� ���̷� ���ʿ� $��ȣ�� ä���� �������� ǥ���ϰ� �����̺��� �������� �����Ͻÿ�.
SELECT last_name, LPAD(salary, 15, '$') AS "����" 
FROM EMPLOYEES;

--7. ������̺��� �Ի�⵵�� ������� ���϶�. 
SELECT TO_CHAR(hire_date, 'YYYY') AS "�Ի�⵵" , COUNT(*) AS "��� ��"
FROM EMPLOYEES
GROUP BY TO_CHAR(hire_date, 'YYYY');


