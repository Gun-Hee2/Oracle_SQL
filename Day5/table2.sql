/*
    무결성 : CONSTRAINT
            COLUMN을 지정하는 성질

    Primary Key : 기본키, NULL을 허용하지 않는다. 중복을 허용하지 않는다.  ex) id, 주민번호
    Unique Key : 고유키, NULL을 허용한다. 중복을 허용하지 않는다.  ex) e-mail
    Foreign Key : 외래키, 테이블과 테이블을 연결하는 것이 목적이다.  Join이 목적
                  NULL을 허용한다.
                  외래키로 설정된 컬럼은 연결된 테이블의 컬럼에서 기본키나 고유키로 설정되어 있어야한다.
    CHECK : 범위를 설정할 수 있다. 값을 지정할 수도 있다. 지정된 값 외에는 사용할 수 없다. NULL을 허용
    NOT NULL : NULL을 허용하지 않는다.

*/

-- NOT NULL
DROP TABLE TB_TEST04;

CREATE TABLE TB_TEST04(
    COL1 VARCHAR2(10) NOT NULL,
    COL2 VARCHAR2(20)
);

INSERT INTO tb_test04(COL1, COL2)
VALUES('AAA', '111');

INSERT INTO tb_test04(COL1, COL2)
VALUES('BBB', '');

INSERT INTO tb_test04(COL1, COL2) -- 위에서 COL1은 NULL을 허용하지 않기 때문에 ''을 삽입하면 오류가 생긴다.
VALUES('', '222');

INSERT INTO tb_test04(COL1)
VALUES('CCC');

-- CHECK : 지정된 값만을 삽입할 수 있다.
CREATE TABLE TB_CHECK(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(20),
    CONSTRAINT CHK_01 CHECK( COL1 IN('사과', '배', '바나나')),
    CONSTRAINT CHK_02 CHECK( COL2 > 0 AND COL2 <= 10)
);

INSERT INTO TB_CHECK(COL1, COL2)
VALUES('사과', 5);

INSERT INTO TB_CHECK(COL1, COL2)
VALUES('귤', 5);

INSERT INTO TB_CHECK(COL1, COL2)
VALUES('', 5);

INSERT INTO TB_CHECK(COL2)
VALUES(5);

-- Primary Key = Unique + NOT NULL

CREATE TABLE TB_TEST05(
    COL1_PK VARCHAR2(10) CONSTRAINT PK_TEST_01 PRIMARY KEY,
    COL2 VARCHAR2(20)
);

INSERT INTO tb_test05(COL1_PK, COL2)
VALUES('AAA', '111');

INSERT INTO tb_test05(COL1_PK, COL2)
VALUES('BBB', '');

INSERT INTO tb_test05(COL1_PK)
VALUES('CCC');

INSERT INTO tb_test05(COL1_PK, COL2)
VALUES('', '111'); -- PK는 빈 값을 허용하지 않는다.

CREATE TABLE TB_TEST06( -- 테이블은 하나의 기본 키만 가질 수 있다.
    COL1_PK VARCHAR2(10) CONSTRAINT PK_TEST_02 PRIMARY KEY,
    COL2_PK VARCHAR2(10) CONSTRAINT PK_TEST_03 PRIMARY KEY, -- table can have only one primary key
    COL2 VARCHAR2(20)
);

CREATE TABLE TB_TEST06(
    COL1 VARCHAR2(10), 
    COL2 VARCHAR2(10),
    COL3 VARCHAR2(20),
    CONSTRAINT PK_TEST_02 PRIMARY KEY(COL1, COL2)
);

CREATE TABLE TB_TEST07(
    COL1 VARCHAR2(10), 
    COL2 VARCHAR2(10)
);
-- TB_TEST07 COL1을 PRIMARY KEY로 수정
ALTER TABLE TB_TEST07
ADD
PRIMARY KEY(COL1);

-- TB_TEST07 PRIMARY KEY 삭제
ALTER TABLE TB_TEST07
DROP
PRIMARY KEY;

-- Unique :중복된 값은 사용불가, NULL허용
CREATE TABLE TB_TEST08(
    COL1 VARCHAR2(10) CONSTRAINT UK_TEST_01 UNIQUE,
    COL2 VARCHAR2(20)
);

INSERT INTO TB_TEST08(COL1, COL2)
VALUES('AAA', '111');

INSERT INTO TB_TEST08(COL1, COL2)
VALUES('', '222');

-- FOREIGN KEY : 외래키
--                JOIN이 목적, 테이블 연결
--                기본테이블에 컬럼이 PK나 UK로 되어 있어야한다.
--                NULL을 허용

CREATE TABLE DEPT(
    DEPARTMENT_ID VARCHAR2(10),
    DEPARTMENT_NAME VARCHAR2(20),
    LOCATION_ID NUMBER,
    CONSTRAINT PK_DEPT_TEST PRIMARY KEY(DEPARTMENT_ID)
);

ALTER TABLE DEPT
MODIFY LACATION_ID CONSTRAINT FK_DEPT_TEST FOREIGN KEY(LOCATION_ID) 
REFERENCES LOC(LOCATION_ID)

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('10', '기획부', '100');

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('20', '관리부', '110');

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('30', '개발부', '120');

CREATE TABLE EMP(
    EMPNO VARCHAR2(10),
    ENAME VARCHAR2(20),
    DEPARTMENT_ID_FK VARCHAR2(10),
    CONSTRAINT FK_EMP_TEST FOREIGN KEY(DEPARTMENT_ID_FK)
    REFERENCES DEPT(DEPARTMENT_ID)
);

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(1, '홍길동', '30');

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(2, '성춘향', '10');

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(3, '일지매', '20');

SELECT e.ename, d.location_id
FROM emp e, dept d
WHERE e.department_id_fk = d.department_id;

CREATE TABLE LOC(
    CITY VARCHAR2(10),
    COUNTRY_ID VARCHAR2(20),
    LOCATION_ID NUMBER,
    PRIMARY KEY(LOCATION_ID)
);

CREATE TABLE DEPT2(
    DEPARTMENT_ID VARCHAR2(10),
    DEPARTMENT_NAME VARCHAR2(20),
    LOCATION_ID NUMBER,
    CONSTRAINT FK_DEPT_TEST FOREIGN KEY(LOCATION_ID)
    REFERENCES LOC(LOCATION_ID)
);

SELECT e.ename, d.location_id, d2.department_name, l.city
FROM emp e, dept d, dept2 d2, loc l
WHERE e.department_id_fk = d.department_id OR d2.location_id = l.location_id;




