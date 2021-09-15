/*
    ���Ἲ : CONSTRAINT
            COLUMN�� �����ϴ� ����

    Primary Key : �⺻Ű, NULL�� ������� �ʴ´�. �ߺ��� ������� �ʴ´�.  ex) id, �ֹι�ȣ
    Unique Key : ����Ű, NULL�� ����Ѵ�. �ߺ��� ������� �ʴ´�.  ex) e-mail
    Foreign Key : �ܷ�Ű, ���̺�� ���̺��� �����ϴ� ���� �����̴�.  Join�� ����
                  NULL�� ����Ѵ�.
                  �ܷ�Ű�� ������ �÷��� ����� ���̺��� �÷����� �⺻Ű�� ����Ű�� �����Ǿ� �־���Ѵ�.
    CHECK : ������ ������ �� �ִ�. ���� ������ ���� �ִ�. ������ �� �ܿ��� ����� �� ����. NULL�� ���
    NOT NULL : NULL�� ������� �ʴ´�.

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

INSERT INTO tb_test04(COL1, COL2) -- ������ COL1�� NULL�� ������� �ʱ� ������ ''�� �����ϸ� ������ �����.
VALUES('', '222');

INSERT INTO tb_test04(COL1)
VALUES('CCC');

-- CHECK : ������ ������ ������ �� �ִ�.
CREATE TABLE TB_CHECK(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(20),
    CONSTRAINT CHK_01 CHECK( COL1 IN('���', '��', '�ٳ���')),
    CONSTRAINT CHK_02 CHECK( COL2 > 0 AND COL2 <= 10)
);

INSERT INTO TB_CHECK(COL1, COL2)
VALUES('���', 5);

INSERT INTO TB_CHECK(COL1, COL2)
VALUES('��', 5);

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
VALUES('', '111'); -- PK�� �� ���� ������� �ʴ´�.

CREATE TABLE TB_TEST06( -- ���̺��� �ϳ��� �⺻ Ű�� ���� �� �ִ�.
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
-- TB_TEST07 COL1�� PRIMARY KEY�� ����
ALTER TABLE TB_TEST07
ADD
PRIMARY KEY(COL1);

-- TB_TEST07 PRIMARY KEY ����
ALTER TABLE TB_TEST07
DROP
PRIMARY KEY;

-- Unique :�ߺ��� ���� ���Ұ�, NULL���
CREATE TABLE TB_TEST08(
    COL1 VARCHAR2(10) CONSTRAINT UK_TEST_01 UNIQUE,
    COL2 VARCHAR2(20)
);

INSERT INTO TB_TEST08(COL1, COL2)
VALUES('AAA', '111');

INSERT INTO TB_TEST08(COL1, COL2)
VALUES('', '222');

-- FOREIGN KEY : �ܷ�Ű
--                JOIN�� ����, ���̺� ����
--                �⺻���̺� �÷��� PK�� UK�� �Ǿ� �־���Ѵ�.
--                NULL�� ���

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
VALUES('10', '��ȹ��', '100');

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('20', '������', '110');

INSERT INTO DEPT(DEPARTMENT_ID, DEPARTMENT_NAME, LOCATION_ID)
VALUES('30', '���ߺ�', '120');

CREATE TABLE EMP(
    EMPNO VARCHAR2(10),
    ENAME VARCHAR2(20),
    DEPARTMENT_ID_FK VARCHAR2(10),
    CONSTRAINT FK_EMP_TEST FOREIGN KEY(DEPARTMENT_ID_FK)
    REFERENCES DEPT(DEPARTMENT_ID)
);

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(1, 'ȫ�浿', '30');

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(2, '������', '10');

INSERT INTO EMP(EMPNO, ENAME, DEPARTMENT_ID_FK)
VALUES(3, '������', '20');

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




