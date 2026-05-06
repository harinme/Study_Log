# SQL 활용 & 관계 데이터 언어

> Data Definition Language - 데이터 정의어

## SQL(Structured Query Language)

### (1) SQL의 개념

- 데이터베이스에서 데이터를 처리하기 위해 사용되는 구조적인 질의 언어
- 관계형 데이터베이스 관리 시스템(RDBMS)을 위해 설계된 특수 목적의 프로그래밍 언어

### (2) SQL의 특징

- 구문이 영어 문장과 유사하여 배우기 쉽고 사용이 편리
- 데이터 연산은 절차적으로 처리되지 않으며, 집합 단위로 실행됨
- SQL은 대소문자를 구별하지 않음

### (3) SQL 문법의 종류

1. Data Definition Language(DDL) - 데이터 정의어
   - 데이터베이스 객체를 정의하는 명령어
   - CREATE, ALTER, DROP, RENAME, TRUNCATE

2. Data Manipulation Language(DML) - 데이터 조작어
   - 데이터베이스 내 데이터를 조작(조회, 추가, 수정, 삭제)하는 명령어
   - SELECT, INSERT, UPDATE, DELETE

3. Data Control Language(DCL) - 데이터 제어어
   - 데이터베이스에 접근할 권한을 부여하거나 회수하는 명령어
   - GRANT, REVOKE

4. Transaction Control Language(TCL) - 트랜잭션 제어어 _\* 보통 시험에선 DCL로 분류가 됨_
   - 트랜잭션 단위로 작업 결과를 제어하는 명령어
   - COMMIT, ROLLBACK, SAVEPOINT

## DDL(Data Definition Language)

### (1) 데이터 정의어의 개념

- 데이터를 저장하는 테이블 및 다양한 객체를 정의하는데 사용되는 언어
- 데이터를 담는 '그릇'을 정의하는 역할, 데이터베이스의 구조를 생성, 수정, 삭제하는 명령어들을 포함

### (2) 데이터 정의어로 정의되는 객체 유형

|      종류      | 설명                                                                |
| :------------: | :------------------------------------------------------------------ |
| 테이블 (Table) | 데이터를 저장하는 공간이다.                                         |
|   뷰 (View)    | 하나 이상의 물리적 테이블로부터 유도되는 논리 테이블이다.           |
| 인덱스 (Index) | 특정 컬럼에 대해 생성하며, 데이터 검색 속도를 높이기 위한 구조이다. |

## 조작 방법

### (1) CREATE

1. 개념
   <details>
   - 데이터 베이스 객체를 새로 생성할 때 사용
   - 테이블, 뷰, 인덱스, 사용자, 시퀀스 등 다양한 객체를 정의할 수 있음
   - 스키마 구조를 설계하는 단계에서 가장 많이 사용되며, 데이터가 저장될 그릇을 만듦.

     </details>

2. 테이블 생성(CREATE TABLE)
   - 테이블 생성

   ```sql
   CREATE TABLE 테이블명 (
     컬럼명 DATA_TYPE [제약 조건],
     컬럼명 DATA_TYPE [제약 조건],
     컬럼명 DATA_TYPE [제약 조건]
     );
   ```

   - 주요 컬럼 제약조건
     | 종류 | 설명 |
     | :-----------: | :-------------------------------------------- |
     | NOT NULL | NULL 입력 불가 |
     | UNIQUE | 중복값 불가 |
     | PRIMARY KEY | 기본키 설정 (고유값 + NOT NULL) |
     | CHECK | 입력값 검증 (예: CHECK (성별 IN ('M', 'F'))) |
     | DEFAULT | 기본값 지정 (예: DEFAULT 'M') |

3. 뷰 생성

   > CREATE VIEW 테이블명 **_AS_**

   ```sql
   -- Student 테이블에서 stu_no, name 컬럼을 조회하는 View 생성
   CREATE VIEW V_Student AS
   SELECT stu_no, name
   FROM Student;
   ```

4. 인덱스 생성

   > CREATE INDEX 테이블명 **_ON_**

   ```sql
   -- Student 테이블에 idx_student 이름의 인덱스 생성 (name 컬럼 기준)
   CREATE INDEX idx_student ON Student(name);
   ```

### (2) ALTER

1. 개념
   - 기존에 생성된 데이터베이스 객체의 구조를 변경할 때 사용하는 명령어
   - 주로 테이블의 컬럼 추가·수정·삭제, 제약조건 변경, 컬럼명 변경 등에 사용됨
   - 데이터를 보존한 상태에서 구조만 변경할 수 있어 유지보수 과정에서 자주 사용됨

2. 테이블 구조 변경(ALTER TABLE)
   - 기존 테이블에 새로운 컬럼 추가 \- **ADD**

     > ALTER TABLE 테이블명 ADD 컬럼 데이터타입 [제약조건];

   - 컬럼 수정 \- **MODIFY**
     - 컬럼의 데이터 타입, 길이, 제약조건 등을 변경
       > ALTER TABLE 테이블명 MODIFY (컬럼명 데이터타입 [제약조건]);

   - 기존 컬럼 삭제(삭제된 컬럼의 데이터도 함께 사라짐) \- **DROP COLUMN**
     > ALTER TABLE 테이블명 DROP COLUMN 컬럼명;

- 컬럼명 변경 \- **RENAME COLUMN**
  - 컬럼의 이름만 변경하고 데이터는 보존
    > ALTER TABLE 테이블명 RENAME COLUMN 기존 이름 TO 새로운 이름;

3. 인덱스 구조 변경(ALTER INDEX)
   - 인덱스 이름 변경 \- **RENAME**

     > ALTER INDEX 기존 인덱스명 RENAME TO 새로운 인덱스명;

   - 인덱스 재구성 \- **REBUILD**
     - 인덱스의 구조를 다시 생성하여 조각화(Fragmentation) 제거 효과를 얻음
       > ALTER INDEX 인덱스명 REBUILD;

   - 인덱스 비활성화 \- **UNUSABLE**
     - 인덱스를 사용할 수 없는 상태로 만듦
       > ALTER INDEX 인덱스명 UNUSABLE;

### (3) DROP

1. 개념
   - 기존에 생성된 데이터베이스 객체를 완전히 삭제할 때 사용하는 명령어
   - 테이블, 뷰, 인덱스, 시퀀스, 사용자 등 다양한 객체를 삭제 가능
   - 객체를 삭제하면 데이터 뿐 아니라 구조 자체도 사라지며, 복구가 어려울 수 있음

2. 테이블 삭제(DROP TABLE)
   - 테이블의 구조와 그 안의 모든 데이터가 함께 삭제됨
     > DROP TABLE 테이블명;

3. 인덱스 삭제(DROP INDEX)
   - 인덱스를 제거하여 저장공간을 확보하거나 불필요한 인덱스를 정리할 때 사용
     > DROP INDEX 인덱스명;

### (4) TRUNCATE

1. 개념
   - 테이블의 구조는 유지하면서 데이터만 전체 삭제할 때 사용하는 명령어
   - DELETE와 달리 로그가 최소화되어 매우 빠름
   - WHERE 조건을 사용할 수 없고, 항상 전체 삭제만 가능

2. 테이블 데이터 전체 삭제(TRUNCATE TABLE)
   - 테이블의 모든 데이터가 즉시 삭제되며, 공간 또한 초기화 됨
     > TRUNCATE TABLE 테이블명;
