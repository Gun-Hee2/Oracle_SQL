/*
   SEQUENCE : 유일한 값(중복된 값이 아닌 값)을 생성해 주는 Object
              회원번호, 게시판 글번호
              초기화가 안된다. 삭제 후에 다시 생성해야 한다.
   int count = 0;
   while(true){
       count++
   }

*/

-- SEQUENCE 생성
CREATE SEQUENCE TESTSEQ
INCREMENT BY 1   -- 1씩 증가
START WITH 10    -- 시작 숫자
MAXVALUE 100
MINVALUE 1;

-- CURRVAL = 현재의 SEQ
SELECT TESTSEQ.CURRVAL
FROM DUAL;

-- NEXTVAL = 진행값
SELECT TESTSEQ.NEXTVAL
FROM DUAL;

-- SEQUENCE 수정
ALTER SEQUENCE TESTSEQ
INCREMENT BY 3;

DROP SEQUENCE TESTSEQ; -- START WITH를 수정하려면 즉, 초기화하려면 삭제 후 다시 생성해야한다.

INSERT INTO employees(employee_id, last_name, email, hire_date, job_id) 
VALUES(EMPLOYEES_SEQ.nextval, '홍', 'hgd@daum.net', '21/09/13', 'IT_PROG'); 
-- EMPLOYEES테이블에 맨 마지막 데이터의 다음 데이터로 데이터값들을 집어넣을 수 있다.)

SELECT *
FROM employees;

ROLLBACK;


