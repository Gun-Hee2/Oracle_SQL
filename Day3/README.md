# Day3

## JOIN(Oracle)

2개 이상의 테이블에서 데이터를 검색하기 위해서 사용하며, 보통 2개 이상의 행(row)들의 공통된 값(기본키, 외래키)를 사용해서 JOIN한다.   


기본키(Primary Key): 테이블에서 중복이 되지 않는 키 -> PK   
외래키(Foreign Key): 다른 테이블에서 Primary Key인 경우가 많다. -> FK

FROM절에 2개 이상의 테이블을 명시한다.(View, Subquery도 가능)

공통된 컬럼이 없다면, 두 테이블의 공통컬럼을 가진 다른 테이블과 JOIN한 후 목표 테이블과 JOIN한다.

![](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FbDdOmb%2FbtreY05LFoe%2FOgK9oB1pU24wnLTnz29Km0%2Fimg.png)

    JOIN 종류
    inner join = 교집합       *****(사용 빈도)
    full outer join = 합집합
    cross join
    outer join
        left join            ***
        right join           ***
    self join                *****

### Oracle Join

Ansi Join(표준 SQL)

```sql
SELECT *
        FROM TABLE_A T1

        LEFT OUTER JOIN
        TABLE_B T2
        ON T1.COULMN = T2.COLUMN;
```

Oracle Join

```sql
SELECT *
       FROM TABLE_1 T1, TABLE_2 T2
       WHERE T1.COLUMN = T2.COLUMN;
```

-> Ansi Join은 Join종류를 명시하며 테이블을 하나하나씩 붙여 나가는 구조이지만, Oracle Join은 가져오고자 하는 컬럼이 포함된 모든 테이블들을 일단 FROM절에 기술한다. 그리고 WHERE절에 Join조건을 명시한다.

### Inner Join

```sql
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name 
FROM employees e, departments d
WHERE e.department_id = d.department_id;
```

### Cross Join(사용 빈도 거의 X)

```sql
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d;
```

### Left/Right Outer Join

Ansi Join에 비교하면, Inner Join은 어차피 공통적인 레코드만 SELECT하니 문제가 없어 보이지만, Outer Join은 어떤 테이블이 중심이 되는지 명확하게 알 수가 없다.

따라서, Outer Join시에는 조인 당하는 테이블에 반드시 (+)표기를 해줘야 한다.

* Left Outer Join

```sql
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+);
```

* Right Outer Join

```sql
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
```

### Full Outer Join

Oracle Join문법으로는 Ansi Join과 같이 Full Outer Join이 불가능하다.

따라서, UNION이라는 연산자를 사용한다.

```sql
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id = d.department_id(+)
UNION
SELECT e.employee_id, e.first_name, e.department_id, d.department_id, d.department_name
FROM employees e, departments d
WHERE e.department_id(+) = d.department_id;
```

### Self Join(동일한 테이블을 Join)

```sql
SELECT a.employee_id, a.first_name, a.manager_id, b.employee_id, b.first_name
FROM employees a, employees b  -- a: 사원 b: 상사
WHERE a.manager_id = b.employee_id;
```

## Sub Query

SQL문 내에 쓰인 SELECT문을 의미하며, Query안에 Query를 의미한다.

이 때 외부에 있는 SQL문을 메인쿼리(Main Query)라고 부른다.

Sub Query는 SELECT절, FROM절, WHERE절등 다양하게 사용할 수 있다.

### SELECT절

```SQL
-- 사원번호, 월급의 총 합, 월급의 평균
SELECT employee_id, 
      (SELECT SUM(salary) FROM employees),
      (SELECT TRUNC(AVG(salary)) FROM employees)
FROM employees;
```

 FROM절

```sql
-- 업무별로 급여의 합계, 인원 수, 사원 명, 월급
SELECT e.employee_id, e.salary, e.job_id, j."급여의 합계", j."인원 수"
FROM employees e, (SELECT job_id, SUM(salary) AS "급여의 합계", COUNT(*) AS "인원 수" 
                   FROM employees 
                   GROUP BY job_id) j
WHERE e.job_id = j.job_id;        
```

WHERE절

```sql
-- 부서별로 가장 급여를 적게 받는 사원과 같은 급여를 받는 사원
SELECT first_name, salary, department_id
FROM employees
WHERE salary IN(SELECT MIN(salary) FROM employees GROUP BY department_id)
ORDER BY department_id ASC;
```

