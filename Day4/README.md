# Day 4

## 특수 쿼리(Query)

### CASE / DECODE

### CASE

CASE의 사용법으로는 다음과 같이 2가지가 있다.

(1)

```sql
-- (1)
SELECT employee_id, first_name, phone_number, CASE SUBSTR(phone_number, 1, 3)
WHEN '515' THEN '서울' 
WHEN '590' THEN '부산' 
WHEN '650' THEN '광주'
ELSE '기타'
END AS "지역"
FROM EMPLOYEES;
```

(2)

```sql
-- (2)
SELECT employee_id, first_name, phone_number,
CASE
WHEN SUBSTR(phone_number, 1, 3) = '515' THEN '서울'
WHEN SUBSTR(phone_number, 1, 3) = '590' THEN '부산'
WHEN SUBSTR(phone_number, 1, 3) = '650' THEN '광주'
ELSE '기타'
END AS "지역"
FROM EMPLOYEES;
```

### DECODE

DECODE는 다음과 같이 사용한다.

```sql
SELECT employee_id, first_name, phone_number,
DECODE(SUBSTR(phone_number, 1, 3), 
'515', '서울',
'590', '부산',
'650', '광주',
'기타') AS "지역"
FROM EMPLOYEES;
```

**CASE와 DECODE를 사용하는 용도는 동일하며, 자신이 편리하다고 생각하거나 원하는 문법으로 사용하면 된다.**

### OVER 함수

OVER 함수는 SELECT절에서만 사용하며, OVER 함수를 사용하면 GROUP BY나 서브쿼리를 사용하지 않고,

분석 함수(SUM, MAX, COUNT)와 집계 함수(GROUP BY, ORDER BY)를 사용할 수 있다.

다음과 같이 GROUP BY를 사용하지 않고 분석함수를 사용하면 에러가 나온다.

```sql
SELECT department_id, COUNT(*) -- 에러
FROM employees;
```

그래서 항상 이런 경우에는 GROUP BY를 사용해서 다음과 같이 수정해야했다.

```sql
SELECT department_id, COUNT(*) 
FROM employees
GROUP BY department_id;
```

하지만 OVER 함수를 사용해서 다음과 같이 나타낼 수 있다.

```sql
SELECT department_id, COUNT(*)OVER()
FROM employees;
```

### PARTITION BY

PARTITON BY절은 SELECT절 안에서 GROUP BY절처럼 사용할 수 있다.

```sql
SELECT department_id, first_name, salary, job_id,
COUNT(*)OVER(PARTITION BY department_id),
SUM(salary)OVER(PARTITION BY job_id)
FROM employees;
```

### 순위 함수

```
RANK()       1 2 3 3 5 6 -> 3등과 4등이 값이 같으면 둘다 3으로 표시하고 4등은 표시 안하고 5등으로 넘어간다.
DENSE_RANK() 1 2 3 3 4 5 -> 공동 3등일 경우에는 3등을 두번 표시하고 4등으로 넘어간다.
ROW_NUMBER() 1 2 3 4 5 6 -> OVER()함수를 같이 써야한다.
ROWNUM       1 2 3 4 5 6
```

위의 순위 함수들을 다음과 같이 사용할 수 있다.

```sql
SELECT ROWNUM, employee_id, first_name, salary,
    RANK()OVER(ORDER BY salary DESC) AS "RANK",
    DENSE_RANK()OVER(ORDER BY salary  DESC) AS "DENSE_RANK",
    ROW_NUMBER()OVER(ORDER BY salary  DESC) AS "ROW_NUMBER"
FROM employees;
```

ROWNUM 함수 같은 경우는 다른 순위 함수들과는 다음과 같은 차이점이 있다.

1. 순위(정렬을 먼저 해줘야 한다)
2. 번호를 지정해줘야 한다.
3. 범위를 지정해줘야 한다.

```sql
SELECT RNUM, employee_id, first_name, salary
FROM
(SELECT ROWNUM AS "RNUM", employee_id, first_name, salary  -- 2. 번호를 지정
FROM(  
       SELECT employee_id, first_name, salary    -- 1. 순위(정렬을 먼저 해줌)
       FROM employees
       ORDER BY salary DESC  )
    )
WHERE RNUM >= 1 AND RNUM <= 10;   -- 3. 범위를 지정
```