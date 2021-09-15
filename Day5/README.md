# Day5

## 제약조건(CONSTRAINT)

제약 조건(CONSTRAINT)이란 데이터의 무결성을 지키기 위해 제한된 조건을 의미한다.

쉽게 말해, 테이블이나 속성에 부적절한 데이터가 들어오는 것을 사전에 차단하도록 정해놓은것이라고 생각하면 된다.

우선 제약 조건의 종류들은 다음과 같다.

* NOT NULL
* CHECK
* PRIMARY KEY
* UNIQUE
* FOREIGN KEY

### NOT NULL

테이블을 만들 때 컬럼을 정의하는데 그 때 NOT NULL제약 조건을 명시하면 그 해당 컬럼에는 반드시 데이터를 입력해야만 한다.

설계를 할 때 이 컬럼에는 반드시 데이터값이 들어가야한다고 하면 NOT NULL을 명시해주는게 좋다.

NOT NULL제약 조건은 다음과 같이 사용한다.

```sql
CREATE TABLE TB_TEST01(
    COL1 VARCHAR2(10) NOT NULL,
    COL2 VARCHAR2(20)
);
```

COL1 컬럼에는 데이터를 생성할 때 무조건 데이터값이 NULL이 아니여야 한다.

예를 들어, COL1컬럼에 다음과 같이 데이터를 입력하면 오류가 발생한다.

```sql
INSERT INTO tb_test04(COL1, COL2) 
VALUES('', '222');
```

반드시 NOT NULL제약 조건을 명시한 컬럼에는 NULL값이 아닌 데이터여야 한다.

### CHECK

CHECK제약 조건은 입력 데이터값이 조건에 맞지 않으면 오류가 발생한다.

즉, CHECK는 입력할 수 있는 데이터값의 범위(조건)를 설정해주는 것이다.

예를들어, 1 ~ 10까지만 입력 범위를 주고 그 범위를 벗어나는 데이터값은 입력이 불가능하다.

CHECK제약 조건은 다음과 같이 사용한다.

```sql
CREATE TABLE TB_CHECK(
    COL1 VARCHAR2(10),
    COL2 VARCHAR2(20),
    CONSTRAINT CHK_01 CHECK( COL1 IN('사과', '배', '바나나')),
    CONSTRAINT CHK_02 CHECK( COL2 > 0 AND COL2 <= 10)
);
```

COL1컬럼에 입력할 수 있는 데이터값은 사과, 배, 바나나로 한정된다.

또한, COL2컬럼에 입력할 수 있는 데이터값은 0보다 크고 10이하여야 하는 조건이 생긴다.

따라서 두 컬럼에 입력할 데이터값들은 저 두 조건에 부합되어야 한다.

### PRIMARY KEY

PRIMARY KEY는 기본키이며, 줄여서 PK라고도 불린다. 

기본키는 테이블당 하나만 정의 가능하며, 기본키는 NOT NULL + UNIQUE의 기능을 가지고 있다.

기본키를 선언하는 방법은 테이블 생성할 때 두가지 방법과 따로 설정하는 ALTER방법이 있다.

1) 컬럼명 옆에 바로 기본키를 선언

```sql
CREATE TABLE TB_TEST01(
    COL1 VARCHAR2(10) PRIMARY KEY
);
```

2) [해당 컬럼] [타입] CONSTRAINT [제약조건 명] PRIMARY KEY

```sql
CREATE TABLE TB_TEST01(
    COL1 VARCHAR2(10), 
    CONSTRAINT PK_TEST_01 PRIMARY KEY
);
```

3. CONSTRAINT [제약조건 명] PRIMARY KEY([컬럼명1],[컬럼명2],...)

```sql
CREATE TABLE TB_TEST01(
    COL1 VARCHAR2(10), 
    COL2 VARCHAR2(10),
    CONSTRAINT PK_TEST_01 PRIMARY KEY(COL1, COL2)
);
```

4. ALTER TABLE [테이블명] ADD CONSTRAINT [제약조건명] PRIMARY KEY(컬럼명)

```sql
ALTER TABLE TB_TEST01
ADD
CONSTRAINT PK_TEST_01 PRIMARY KEY(COL1);
```

### UNIQUE

UNIQUE는 말 그대로 고유의 값이다.

유일한 값만 들어가도록 하고 싶을 때 사용한다. 즉, 중복을 허용하지 않는다.

