# 데이터 제어어

> Data Control Language - 데이터 제어어

### (1) DCL의 개념

- 데이터베이스 사용자에게 접근 권한을 부여하거나 회수하기 위해 사용하는 명령어
- 보안 및 권한 관리와 관련된 명령을 포함하여, 데이터베이스 접근을 통제
- 주로 DBA(데이터베이스 관리자)가 시스템 보안을 위해 사용

### (2) DCL의 주요 명령어

- GRANT: 권한 부여
- REVOKE: 부여한 권한 회수

# 권한 종류

|      종류      | 설명                                                    |
| :------------: | :------------------------------------------------------ |
|     SELECT     | 테이블 데이터를 조회할 수 있는 권한                     |
|     INSERT     | 데이터를 추가할 수 있는 권한                            |
|     UPDATE     | 특정 컬럼 또는 테이블 전체 데이터를 수정할 수 있는 권한 |
|     DELETE     | 데이터를 삭제할 수 있는 권한                            |
|     ALTER      | 테이블 구조를 변경할 수 있는 권한                       |
|     INDEX      | 인덱스를 생성할 수 있는 권한                            |
|   REFERENCES   | 외래키(FK)의 참조 대상이 될 수 있도록 허용하는 권한     |
| ALL PRIVILEGES | 모든 권한을 부여할 때 사용                              |

# 조작 방법

## (1) GRANT - 권한 부여

1. 개념
   - 특정 사용자에게 테이블 또는 객체에 대한 권한 부여
   - `WITH GRANT OPTION` 을 통해 다른 사용자에게 다시 권한을 부여할 수 있는 권한 확장이 가능

2. 기본 문법

   > GRANT 권한 리스트 ON 객체명 TO 사용자명 [WITH GRANT OPTION];

3. 예제
   - userA에게 Student 테이블의 조회 권한 부여

     ```sql
     GRANT SELECT ON Student TO userA;
     ```

   - userA에게 Student 테이블의 조회, 삽입 권한 부여

     ```sql
     GRANT SELECT, INSERT ON Student TO userA;
     ```

   - 다른 사용자에게 권한을 재부여할 수 있도록 허용
     ```sql
     GRANT SELECT, INSERT ON Student TO userA WITH GRANT OPTION;
     ```

## (2) REBOKE - 권한 회수

1. ## 개념

- 사용자에게 부여했던 권한 회수

2. 기본 문법

   > REVOKE 권한 리스트 ON 객체명 FROM 사용자명;

3. ## 예제
   - userA의 조회 권한 회수

     ```sql
     REVOKE SELECT ON Student FROM userA;
     ```

   - userA의 조회, 삽입 권한 회수

     ```sql
     REVOKE SELECT, INSERT ON Student FROM userA;
     ```
