# 추상 클래스 & 인터페이스(Interface)

## 1. 추상 클래스(Abstract Class)

### (1) 추상 클래스의 개념

- 하나 이상의 추상 메서드를 포함하는 클래스를 말하며, abstract 키워드를 사용하여 정의함
- 추상 메서드는 구현부가 없는 메서드로, 선언만 되어 있고 반드시 하위 클래스에서 구현해야 함

### (2) 추상 클래스의 특징

- 추상 클래스는 객체를 직접 생성할 수 없으며, 이를 상속받은 하위 클래스에서 객체를 생성할 수 있음
- 추상 클래스에 정의도니 추상 메서드는 하위 클래스에서 반드시 구현하도록 강제할 수 있음
- 추상 메서드가 없는 클래스라도 abstract 키워드를 붙여 추상 클래스로 선언할 수 있음
- 객체 생성을 막기 위한 용도로 사용됨
- 추상 클래스는 필드, 생성자, 일반 메서드, 추상 메서드를 모두 포함할 수 있음

### (3) 추상 클래스 예제

```java
abstract class Animal {
  abstract void sound();
  void eat() {
    System.out.println("음식");
  }
}

class Cat extends Animal {
  void sound() {
    System.out.println("야옹");
  }
}

public class Main {
  public static void main(String[] args) {
    Animal cat = new Cat();
    cat.sound(); //  야옹
    cat.eat(); // 음식
  }
}
```

## 2. 인터페이스(Interface)

### (1) 인터페이스의 개념

- 모든 메서드가 구현되지 않은 추상 클래스의 극단적인 형태로, interface 키워드를 사용하여 정의함
- 인터페이스에 선언된 모든 메서드는 이를 구현하는 클래스에서 반드시 구현해야 함

### (2) 인터페이스의 특징

- 인터페이스는 추상 클래스와 마찬가지로 직접 객체를 생성할 수 없음
- 클래스는 여러 개의 인터페이스를 구현할 수 있음
- 인터페이스를 통해 개발자는 특정 클래스가 반드시 구현해야 할 메서드의 틀을 설계할 수 있음

### (3) 인터페이스 예제

```java
interface Animal {
  void sound();
  default void eat() {
    System.out.println("음식");
  }
}

class Cat implements Animal {
  public void sound() {
    System.out.println("야옹");
  }
}

public class Main {
  public static void main(String[] args) {
    Animal cat = new Cat();
    cat.sound(); // 야옹
    cat.eat(); // 음식
  }
}
```
