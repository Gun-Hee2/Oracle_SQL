-- Ư�� ����
-- CASE == switch
SELECT employee_id, first_name, phone_number, CASE SUBSTR(phone_number, 1, 3)
WHEN '515' THEN '����' 
WHEN '590' THEN '�λ�' 
WHEN '650' THEN '����'
ELSE '��Ÿ'
END AS "����"
FROM EMPLOYEES;

SELECT employee_id, first_name, phone_number,
CASE
WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '����'
WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '�λ�'
WHEN SUBSTR(phone_number, 1, 3) = '650' THEN '����'
ELSE '��Ÿ'
END AS "����"
FROM EMPLOYEES;

-- DECODE
SELECT employee_id, first_name, phone_number,
DECODE(SUBSTR(phone_number, 1, 3), 
'515', '����',
'590', '�λ�',
'650', '����',
'��Ÿ') AS "����"
FROM EMPLOYEES;

-- ����
/*
   ������ : UNION - FULL OUTER JOIN
   ������ : INTERSECT - INNER JOIN
   ������ : MINUS
*/

-- UNION
SELECT job_id
FROM employees
WHERE job_id IN('AD_VP', 'FI_ACCOUNT')
UNION ALL
SELECT job_id
FROM jobs
WHERE job_id IN('AD_VP', 'FI_ACCOUNT');

-- INTERSECT
SELECT employee_id
FROM employees
INTERSECT
SELECT manager_id
FROM employees;

-- INNER JOIN
SELECT DISTINCT b.employee_id
FROM employees a, employees b
WHERE a.manager_id = b.employee_id;

-- MINUS
SELECT employee_id
FROM employees
MINUS
SELECT manager_id
FROM employees;

-- OVER() �Լ�
-- SELECT�������� ���
-- GROUP BY�� �����ϱ� ���� ���� �Լ�
SELECT department_id, COUNT(*) -- ����
FROM employees;

SELECT department_id, COUNT(*) 
FROM employees
GROUP BY department_id;

SELECT department_id, COUNT(*)OVER()
FROM employees;

SELECT first_name, department_id, COUNT(DISTINCT department_id)OVER()
FROM employees;

-- PARTITION BY == SELECT�� ���� GROUP BY
SELECT department_name, COUNT(*)OVER(PARTITION BY department_id)
FROM departments;

SELECT department_id, first_name, salary, job_id,
COUNT(*)OVER(PARTITION BY department_id),
SUM(salary)OVER(PARTITION BY job_id)
FROM employees;

-- COUNT(*)OVER() : ��ü ���� ��ȯ
-- COUNT(*)OVER(PARTITION BY �÷�) : �÷��� �׷����� ������ ROW�� ���� ��ȯ

-- �м� �Լ�
/*
   ���� �Լ�
   RANK()       1 2 3 3 5 6 -> 3��� 4���� ���� ������ 3���� �Ѵ� 3���� ǥ���ϰ� 4���� ǥ�� ���ϰ� �Ѿ��.
   DENSE_RANK() 1 2 3 3 4 5 
   ROW_NUMBER() 1 2 3 4 5 6 -> OVER()�Լ��� ���� ����Ѵ�.
   ROWNUM       1 2 3 4 5 6
*/
SELECT employee_id, first_name
FROM employees
WHERE employee_id >= 100 AND employee_id <= 109;

SELECT employee_id, first_name, salary
FROM employees
ORDER BY salary DESC;

SELECT ROWNUM, employee_id, first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS "RANK",
    DENSE_RANK()OVER(ORDER BY salary  DESC) AS "DENSE_RANK",
    ROW_NUMBER()OVER(ORDER BY salary  DESC) AS "ROW_NUMBER"
FROM employees;

SELECT ROWNUM, employee_id, first_name, salary
FROM employees
WHERE ROWNUM > 10 AND ROWNUM <= 20;

-- ROWNUM
-- 1. ����(������ ���� ����� �Ѵ�)
-- 2. ��ȣ�� ��������� �Ѵ�.
-- 3. ������ ��������� �Ѵ�.

SELECT RNUM, employee_id, first_name, salary
FROM
(SELECT ROWNUM AS "RNUM", employee_id, first_name, salary  -- 2. ��ȣ�� ����
FROM(  
       SELECT employee_id, first_name, salary    -- 1. ����
       FROM employees
       ORDER BY salary DESC  )
    )
WHERE RNUM >= 1 AND RNUM <= 10;   -- 3. ������ ����

/*
SELECT��
    SELECT �÷�, ǥ���Լ�, �׷��Լ�, ��������, OVER() PARTITION BY
    FROM ���̺�, ��������
    [WHERE] ���� IN AND OR NULL(IS NULL) ALL ANY LIKE > < >= <= != <> ��������
    [GROUP BY] �÷�
    [HAVING] �׷��ο� ���� ����
    [ORDER BY] �÷� ASC, DESC
    
JOIN
    INNER
    FULL OUTER
    CROSS
    OUTER(LEFT/RIGHT)
    SELF
*/


