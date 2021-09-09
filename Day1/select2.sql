/*
   SELECT
   FROM
   WHERE   ������ -> if
   
   �񱳿�����( >, <, >=, <=, =, !=, <>(!=�Ͱ���) )
   NULL, IS NULL, IS NOT NULL
   AND(&&), OR(||), (�켱��)
*/
-- �̸� -> Julia
SELECT first_name, last_name, salary 
FROM EMPLOYEES 
WHERE first_name = 'Julia';

-- ������ $9000 �̻��� ���
SELECT first_name, salary
FROM EMPLOYEES 
WHERE salary >= 9000;

-- �̸��� shanta ���� ū �̸�
SELECT first_name
FROM EMPLOYEES
WHERE first_name >= 'Shanta';

-- �̸��� ù���ڰ� J���� ū �̸�
SELECT first_name
FROM employees
WHERE first_name > 'J';

-- �Ŵ����� ���� ���
SELECT first_name, manager_id
FROM employees
WHERE manager_id IS NULL;

-- &&(Java) = AND
-- �̸��� John, ������ 5000�̻��� ���
SELECT first_name, salary
FROM employees
WHERE first_name = 'John' 
    AND salary >= 5000;
    
-- || = OR
SELECT first_name, last_name
FROM employees
WHERE first_name = 'John'
    OR last_name = 'Vollman';
    

-- 2007�� 12�� 31�� ���Ŀ� �Ի��� ����� ���
SELECT first_name, hire_date
FROM employees
WHERE hire_date > '07/12/31';

SELECT first_name, hire_date
FROM employees
WHERE hire_date > TO_DATE('20071231', 'YYYYMMDD');

/*
   ALL(=AND), ANY(=OR) WHERE�������� ���
   IN -> OR�� ���� ����, NOT IN
   BETWEEN
   LIKE

*/

SELECT first_name
FROM employees
WHERE first_name = ALL('Julia', 'John');
-- first_name = 'Julia' AND first_name = 'John'

SELECT first_name
FROM employees
WHERE first_name = ANY('Julia', 'John');
-- first_name = 'Julia' OR first_name = 'John'

SELECT first_name,salary
FROM employees
WHERE salary = ANY(8000, 3200, 6000);

SELECT first_name, salary
FROM employees
WHERE salary IN(8000, 3200, 6000);

SELECT first_name, salary 
FROM employees
-- WHERE salary >= 3200 AND salary <= 9000;
WHERE salary BETWEEN 3200 AND 9000;

SELECT first_name, salary 
FROM employees
WHERE salary NOT BETWEEN 3200 AND 9000;

--LIKE
SELECT first_name 
FROM employees
WHERE first_name LIKE 'G_ra_d'; -- _ �ѱ���

SELECT first_name 
FROM employees
WHERE first_name LIKE 'K%y';  -- % = �߰��� ���ڰ� �����̵� ���

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '06%';

SELECT first_name, hire_date
FROM employees
WHERE hire_date LIKE '%06';

SELECT first_name
FROM employees
WHERE first_name LIKE '%h%';




