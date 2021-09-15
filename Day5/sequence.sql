/*
   SEQUENCE : ������ ��(�ߺ��� ���� �ƴ� ��)�� ������ �ִ� Object
              ȸ����ȣ, �Խ��� �۹�ȣ
              �ʱ�ȭ�� �ȵȴ�. ���� �Ŀ� �ٽ� �����ؾ� �Ѵ�.
   int count = 0;
   while(true){
       count++
   }

*/

-- SEQUENCE ����
CREATE SEQUENCE TESTSEQ
INCREMENT BY 1   -- 1�� ����
START WITH 10    -- ���� ����
MAXVALUE 100
MINVALUE 1;

-- CURRVAL = ������ SEQ
SELECT TESTSEQ.CURRVAL
FROM DUAL;

-- NEXTVAL = ���ప
SELECT TESTSEQ.NEXTVAL
FROM DUAL;

-- SEQUENCE ����
ALTER SEQUENCE TESTSEQ
INCREMENT BY 3;

DROP SEQUENCE TESTSEQ; -- START WITH�� �����Ϸ��� ��, �ʱ�ȭ�Ϸ��� ���� �� �ٽ� �����ؾ��Ѵ�.

INSERT INTO employees(employee_id, last_name, email, hire_date, job_id) 
VALUES(EMPLOYEES_SEQ.nextval, 'ȫ', 'hgd@daum.net', '21/09/13', 'IT_PROG'); 
-- EMPLOYEES���̺� �� ������ �������� ���� �����ͷ� �����Ͱ����� ������� �� �ִ�.)

SELECT *
FROM employees;

ROLLBACK;


