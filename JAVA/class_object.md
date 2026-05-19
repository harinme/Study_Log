# 클래스와 객체

## 1. 클래스와 객체 생성

### (1) 클래스

1. 클래스의 개념
   - 데이터(필드)와 해당 데이터에 작용하는 동작(메서드)을 하나로 묶은 구조
   - 객체(Object)는 클래스를 기반으로 생성된 실체(인스턴스)
   - 클래스는 객체를 생성하기 위한 설계도로, 상태(속성)와 행동(메서드)을 정의함

2. 클래스의 기본 구성 요소
   1. 필드(Field)
      - 객체의 속성을 저장하는 변수
      - 클래스 내부에 선언되며, 객체 생성 시 메모리에 할당됨
      - ex: `int age;` or `String name;`

   2. 메서드(Method)
      - 객체의 동작을 정의하는 함수
      - 필드를 읽거나 변경하거나, 객체의 동작을 수행
      - ex: `void display() {System.out.println(name);}`

   3. 생성자(Constructor)
      - 객체 생성 시 호출되는 특별한 메서드
      - 객체를 초기화하는 데 사용됨
      - 클래스 이름과 동일하며 반환형이 없음
      - ex: `MyClass(String name){this.name = name;}`

3. 클래스 정의

   ```java
     class Person {
       // 속성(필드)
       String name;
       int age;

       // 동작(메서드)
       void introduce() {
         System.out.println("name: " + name + ", age: " + age);
       }
     }

     class Main {
       public static void main(String[] args) {
         // Person 클래스의 객체 생성
         Person p1 = new Person();

         // 객체의 속성 값 설정
         p1.name = "Lee";
         p1.age = 20;
         p1.introduce();
       }
     }
   ```

## 2. 생성자(Constructor)

### (1) 생성자의 개념

- 클래스의 인스턴스가 생성될 때 가장 먼저 호출되는 특별한 메서드
- 객체를 초기화하고, 객체의 멤버 변수에 기본값을 설정하거나 필요한 동작을 수행함
- 자바에서는 생성자가 클래스 이름과 동일한 이름을 가지며, 반환형이 없음

### (2) 생성자의 특징

- 반드시 클래스 이름과 동일해야 함
- 반환형을 명시하지 않으며, 반환값도 가지지 않음
- 객체가 생성되는 시점에 자동으로 호출됨
- 매개변수의 종류와 개수를 다르게 하여 여러 개 정의할 수 있음
- 개발자가 생성자를 정의하지 않으면, 자바 컴파일러가 매개변수가 없는 기본 생성자를 자동으로 제공함

### (3) 생성자 예제

1. 생성자의 정의와 호출

   ```java
   class Person {
     String name;
     int age;
     // 기본 생성자
     Person() {
       name = "Unknown";
       age = 0;
       System.out.println("기본 생성자 호출.");
     }
   }

   class Main {
     public static void main(String[] args) {
       Person person = new Person(); // 생성자 호출
       System.out.println("Name: " + person.name + ", Age: " + person.age);
     }
   }
   ```

2. 생성자 오버로딩

   ```java
   class Person {
     String name;
     int age;
     // 기본 생성자
     Person() {
       name = "Unknown";
       age = 0;
     }
     // 매개변수가 있는 생성자
     Person(String name, int age) {
       this.name = name;
       this.age = age;
     }
   }

   class Main {
     public static void main(String[] args) {
       Person person1 = new Person();
       Person person2 = new Person("Alice", 25);
       System.out.println("P1 : " + person1.name + ", " + person1.age);
       System.out.println("P2 : " + person2.name + ", " + person2.age);
     }
   }
   ```

3. 생성자에서 다른 생성자 호출

   ```java
   class Person {
     String name;
     int age;
     Person() {
       this("Unknown", 0); // 다른 생성자 호출
     }
     Person(String name, int age) {
       this.name = name;
       this.age = age;
     }
   }

   Person person1 = new Person(); // 기본 생성자 호출
   Person person2 = new Person("Alice", 25);
   System.out.println("P1 : " + person1.name + ", " + person1.age);
   System.out.println("P2 : " + person2.name + ", " + person2.age);
   ```

## 3. 접근지정자

### (1) 접근지정자의 개념

- 클래스의 멤버(필드, 메서드, 생성자)에 대한 `접근 범위를 정의`하는 키워드
- 이를 통해 캡슐화(Encapsulation)를 구현하고, 외부 코드가 클래스 내부의 데이터와 동작에 접근할 수 있는 권한을 제한할 수 있음

### (2) 접근지정자의 종류

|   종류    | 접근범위                      | 클래스 | 패키지 | 상속 | 전체 |
| :-------: | :---------------------------- | :----: | :----: | :--: | :--: |
|  public   | 접근 제한 없음                |   O    |   O    |  O   |  O   |
| protected | 동일 패키지와 상속받은 클래스 |   O    |   O    |  O   |      |
|  default  | 동일 패키지                   |   O    |   O    |      |      |
|  private  | 동일 클래스                   |   O    |        |      |      |

### (3) 접근지정자 예제

1. 같은 패키지에 있을 경우

   ```java
   class Car {
     public String name;
     private int speed;
     protected int person;
     int max_speed;
     public void setSpeed(int speed) {
       this.speed = speed;
     }
     public int getSpeed() {
       return this.speed;
     }
   }

   class Main {
     public static void main(String[] args) {
       Car myCar = new Car();
       myCar.name = "쏘나타"; // 가능
       //myCar.speed = 100; // 오류
       myCar.person = 4; // 가능
       myCar.max_speed = 200; // 가능
       myCar.setSpeed(100); // 가능
       System.out.println(myCar.getSpeed());
     }
   }
   ```

2. 다른 패키지에 있을 경우

   ```java
   package otherpackage;
   import mypackage.Parent;
   public class Child extends Parent {
     public void show() {
       System.out.println("Public: " + pubVar);   // 가능
       System.out.println("Protected: " + protVar); // 가능 (상속)
       // System.out.println("Default: " + defVar); // 오류
       // System.out.println("Private: " + privVar); // 오류
     }
   }

   package mypackage;
   public int pubVar = 1;
   protected int protVar = 2;
   int defVar = 3; // default
   private int privVar = 4;
   public void display() {
     System.out.println("Public: " + pubVar);
     System.out.println("Protected: " + protVar);
     System.out.println("Default: " + defVar);
     System.out.println("Private: " + privVar);
   }

   System.out.println("Public: " + pubVar);   // 가능
   System.out.println("Protected: " + protVar); // 가능 (상속 관계)
   // System.out.println("Default: " + defVar); // 오류
   // System.out.println("Private: " + privVar); // 오류
   ```
