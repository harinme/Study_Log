# SELECT 집합 연산

### 1. 집합 연산자의 개념

- 두개 이상의 SELECT 결과를 수학적 집합 개념에 따라 결합하여 새로운 결과를 얻는 연산
- 조인을 사용하지 않고도 서로 연관된 데이터의 관계를 비교, 결합할 수 있음
- 집합 연산을 사용하려면 각 SELECT 절의 컬럼 개수와 데이터 타입이 동일해야 함

### 2. 집합 연산자의 종류

|          종류          | 설명                                                                             |
| :--------------------: | :------------------------------------------------------------------------------- |
|         UNION          | 두 SELECT 결과를 합집합으로 결합하며, 중복 행은 제거된다.                        |
|       UNION ALL        | 두 SELECT 결과를 합집합으로 결합하며, 중복 행도 포함한다.                        |
|       INTERSECT        | 두 SELECT 결과의 교집합을 반환하며, 중복 행은 제거된다.                          |
| EXCEPT (Oracle: MINUS) | 첫 번째 SELECT 결과에서 두 번째 결과를 뺀 차집합을 반환하며, 중복 행은 제거된다. |

### 3. 집합 연산자 사용 형태

- UNION / UNION ALL

  ```sql
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블A
  UNION [ALL]
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블B;
  ```

- INTERSECT

  ```sql
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블A
  INTERSECT
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블B;
  ```

- EXCEPT(Oracle: MINUS)
  ```sql
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블A
  EXCEPT  -- Oracle은 MINUS
  SELECT 컬럼1, 컬럼2 ...
  FROM 테이블B;
  ```

### 4. 집합 연산자 사용 예

[수강정보]

| 순번 | 과목명 | 이름   |
| ---- | ------ | ------ |
| 0001 | 국어   | 홍길동 |
| 0002 | 영어   | 홍길동 |
| 0003 | 수학   | 홍길동 |
| 0004 | 도덕   | 홍길동 |
| 0005 | 국어   | 홍길동 |
| 0006 | 수학   | 홍길동 |
| 0007 | 사회   | 홍길동 |
| 0008 | 과학   | 홍길동 |

- UNION - 합집합(중복 제거)

  ```sql
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '이홍직'
  UNION
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '홍길동';
  ```

  **[UNION 결과]**
  | 과목명 |
  | :----: |
  | 국어 |
  | 영어 |
  | 수학 |
  | 도덕 |
  | 사회 |
  | 과학 |

- UNION ALL - 합집합(중복 포함)

  ```sql
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '이홍직'
  UNION ALL
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '홍길동';
  ```

  **[UNION ALL 결과]**

  | 과목명 |
  | :----: |
  |  국어  |
  |  영어  |
  |  수학  |
  |  도덕  |
  |  국어  |
  |  수학  |
  |  사회  |
  |  과학  |

- INTERSECT - 교집합

  ```sql
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '이홍직'
  INTERSECT
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '홍길동';
  ```

  **[INTERSECT 결과]**
  | 과목명 |
  | :----: |
  | 국어 |
  | 수학 |

- EXCEPT / MINUS - 차집합

  ```sql
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '이홍직'
  EXCEPT
  SELECT 과목명 FROM 수강정보 WHERE 이름 = '홍길동';
  ```

  **[EXCEPT 결과]**

  | 과목명 |
  | :----: |
  |  영어  |
  |  도덕  |
