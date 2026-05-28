# static 변수와 메서드

## 1. static 변수

### (1) static 변수의 개념

- static 변수는 클래스에 속하는 변수로, 클래스의 모든 인스턴스가 공유하여 사용함
- 클래스가 메모리에 로드될 때 초기화되며, 프로그램이 종료될 때까지 메모리에 유지됨

### (2) static 변수의 특징

- 클래스의 모든 인스턴스에서 동일한 값을 공유함
- 하나의 인스턴스에서 값을 변경하면 다른 모든 인스턴스에 반영됨
- 인스턴스가 아니라 클래스 자체에 소속됨
- 따라서 클래스 이름으로 직접 접근이 가능함
- static 변수는 클래스가 메모르에 로드될 때 한 번만 할당됨
- 인스턴스를 생성하지 않아도 사용할 수 있음
- 인스턴스 변수와 달리 클래스의 인스턴스 없이도 접근이 가능함
- 모든 인스턴스에 공유되어야 하는 데이터나 상수에 적합함

### (3) static 변수 사용 예제

```java
class Example {
  static int sharedValue = 0; // static 변수
  void inValue() {
    sharedValue++;
  }
}

public class Main {
  public static void main(String[] args) {
    Example obj1 = new Example();
    Example obj2 = new Example();
    obj1.inValue();
    System.out.println(Example.sharedValue); // 출력: 1
    obj2.inValue();
    System.out.println(Example.sharedValue); // 출력: 2
    // 클래스 이름으로 접근
    Example.sharedValue = 5;
    System.out.println(Example.sharedValue); // 출력: 5
  }
}
```

## 2. static 메서드

### (1) static 메서드의 개념

- static 메서드는 클래스에 속하는 메서드로, 객체 생성 없이 호출할 수 있음
- 클래스 레벨에서 동작하므로 인스턴스 변수 및 인스턴스 메서드에 직접 접근할 수 없음
- 보통 객체 상태와 무관한 공통 기능을 제공할 때 사용함

### (2) static 메서드의 특징

- 클래스 이름으로 직접 호출할 수 있음
- 메모리에 클래스가 로딩될 때 함께 로딩됨
- 인스턴스가 없어도 호출할 수 있으므로 독립적이고 공통적인 작업에 적합함
- 인스턴스 변수 사용 불가, 인자로 값을 넘기거나, static 변수만 사용할 수 있음

### (3) static 블록(정적 초기화 블록)

- static 블록은 클래스가 로딩될 때 단 한번만 실행되는 영역임
- static 변수 초기화가 단순하지 않을 때 사용함
- static 메서드와 마찬가지로 인스턴스 없이 클래스만으로 동작함
- 여러 개 선언 가능하며, 작성된 순서대로 실행됨
