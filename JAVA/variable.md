# 변수의 유효범위

## 1. 변수의 유효범위

### (1) 지역변수(Local Variables)

- 메서드나 블록 내부에서 선언된 변수로, 해당 블록이 실행되는 동안에만 유효함
- 메서드 호출이 끝나면 메모리에서 소멸됨
- 초기화하지 않으면 사용할 수 없음
- 예제
  ```java
  public class Example {
    public void printNumber() {
      int num = 10; // 지역변수
      int num2; // 컴파일 오류 발생
      System.out.println(num);
      System.out.println(num2);
    }
  }
  ```

### (2) 인스턴스 변수(Instance Variables)

- 클래스 내부에 선언되며, 객체가 생성될 때마다 각 객체는 별도의 복사복을 가짐
- 객체가 생성되는 동안 유효하며, 객체가 소멸하면 함께 소멸함
- 초기화하지 않으면 기본값으로 초기화됨
- 예제
  ```java
  public class Example {
    int num; // 인스턴스 변수
    public void printNumber() {
      System.out.println(num); // 기본값인 0 출력
    }
  }
  ```

### (3) 클래스 변수(Class Variables)

- static 키워드로 선언된 변수로, 클래스 로드 시 메몰리에 적재되며 모든 객체가 공유함
- 프로그램 종료 시까지 유효함
- 클래스 이름으로 접근이 가능
- 초기화하지 않으면 기본값으로 초기화됨
- 예제
  ```java
  public class Example {
    static int num = 20; // 클래스 변수
    public void printNumber() {
      System.out.println(num);
    }
  }
  ```

## 2. 상속 관계에서 변수의 유효범위

### (1) 변수 은닉(Shadowing)

- 부모 클래스와 자식 클래스에 같은 이름의 변수가 있을 때, 자식 클래스의 변수는 부모 클래스의 변수를 가림
- 부모 클래스의 변수는 `super` 키워드를 사용하여 접근할 수 있음
- 참조 변수의 타입에 따라 변수에 접근함
- 예제

  ```java
  class Parent {
    int num = 10; // 부모 클래스 변수
  }

  class Child extends Parent {
    int num = 20; // 자식 클래스 변수(은닉)
    public void printNumbers() {
      System.out.println("Child num: " + num);
      System.out.println("Parent num: " + super.num);
    }
  }

  public class Test {
    public static void main(String[] args) {
      Child child = new Child();
      child.printNumbers();
    }
  }

  // [실행 결과]
  // Child num: 20
  // Parent num: 10
  ```

### (2) 변수 접근

- 참조 변수의 타입에 따라 접근할 수 있는 변수를 결정함
- 예제

  ```java
  class Parent {
    int num = 10;
  }

  class Child extends Parent {
    int num = 20;
  }

  public class Test {
    public static void main(String[] args) {
      Parent obj = new Child();
      System.out.println("Variable: " + obj.num); // Parent의 변수
    }
  }
  // [실행 결과]
  // Variable: 10
  ```

### (3) 메서드에서의 변수 접근

- 변수에 접근할 때는 참조 변수의 타입에 따라 결정됨
- 예제

  ```java
  class Parent {
    int num = 10; // 부모 클래스 변수
    public void print() {
      System.out.println("num: " + num); // 부모 클래스의 num
    }
  }

  class Child extends Parent {
    int num = 20; // 자식 클래스 변수 (부모의 num 은닉)
    public void print() {
      System.out.println("num: " + num); // 자식 클래스의 num
    }
  }

  class Test {
    public static void main(String[] args) {
      Parent obj1 = new Parent();
      Parent obj2 = new Child();
      Child obj3 = new Child();
      obj1.print(); // Parent의 print() 호출 → Parent의 num 출력
      obj2.print(); // Child의 print() 호출 → Child의 num 출력
      obj3.print(); // Child의 print() 호출 → Child의 num 출력
    }
  }

  // [실행 결과]
  // num: 10
  // num: 20
  // num: 20
  ```