동시에, NOT NULL과 같이 사용할 수 있다. 

NOT NULL을 사용하는 이유는 UNIQUE는 NULL을 허용하기 때문이다.

UNIQUE의 사용하는 방법은 다음과 같다.

```sql
CREATE TABLE TEST(
      COL1 VARCHAR(10) UNIQUE NOT NULL,
      COL2 VARCHAR(20) CONSTRAINT nickName_uq UNIQUE(nickName),
      C0L3 VARCHAR(10) NOT NULL
 );
```

### FOREIGN KEY

FOREIGN KEY는 흔히 FK라고 불리며, 외부키,외래키,참조키 등으로 불린다.

쉽게 생각하면 FK가 정의된 테이블을 자식 테이블이라 하고, 참조되는 테이블인 PK가 있는 테이블을 부모테이블이라고 생각하면 된다.

참조하는 데이터 컬럼과 데이터 타입은 반드시 일치해야하며, 참조할 수 있는 컬럼은 기본키이거나 UNIQUE만 가능하다(보통 PK와 엮는다)

```sql
-- 부모 테이블
CREATE TABLE DEPT(
    DEPARTMENT_ID VARCHAR2(10),
    DEPARTMENT_NAME VARCHAR2(20),
    LOCATION_ID NUMBER,
    CONSTRAINT PK_DEPT_TEST PRIMARY KEY(DEPARTMENT_ID)
);

-- 자식 테이블
CREATE TABLE EMP(
    EMPNO VARCHAR2(10),
    ENAME VARCHAR2(20),
    DEPARTMENT_ID_FK VARCHAR2(10),
    CONSTRAINT FK_EMP_TEST FOREIGN KEY(DEPARTMENT_ID_FK)
    REFERENCES DEPT(DEPARTMENT_ID)
);
```

## View(뷰)

### View(뷰)란?

뷰(View)는 하나 이상의 테이블이나 다른 뷰의 데이터를 볼 수 있게 하는 데이터베이스 객체이다.

실제 데이터는 뷰를 구성하는 테이블에 담겨있지만 테이블처럼 사용할 수 있다.

더불어, 테이블 뿐만 아니라 다른 뷰를 참조해서 새로운 뷰를 만들어 사용할 수도 있다.

### View의 사용 목적은?

코딩을 하다보면 여러개의 테이블에서 필요한 정보를 뽑아 사용할 때가 많다.

이때, 뷰를 사용하면 복잡한 질의를 좀 더 편리하고 쉽게 만들어 준다.

여러 테이블의 JOIN과 GROUP BY같은 복잡한 쿼리를 뷰로 저장해놓으면, 그 다음부터는 저장한 뷰의 정보만 가져오면 되므로 좀 더 쉽고 편리하게 사용할 수 있다.

일종의 함수라고 생각하면 쉽게 이해할 수 있다.

또한, 뷰를 보면 컬럼과 데이터만 존재하므로 원천 테이블을  알 수 없어서 데이터 보안에도 유리하다.

### View(뷰)의 사용 예시

* View 생성

```sql
-- 문법
CREATE VIEW [뷰 이름] AS
SELECT절;
```

```sql
-- ex)
CREATE VIEW V_TEST01
AS
SELECT job_id, job_title, min_salary
FROM jobs;
```

다음과 같이 뷰를 생성하고 뷰를 SELECT하면 만들어둔 뷰의 SELECT문을 실행할 수 있다.

* View 수정

뷰의 수정은 REPLACE이며, CREATE대신 REPLACE를 넣으면 뷰를 수정할 수 있다.

```sql
-- 문법
REPLACE VIEW [뷰 이름] AS
SELECT절;
```

* View 제한

```sql
-- ex) 
CREATE VIEW V_TEST01
AS
SELECT department_id, department_name, location_id
FROM departments
WITH READ ONLY;
```

다음과 같이 READ ONLY를 해주면 View의 SELECT절에 해당되는 정보만 볼 수 있고, 수정은(DML)은 불가능하다.

* View 삭제

```sql
-- 문법
DROP VIEW [뷰 이름];
```

```sql
-- ex)
DROP VIEW V_TEST01;
```

View(뷰)를 삭제하는 쿼리는 위와 같다.

뷰는 다른 테이블을 참조만 하고 있기 때문에, 뷰를 삭제하더라도 실제 뷰가 참조하고 있는 테이블의 데이터들은 삭제 되지 않는다.

