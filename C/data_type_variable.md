# 자료형과 변수

> [!NOTE] 세부정보
>
> <details>
>  세부정보 속 내용은 실기 시험에는 잘 나오지 않는 부분들임
> </details>

## 1. 자료형

- ### 개념
  - **효율적인 메모리 사용**을 위해 다양한 자료형이 有
  - 변수에 저장한 데이터의 종류와 범위를 결정

- ### 종류

  > [!IMPORTANT] 실기 시험에선 “자료형 크기 자체를 그대로 외우는 문제”는 거의 안 나옴.

  #### <details>

  #### 문자형

  | 타입          | 크기   | 범위       |
  | ------------- | ------ | ---------- |
  | char          | 1 Byte | -128 ~ 127 |
  | unsigned char | 1 Byte | 0 ~ 255    |

  #### 정수형

  | 타입      | 크기   | 범위                           |
  | --------- | ------ | ------------------------------ |
  | short     | 2 Byte | -32,768 ~ 32,767               |
  | int       | 4 Byte | -2,147,483,648 ~ 2,147,483,647 |
  | long      | 4 Byte | int와 동일                     |
  | long long | 8 Byte | 매우 큼                        |

  #### 실수형

  | 타입        | 크기       | 범위             |
  | ----------- | ---------- | ---------------- |
  | float       | 4 Byte     | 약 ±3.4 × 10^38  |
  | double      | 8 Byte     | 약 ±1.7 × 10^308 |
  | long double | 12~16 Byte | double보다 큼    |

  </details>

---

## 2. 변수

- ### 개념
  - 값이 저장되는 기억 공간
  - 저장된 값은 변경 가능
  - 변수는 정해진 자료형과 할당된 값을 가짐

- ### 변수명 작성 규칙

  <!-- prettier-ignore-start -->

   <details>
  - 변수는 선언 후 사용해야 함.
  - 변수명은 영문자 또는 언더바(\_)로 시작해야 함.
  - 변수명에 숫자와 언더바(\_)는 사용할 수 있으나, 공백은 사용할 수 없음.
  - 언더바(\_)를 제외한 특수문자는 사용할 수 없음.
  - 대소문자를 구분함.
  - 예약어는 변수명으로 사용할 수 없음.
  - </details>
    <!-- prettier-ignore-end -->

- ### C언어 예약어

  <!-- prettier-ignore-start -->
  <details>

  | 구분     | 종류                                                                               |
  | -------- | ---------------------------------------------------------------------------------- |
  | 자료형   | char, int, float, double, enum, void, struct, union, short, long, signed, unsigned |
  | 기억부류 | auto, register, static, extern                                                     |
  | 제어문   | if, else, for, while, do, switch, case, default, break, continue, return, goto     |
  | 기타     | sizeof, const, volatile                                                            |

  </details>
  <!-- prettier-ignore-end -->

- ### 변수의 종류
  1. 지역변수(Local Variable)
     - 함수 내부나 중괄호 내부에서 선언되고 사용
     - 유효 범위: 함수 내부 or 중괄호 내부
     - 함수가 종료되거나 범위를 벗어나면 사라짐(메모리에서 지워짐) -> 중괄호를 벗어나면
     - 초기값을 지정하지 않으면 컴파일 에러가 발생하거나 쓰레가 값이 저장될 수 있음
     - 스택(Stack) 영역에 저장
  2. 전역변수(Global Variable)
     - 어느 범위에서든 참조 가능
     - 전처리기 아래에 선언, 모든 함수에서 공통으로 사용
     - 초기값 미지정 시 0으로 자동 초기화
     - 프로그램 종료 전까지 메모리에 보존
     - 데이터(Data) 영역에 저장됨
  3. 정적변수(Static Variable)
     - 지역변수와 전역변수의 특징을 모두 가짐
     - 함수가 종료되어도 사라지지 않음
     - 초기값을 지정하지 않으면 0으로 자동 초기화
     - 프로그램 종료 전까지 메모리에서 소멸되지 않음.
     - 데이터(Data) 영역에 저장됨.
  4. 동적변수(Dynamic Variable)
     - 프로그램 실행 도중 동적으로 메모리 공간을 할당받는 변수
     - **malloc 함수** 등을 이용해 메모리 공간을 확보함.
     - 힙(Heap) 영역에 저장됨.
  5. 외부 변수(Extern Variable)
     - 다른 파일에서 선언된 전역변수를 참조하는 변수
     - extern 키워드를 사용하여 외부 파일의 전역변수를 참조

- ### 변수의 선언
- ```c
   int sum; // 전역변수

   int add(int x, int y) {
       static int count = 0; // 정적변수
       int sum = 0;          // 지역변수

       sum = x + y;
       count++;

       printf("%d\n", count);
       return sum;
   }

  <!--  -->

   int main(void) {
       int a = add(10, 20);
       int b = add(20, 30);
       int c = add(5, 8);

       printf("%d", a);
       printf("%d", b);
       printf("%d", c);

       <!-- 실행 결과
       1
       2
       3
       30
       50
       13
        -->
   }
  ```
