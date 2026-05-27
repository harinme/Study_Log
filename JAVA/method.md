# 메서드

## 1. 메서드 오버로딩

### (1) 오버로딩의 개념

- 같은 이름의 메서드를 인자만 다르게 하여 중복 정의하는 것을 의미함
- 메서드 호출 시 전달되는 매개변수의 수, 타입, 순서에 다라 서로 다른 메서드가 호출됨

### (2) 오버로딩의 특징

- 메서드 이름은 동일하지만, 매개변수의 개수, 타입, 순서가 다름
- 오버로딩은 매개변수의 시그니처로만 구분되며, 반환타입이 다르더라도 오버로딩되지 않음
- 호출될 메서드는 컴파일 시점에 결정된다

### (3) 오버로딩 예제

```java
class Calculator {
  int add(int a, int b) {
    return a + b;
  }
  int add(int a, int b, int c) {
    return a + b + c;
  }
  double add(double a, double b) {
    return a + b;
  }
  double add(int a, double b) {
    return a + b;
  }
}

public class Main {
  public static void main(String[] args) {
    Calculator calc = new Calculator();
    System.out.println(calc.add(10, 20));      // 30
    System.out.println(calc.add(10, 20, 30));  // 60
    System.out.println(calc.add(10.5, 20.5));  // double → 31.0
    System.out.println(calc.add(10, 20.5));    // 30.5
  }
}
```

## 2. 메서드 오버라이딩

### (1) 오버라이딩의 개념

- 상속 관계에서 부모 클래스에서 정의된 메서드를 자식 클래스에서 다시 재정의하는 것을 의미함
- 부모 클래스의 메서드를 그대로 사용하는 대신, 자식 클래스에서 필요에 따라 동작을 변경할 수 있음

### (2) 오버라이딩의 특징

- 부모 클래스의 메서드를 자식 클래스에서 재정의하는 경우에만 사용됨
- 메서드 이름, 매개변수 타입 및 개수, 반환 타입이 부모 클래스와 동일해야 함
- @Override 어노테이션을 사용하여 오버라이딩을 명시적으로 표시하는 것이 좋음

### (3) 오버라이딩 예제

```java
class Animal {
  void sound() {
    System.out.println("Animal");
  }
}

class Dog extends Animal {
  @Override
  void sound() {
    System.out.println("Dog");
  }
}

public class Main {
  public static void main(String[] args) {
    Animal animal = new Animal();
    animal.sound(); // 부모 클래스 메서드 호출
    Animal dog = new Dog();
    dog.sound(); // 자식 클래스에서 오버라이딩된 메서드 호출
  }
}

// [실행 결과]
// Animal
// Dog
```

## 3. 하이딩

### (1) 하이딩의 개념

- 상위 클래스의 static 메서드를 하위 클래스에서 같은 이름과 시그니처로 다시 선언하는 것을 의미함
- 상속 관계에서 static 메서드는 클래스 소속으로 동작하므로, 런타임 다형성이 적용되지 않음
- 하이딩된 메서드는 참조 변수의 타입에 따라 호출됨

### (2) 하이딩의 특징

- 메서드 이름과 매개변수의 시그니처가 상위 클래스의 static 메서드와 동일해야 함
- 하이딩은 static 메서드에서만 발생하며, 인스턴스 메서드에서 적용되지 않음
- 하이딩된 메서드는 객체의 실제 타입과 상관없이 참조 변수의 타입에 따라 호출됨
- 하이딩은 부모 클래스의 static 메서드를 대체하거나 오버라이딩하지 않음

### (3) 하이딩 예제

```java
class Parent {
  static void display() {
    System.out.println("Parent");
  }
}

class Child extends Parent {
  static void display() { // 부모 클래스의 static 메서드를 하이딩
    System.out.println("Child");
  }
}


public class Main {
  public static void main(String[] args) {
    Parent p = new Parent();
    Parent c1 = new Child();
    Child c2 = new Child();
    p.display();
    c1.display();
    c2.display();
  }
}
```
