# 구조체와 공용체

## 1. 구조체

### (1) 구조체의 개념

- 구조체는 다양한 자료형으로 이루어진 데이터를 하나의 단위로 묶는 사용자 정의 자료형
- 한 사람의 정보를 저장할 때 이름(문자열), 나이(정수), 키(실수) 등을 하나의 구조체로 묶어 관리할 수 있음

### (2) 구조체 선언 및 정의

- 구조체는 struct 키워드를 사용하여 선언한다
- ```C
    struct Student {
      char name[50]; // 이름
      int age; // 나이
      float grade; // 성적
    };
  ```

### (3) 구조체 변수 선언 및 초기화

1. 구조체 변수 선언

- 구조체 변수를 선언하여 데이터를 저장
- ```C
    struct Student {
      char name[50]; // 이름
      int age; // 나이
      float grade; // 성적
    };
    struct Student s1, s2; // s1과 s2라는 변수 2개 선언
  ```

2. 구조체 변수 초기화

- 구조체 변수는 선언 시 초기화하거나 이후에 값을 할당할 수 있음
- ```C
    struct Student {
      char name[50]; // 이름
      int age; // 나이
      float grade; // 성적
    };
    struct Student s1 = {"Lee", 45, 3.5};
  ```

### (4) 구조체 멤버 접근

- 구조체 멤버는 점 연산자(.)를 사용하여 접근
- ```C
    #include <stdio.h>
    struct Student {
      char name[50]; // 이름
      int age; // 나이
      float grade; // 성적
    };

    int main(){
      struct Student s1 = {"Lee", 45, 3.5};

      printf("Name: %s\n", s1.name); // Name: Lee
      printf("Age: %d\n", s1.age); // Age: 20
      printf("Grage: %2f\n", s1.grage); // Grade: 3.50
      return 0;
    }

  ```

## 2. 구조체 배열

### (1) 구조체 배열의 개념

- 동일한 구조체 자료영을 여러 개 연속된 메모리 공간에 저장하는 배열
- 배열의 각 요소는 구조체 하나에 해당하며, 인덱스를 이용해 접근
- 구조체 배열은 배열의 특성상 연속된 메모리 공간을 차지함

### (2) 구조체 배열 선언 및 접근

- 선언 형태
- ```C
    struct Student {
      char name[20];
      int age;
    }
    struct Student students[3];
  ```

## 3. 구조체 포인터

### (1) 구조체 포인터의 개념

- 구조체 포인터는 구조체 변수의 주소를 저장하는 포인터이다
- 구조체 변수의 멤버에 접근할 때는 화살표(→) 연산자를 사용
- 주소를 전달하므로, 구조체 전체를 함수 인자로 넘길 때 메모리 사용을 줄이고 성능을 향상시킬 수 있음
- 포인터이므로 다른 구조체를 가리키도록 동적으로 변경 가능

### (2)구조체 포인터 선언 및 접근

- 선언 형태
- ```C
    struct Student {
      char name[20];
      int age;
    }
    struct Student s = {"Kim", 22};
    struct Student * p = &s; // s의 주소를 p에 저장
  ```

- 접근 예
- ```C
    p->age = 23; // (*p).age와 동일
    (*p).age = 24; // p가 가리키는 구조체의 age 변경
  ```

## 4. typedef와 중첩 구조체

### (1) typedef

1. typedef의 개념
   - 자료형에 새로운 별칭(이름)을 지정하는 키워드
   - 복잡한 자료형을 간단한 이름으로 바꿔 코드 가독성을 높일 수 있음
   - 구조체 이름이 길거나 자주 사용하는 경우 typedef를 사용하면 편리함
   - typedef는 기존 자료형을 재정의하는 것이 아니라 **별칭(alias)를 부여**하는 것

2) typedef 선언 및 사용
   - 사용 예

     ```C
       typedef int SCORE;
       SCORE a = 10; // int a = 10과 동일
     ```

   - 구조체와 함께 사용하는 예
     ```C
      typedef struct Student {
        char name[20];
        int age;
      } Student;
      Student s = {"Kim", 22}; // struct Student s와 동일
     ```

### (2) 중첩 구조체

1. 중첩 구조체의 개념
   - 중첩 구조체는 구조체 안에 다른 구조체를 멤버로 포함하는 구조
   - 복잡한 데이터를 단계적으로 구성할 때 유용
   - 주소록, 학생 + 주소 정보, 직원 + 급여 정보 등의 계층적 데이터를 표현할 수 있음

2) 중첩 구조체 선언 및 접근
   - 선언 형태

     ```C
       struct Address{
         char city[20];
         int zipcode;
       };
       struct Student{
         char name[20];
         int age;
         struct Address addr; // Address 구조체 포함
       }
     ```

   - 중첩 구조체 변수 선언 및 접근

     ```C
      struct Student s = {"Lee", 23, {"Seoul", 12345}};
      s.addr.zipcode = 54321;
      prinf("%s %d\n", s.addr.city, s.addr.zipcode); // Seoul 54321
     ```

## 5. 공용체

### (1) 공용체의 개념

- 공용체는 여러 멤버를 정의할 수 있지만, 가장 큰 멤버의 크기만큼의 메모리만 할당됨
- 하나의 메모리 공간을 공유하기 때문에, 한 시점에 하나의 멤버만 값을 저장할 수 있음
- 메모리 사용이 제한적인 시스템에서 메모리 효율성을 극대화하기 위해 사용됨

### (2) 공용체 선언 및 정의

- 공용체는 union 키워드를 사용하여 선언
  ```C
    union Data{
      int i; // 4byte
      float f; // 4byte
      char str[20]; // 20byte
    };
    // 따라서 이 공용체의 크기는 20byte임
  ```

### (3) 공용체의 장점

- 메모리 사용량을 최소화할 수 있음
- 다양한 데이터 타입을 하나의 메모리 공간에서 처리할 수 있음
