# 람다식, 제너릭, 객체 비교

## 1. 람다식(Lambda Expression)

### (1) 람다식의 개념

- 람다식은 익명 함수를 간단하게 표현하는 문법으로, 함수형 프로그래밍을 자바에서 지원하기 위해 도입됨
- 메서드를 하나의 식으로 나타내며, 불필요한 코드를 줄이고 간결한 코드를 작성할 수 있음
- 람다식은 함수형 인터페이스(Functional Interface)를 구현하기 위한 문법임

### (2) 람다식의 특징

- 함수형 인터페이스를 구현하는 익명 객체를 간단한 문법(→)으로 표현함
- 불필요한 new 연산, 클래스 선언 없이 즉석에서 함수 구현이 가능함
- 코드가 간결하고 가독성이 높음
- 내부적으로는 익명 클래스 객체를 생성하는 방식과 동일하게 동작함

### (3) 람다식 예제

```java
@FunctionalInterface
interface MyFunc {
  int add(int x, int y);
}

class Main {
  public static void main(String[] args) {
    MyFunc f = (a, b) -> a + b;
    System.out.println(f.add(3, 4)); // 7
  }
}
```

## 2. 제너릭(Generic)

### (1) 제너릭의 개념

- 제너릭은 클래스나 메서드에서 사용할 데이터 타입을 외부에서 지정할 수 있도록 하는 기능임
- 타입 안정성을 보장하고, 형변환(Casting)을 최소화 함
- List, Map 등 컬렉션 프레임워크에서 널리 사용됨

### (2) 제너릭의 특징

- 컴파일 시 타입을 체크하여 타입 안정성(Type Safety)을 제공함
- 실행 중 ClassCastException을 줄임
- <> 안에 타입 파라미터를 작성한다 ex: `List<Strig>, List<Integer>`

### (3) 제너릭 예제

```java
class Box<T> {
  private T value;
  public void set(T value) { this.value = value; }
  public T get() { return value; }
}

class Main {
  public static void main(String[] args) {
    Box<String> b1 = new Box<>();
    b1.set("Hello");

    Box<Integer> b2 = new Box<>();
    b2.set(100);

    System.out.println(b1.get()); // Hello
    System.out.println(b2.get()); // 100
  }
}
```

## 3. 객체 비교 (==, equals)

### (1) 객체 비교의 개념

- 자바에서 두 객체를 비교할 때는 == 연산자와 equals() 메서드를 사용함
- 두 연산은 상요하는 목적이 다르며, 비교 방식도 다름

### (2) 객체 비교의 특징

- ==(동일성 비교, Identity)
  - 두 변수가 같은 객체(같은 주소)를 참조하는지를 비교함
  - 기본형은 값 비교하고, 참조형은 주소를 비교함
  - → 기본형 `int a = 10; double a = 10; string a = "abc"`
  - → 참조형 `Integer a = new 10;` 참조 타입을 선언한 형태
- equals() (동등성 비교,Equality)
  - 두 객체의 내용이 같은지 비교함
  - String, Wrapper, 사용자 정의 클래스는 equals()를 재정의하여 내용 비교로 변경이 가능함

### (3) 객체 비교 예제

```java
class Main {
  public static void main(String[] args) {
    String s1 = new String("Java");
    String s2 = new String("Java");
    System.out.println(s1 == s2);      // false (주소 비교)
    System.out.println(s1.equals(s2)); // true (내용 비교)
  }
}
```
