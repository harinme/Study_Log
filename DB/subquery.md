# 서브쿼리(Subquery)

## 1. 서브쿼리(Subquery)의 개념

- 서브쿼리(Subquery)란, 하나의 SQL문 안에 포함된 또 다른 SELECT 문을 말함
- 보통 괄호()로 감싸서 사용하며, 메인 쿼리(Main Query)에 값을 제공하는 역할을 함
- SELECT, FROM, WHERE, HAVING 절 등 다양한 위치에서 사용할 수 있음
- 반환되는 값의 개수에 따라 단일행 서브쿼리, 다중행 서브쿼리, 다중열 서브퀴리 등으로 구분함
- 메인 쿼리의 각 행마다 서브쿼리를 다시 수행하는 형태를 상관 서브쿼리라고 함

## 서브쿼리의 종류

### (1) 단일행 서브쿼리(Single-row Subquery)

- 서브쿼리의 결과가 반드시 1행(한 개의 값)만 나오는 형태
- 단일 값만 비교하므로 `=, >, <, >=, <=, <>` 등 단일 비교 연산자와 함께 사용됨
- 예시
  <details>

  [학생]

  | sid | name |
  | :-: | :--: |
  |  1  | Kim  |
  |  2  | Park |
  |  3  | Han  |

  [성적]

  | sid | score |
  | :-: | :---: |
  |  1  |  90   |
  |  2  |  75   |
  |  3  |  80   |

  ```sql
  SELECT name, score FROM 학생 JOIN 성적 ON 학생.sid = 성적.sid WHERE score = (SELECT MAX(score) FROM 성적);
  ```

  [결과]

  | name | score |
  | :--: | :---: |
  | Kim  |  90   |

  </details>

### (2) 다중행 서브쿼리(Multi-row Subquery)

- 서브쿼리의 결과가 여러 행(값 여러 개)로 반환되는 형태
- 여러 값과 비교하기 위해 `IN, ANY, ALL, EXISTS`와 같은 연산자를 사용함
- 주로 특정 조건을 만족하는 집합에 포함되는 지를 판단할 때 사용됨
- 예시
  <details>

  [부서]

  | 부서번호 | 부서명 |
  | :------: | :----: |
  |    10    | 총무부 |
  |    20    | 영업부 |
  |    30    | 개발부 |

  [사원]

  | 사번 | 이름 | 부서번호 |
  | :--: | :--: | :------: |
  | 1001 | Kim  |    10    |
  | 1002 | Park |    20    |
  | 1003 | Lee  |    10    |
  | 1004 | Choi |    20    |

  ```sql
  SELECT 부서명 FROM 부서 WHERE 부서번호 IN (SELECT 부서번호 FROM 사원);
  ```

  [결과]

  | 부서명 |
  | :----: |
  | 총무부 |
  | 영업부 |

  </details>

### (3) 다중열 서브퀴리(Multi-column Subquery / Row Subquery)

- 서브쿼리가 여러 컬럼(열)을 동시에 반환하는 형태
- 메인 쿼리에서도 여러 컬럼을 묶어서 비교해야 할 때 사용
- `(컬럼1, 컬럼2) IN (서브쿼리)` 형태처럼 튜플(Tuple) 비교를 사용할 수 있음
- 예시
  <details>

  [학생]

  | 학번 | 이름 | 학년 |
  | :--: | :--: | :--: |
  |  1   | Kim  |  1   |
  |  2   | Park |  2   |
  |  3   | Han  |  3   |

  [성적]

  | 학번 | 과목 | 점수 |
  | :--: | :--: | :--: |
  |  1   |  DB  |  90  |
  |  2   |  DB  |  85  |
  |  3   |  OS  |  88  |

  ```sql
  SELECT S.학번 FROM 학생 S JOIN 성적 G ON S.학번 = G 학번 WHERE (S.학년, G.과목) IN ( SELECT S2.학년, G2.과목 FROM 학생 S2 JOIN 성적 G2 ON S2.학번 = G2.학번 WHERE S2.학년 = 2);
  ```

  </details>

### (4) 상관 서브퀴리(Correlated Subquery)

- 서브쿼리 안에서 메인 쿼리의 컬럼을 참조하는 서브쿼리
- 메인 쿼리의 각 행마다 서브쿼리가 한 번씩 실행됨
- 주로 EXISTS, NOT EXISTS와 함께 사용하여 존재 여부를 검사할 때 많이 쓰임

- 예시
  <details>
  [사원]

  | 사번 | 이름 | 부서hicken호 |
  | :--: | :--: | :----------: |
  | 1001 | Kim  |      10      |
  | 1002 | Park |      20      |
  | 1003 | Lee  |      30      |

  [급여]

  | 사번 | 급여 |
  | :--: | :--: |
  | 1001 | 300  |
  | 1003 | 400  |

  ```sql
  SELECT 이름
  FROM 사원 S WHERE EXISTS (
    SELECT 1
    FROM 급여 G
    WHERE G.사번 = S.사번
  );
  ```

  [결과]

  | 이름 |
  | :--: |
  | Kim  |
  | Lee  |

  </details>

### (5) 인라인 뷰(Inline View, From 절 서브쿼리)

- FROM 절에서 서브쿼리를 사용하여 임시 테이블 처럼 사용하는 형태
- 복잡한 SELECT 결과를 한 번 더 감싸서 다시 조회할 때 유용함
- 서브쿼리 뒤에 별칭(Alias)을 주어 일반 테이블처럼 사용할 수 있음

- 예시
  <details>
  [학생]

  | 학번 | 이름 | 점수 |
  | :--: | :--: | :--: |
  |  1   | Kim  |  90  |
  |  2   | Park |  80  |
  |  3   | Han  |  95  |
  |  4   | Choi |  70  |

  ```sql
    SELECT 학번, 이름, 점수
    FROM (
      SELECT 학번, 이름, 점수
      FROM 학생
      WHERE 점수 >= 80
    )
    WHERE 이름 LIKE 'K%';
  ```

  [결과]

  | 학번 | 이름 | 점수 |
  | :--: | :--: | :--: |
  |  1   | Kim  |  90  |

  </details>
