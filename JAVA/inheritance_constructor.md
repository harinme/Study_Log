# 상속과 생성자

## 1. 상속(Inheritance)

### (1) 상속의 개념

- 기존 클래스(부모 클래스)의 멤버(필드, 메서드)를 새로운 클래스(자식 클래스)가 물려받아 재사용하고 확장하는 기능
- 코드의 재사용성을 높이고, 계층 구조를 통해 객체 지향 프로그래밍의 주요 개념인 다형성(Polymorphism)을 구현할 수 있음

### (2) 상속의 특징

- 부모 클래스의 필드와 메서드를 자식 클래스가 물려받아 사용할 수 있음
- 자식 클래스에서 부모 클래스의 기능을 확장하거나 수정하여 사용할 수 있음
- 부모 클래스의 참조를 통해 자식 클래스의 객체를 사용할 수 있어, 동일한 메서드 호출이 다양한 결과를 가져올 수 있음
- 부모 클래스의 Protected 또는 Public 멤버에만 자식 클래스가 접근할 수 있음
- 부모 클래스의 형태로는 객체를 생성할 수 있지만, 자식 클래스의 형태로는 부모 클래스의 객체를 생성할 수 없음

### (3) 상속 관련 키워드

1. extends
   - 자식 클래스가 부모 클래스를 상속받을 때 사용
   - ex: `class Child extends Parent`

2. super
   - 부모 클래스의 멤버(필드, 메서드, 생성자)를 참조할 때 사용하는 키워

   ```java
   class Parent {
     String name = "Parent";
     void display() {
       System.out.println("Parent display()");
     }
   }

   class Child extends Parent {
     String name = "Child";
     void show() {
       System.out.println("Name: " + name); // 자식 클래스의 필드
       System.out.println("Name: " + super.name); // 부모 클래스의 필드
       super.display(); // 부모 클래스의 메서드 호출
     }
   }
   ```

### (4) 상속 예제

    ```java
    class Parent {
      // 부모 클래스의 필드와 메서드
      String name;
      void showName() {
        System.out.println("Name: " + name);
      }
    }

    class Child extends Parent { // Child 클래스가 Parent 클래스 상속
      int age;
      void showAge() {
        System.out.println("Age: " + age);
      }
    }

Child child = new Child();
child.name = "Alice"; // 부모 클래스의 필드 사용
child.age = 25; // 자식 클래스의 필드 사용
child.showName(); // 부모 클래스의 메서드 사용
child.showAge(); // 자식 클래스의 메서드 사용

````

## 2. 상속과 생성자 관계

### (1) 상속과 생성자의 기본 개념

- 상속은 부모 클래스의 멤버(필드와 메서드)를 자식 클래스가 물려받지만, 생성자는 상속되지 않음
- 자식 클래스의 생성자가 호출될 때, 반드시 부모 클래스의 생성자가 먼저 호출됨
- 자식 클래스에서 부모 클래스의 생성자를 호출할 때, `super()` 키워드를 사용함
- 자식 클래스에서 부모 클래스의 생성자를 명시적으로 호출하지 않으면, 자동으로 부모의 기본 생성자를 호출함 (생성자 없을 경우)
- 부모 클래스에 기본 생성자가 없고, 매개변수 생성자만 존재하면, 자식은 `super(매개변수)`를 명시적으로 호출해야 함

### (2) super()와 this()의 관계

1. super()
   - 부모 클래스의 생성자를 호출한다.
   - 반드시 자식 생성자의 첫 줄에 위치해야 한다.

2. this()
   - 같은 클래스 내의 다른 생성자를 호출한다.
   - this()와 super()를 함께 사용할 수 없다.
   - this()를 이용해 같은 클래스 내 다른 생성자를 호출하면 부모 생성자 호출 권한도 같이 넘어간다.

### (3) 생성자 예제

1. 부모의 생성자를 명시하지 않은 경우

   ```java
   class Parent {
     Parent() {
       System.out.println("Parent");
     }
     Parent(String name) {
       System.out.println("Parent:" + name);
     }
   }

   class Child extends Parent {
     Child() {
       System.out.println("Child");
     }
   }

   Child child = new Child();
````

2. 부모의 생성자를 명시한 경우

   ```java
   class Parent {
     Parent() {
       System.out.println("Parent");
     }
     Parent(String name) {
       System.out.println("Parent:" + name);
     }
   }

   class Child extends Parent {
     Child() {
       super("PP");
       System.out.println("Child");
     }
   }

   Child child = new Child();
   ```

3. this() 사용

   ```java
   class Parent{
     Parent() {
       System.out.println("Parent");
     }
     Parent(String name) {
       System.out.println("Parent:" + name);
     }
   }

   class Child extends Parent{
     Child() {
       this("Lee");
       System.out.println("Child 1");
     }
     Child(String name) {
       super("PP");
       System.out.println("Child 2:" + name);
     }
   }

   public class Main {
     public static void main(String[] args) {
       Child child1 = new Child();
       Child child2 = new Child("Kim");
     }
   }

   <!--
    [실행결과]
    Parnet: PP
    Child 2: Lee
    Child 1
    Parent:PP
    Child 2:Kim
    -->
   ```
