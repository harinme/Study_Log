# 예외 처리

## 1. 예외 처리

### (1) 예외 처리의 개념

- 예외(Exception): 프로그램 실행 중에 발생할 수 있는 오류 상황을 의미함
- 예외 처리(Exception Handling): 프로그램 실행 중에 발생할 수 있는 예외를 대비하여, 프로그램의 비정상 종료를 방지하고 안정적으로 실행되도록 처리하는 기술

### (2) 예외 처리의 구조

- 자바에서는 try-catch-finally를 사용하여 예외를 처리한다.
- 블록 설명

  **try**
  - 예외가 발생할 가능성이 있는 코드를 작성하는 블록

  **catch**
  - 예외가 발생했을 때 실행되는 블록
  - 발생한 예외 객체를 매개변수로 받아 처리

  **finally**
  - 예외 발생 여부와 관계없이 항상 실행되는 블록
  - 자원 정리(예: 파일 닫기, 네트워크 연결 해제) 등에 사용됨

### (3) 예외 처리 예제

```java
public class ExceptionExample {
  public static void main(String[] args) {
    try {
      int result = 10 / 0; // ArithmeticException 발생
      System.out.println("결과: " + result);
    } catch (ArithmeticException e) {
      System.out.println("예외 발생: " + e.getMessage());
    } finally {
      System.out.println("프로그램 종료");
    }
  }
}

// [실행 결과] >> JAVA는 0으로 나누기 불가능
// 예외 발생: / by zero
// 프로그램 종료


```

### (4) 예외의 전파

- 메서드에서 예외를 처리하지 않고 호출한 메서드로 전달할 수 있다.
- throws 키워드를 사용하여 선언한다.
- 예제
  ```java
  public void divide(int a, int b) throws ArithmeticException {
    if (b == 0) {
      throw new ArithmeticException("0으로 나눌 수 없습니다.");
    }
    System.out.println(a / b);
  }
  ```

### (5) 자바의 주요 예외 클래스

#### 1) IOException

- 입출력 작업 중 발생하는 예외
- 예: 파일 읽기/쓰기 오류

#### 2) SQLException

- 데이터베이스 작업 중 발생하는 예외

#### 3) NullPointerException

- 객체가 null인데 메서드 호출이나 필드 접근을 시도할 때 발생

#### 4) ArrayIndexOutOfBoundsException

- 배열의 유효범위를 벗어난 인덱스에 접근할 때 발생

#### 5) ArithmeticException

- 잘못된 산술 연산(예: 0으로 나누기) 시 발생
