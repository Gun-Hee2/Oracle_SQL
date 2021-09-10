-- ����1) EMPLOYEES ���̺��� �޿��� 3000�̻��� ����� �����ȣ, �̸�, ������, �޿��� ����϶�.
SELECT employee_id, first_name, job_id, salary 
FROM EMPLOYEES
WHERE salary >= 3000;

-- ����2) EMPLOYEES ���̺��� ��� ������ ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, department_id  
FROM employees
WHERE job_id = 'ST_MAN';

-- ����3) EMPLOYEES ���̺��� �Ի����ڰ� 2006�� 1�� 1�� ���Ŀ� �Ի��� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date >= TO_DATE('20060101', 'YYYYMMDD')
ORDER BY hire_date ASC;

-- ����4) EMPLOYEES ���̺��� �޿��� 3000���� 5000������ ����� ����, ������, �޿�, �μ���ȣ�� ����϶�.
SELECT first_name, job_id, salary, department_id
FROM employees
WHERE salary BETWEEN 3000 AND 5000
ORDER BY salary ASC;

-- ����5) EMPLOYEES ���̺��� �����ȣ�� 145,152,203�� ����� �����ȣ, ����, ������, �޿�, �Ի����ڸ� ����϶�
SELECT employee_id, first_name, job_id, salary, hire_date
FROM employees
WHERE employee_id = ANY(145, 152, 203);

-- ����6) EMPLOYEES ���̺��� �Ի����ڰ� 05�⵵�� �Ի��� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE hire_date LIKE '05%'
ORDER BY hire_date ASC;

-- ����7) EMPLOYEES ���̺��� ���ʽ��� ���� ����� �����ȣ, ����, ������, �޿�, �Ի�����, ���ʽ�, �μ���ȣ�� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, NVL(commission_pct, 0)AS "COMM", department_id
FROM employees
WHERE commission_pct IS NULL;    -- Oracle: NVL,  Mysql: isnull

-- ����8) EMPLOYEES ���̺��� �޿��� 1100�̻��̰� JOB�� ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 1100 AND job_id = 'ST_MAN'
ORDER BY salary ASC;

-- ����9) EMPLOYEES ���̺��� �޿��� 10000�̻��̰ų� JOB�� ST_MAN�� ����� �����ȣ, ����, ������, �޿�, �Ի�����, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE salary >= 10000 OR job_id = 'ST_MAN';


-- ����10) EMPLOYEES ���̺��� JOB�� ST_MAN, SA_MAN, SA_REP�� �ƴ� ����� �����ȣ, ����, ������, �޿�, �μ���ȣ�� ����϶�
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE job_id NOT IN('ST_MAN', 'SA_MAN', 'SA_REP');

-- ����11) ������ PRESIDENT�̰� �޿��� 12000�̻��̰ų� ������ SA_MAN�� ����� �����ȣ, �̸�, ����, �޿��� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE job_id = 'AD_PRES' AND salary >= 12000 OR job_id = 'SA_MAN';

-- ����12) ������ AD_PRES �Ǵ� SA_MAN�̰� �޿��� 12000�̻��� ����� �����ȣ, �̸�, ����, �޿��� ����϶�.
SELECT employee_id, first_name, job_id, salary, hire_date, department_id
FROM employees
WHERE job_id = 'AD_PRES' OR job_id = 'SA_MAN' AND salary >= 12000;
