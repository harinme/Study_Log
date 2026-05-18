# C언어 주요 함수

## 1. 문자열 함수 `<string.h>`

### (1) strlen()

- 문자열의 길이를 반환(NULL 문자 '₩0'은 미포함)

  ```C
    // 공백도 길이에 포함
    #include <stdio.h>
    #include <string.h>

    int main() {
      char str[] = "Hello, World!";
      printf("Length: %d\n", strlen(str));
      return 0;
    }
  ```

### (2) strcpy()

- 문자열을 다른 문자열로 복사

  ```c
  #include <stdio.h>
  #include <string.h>

  int main() {
    char src[] = "Source";
    char dest[20];
    strcpy(dest, src);
    printf("%s\n", dest);
    return 0;
  }
  ```

### (3) strncpy()

- 문자열을 지정된 길이만큼 복사

  ```c
  #include <stdio.h>
  #include <string.h>

  int main() {
    char src[] = "Source";
    char dest[10];
    strncpy(dest, src, 3);
    dest[3] = '\0';
    printf("%s\n", dest); // Sou
    return 0;
  }
  ```

### (4) strcat()

- 문자열을 다른 문자열에 이어 붙임

```c
#include <stdio.h>
#include <string.h>

int main() {
    char str1[20] = "Hello";
    char str2[] = ", World!";
    strcat(str1, str2);
    printf("%s\n", str1); // Hello, World!
    return 0;
}
```

### (5) strncat()

- 지정된 길이만큼 문자열을 이어 붙임

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str1[20] = "Hello";
    char str2[] = ", World!";
    strncat(str1, str2, 3);
    printf("%s\n", str1); // Hello, W
    return 0;
  }
  ```

### (6) strcmp()

- 두 문자열을 비교함
- 반환값: 0(같음), 양수(앞이 큼), 음수(뒤가 큼)

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str1[] = "ABC";
    char str2[] = "ACD";
    int result = strcmp(str1, str2);
    printf("%d\n", result); // -1
    return 0;
  }
  ```

### (7) strncmp()

- 지정된 길이만큼 두 문자열을 비교

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str1[] = "Hello";
    char str2[] = "Helium";
    int result = strncmp(str1, str2, 3);
    printf("Comparison: %d\n", result); // Comparison: 0
    return 0;
  }
  ```

### (8) strchr()

- 문자열에서 특정 문자의 첫 번째 위치를 찾음

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str[] = "Hello, World!";
    char *ptr = strchr(str, 'W');
    if (ptr) {
        printf("%s\n", ptr); // World!
    }
    return 0;
  }
  ```

### (9) strrchr()

- 문자열에서 특정 문자의 마지막 위치를 찾음

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str[] = "Hello, World!";
    char *ptr = strrchr(str, 'o');
    if (ptr) {
        printf("%s\n", ptr); // orld!
    }
    return 0;
  }
  ```

### (10) strstr()

- 문자열에서 특정 문자열(부분 문자열)의 첫 번째 위치를 찾음

  ```C
  #include <stdio.h>
  #include <string.h>

  int main() {
    char str[] = "Hello, World!";
    char *ptr = strstr(str, "World");
    if (ptr) {
      printf("%s\n", ptr); // World!
    }
    return 0;
  }
  ```

## 2. 수학 함수 <Math.h>

### (1) sqrt()

- 제곱근을 반환
  ```C
  printf("%.2f\n", sqrt(16)); // 4.00
  ```

### (2) pow()

- `pow(밑, 지수)`
- 거듭제곱을 반환
  ```c
  printf("%.0f\n", pow(2,3)); // 8
  ```

### (3) abs()

- 정수의 절대값을 반환

  ```c
  printf("%d\n", abs(-10)); // 10

  ```

### (4) ceil() / floor()

- ceil(): 올림 / floor(): 내림
  ```c
  printf("%.1f, %.1f\n", ceil(2.3), floor(2.7)); // 3.0, 2.0
  ```

### (5) round()

- 실수를 가장 가까운 정수로 반올림하여 반환
- 반환 타입은 `double`이며, 소수점 이하 반올림 규칙은 '가장 가까운 정수 방향(0에서 먼 쪽으로)'임
- 음수도 동일한 규칙으로 반올림
  ```c
  printf("%.0f,", round(2.5));
  printf("%.0f,", round(2.3));
  printf("%.0f,", round(-2.5));
  printf("%.0f", round(-2.3));
  // 3,2,-3,-2
  ```

## 3. 기타 자주 사용되는 함수

### (1) atoi() / atof()

- 문자열을 정수(int) or 실수(double)로 변환
  ```c
  char numStr[] = "123";
  int num = atoi(numStr);
  printf("%d\n", num); // 123
  ```

### (2) rand() / srand()

- 난수를 생성
  ```c
  srand(time(NULL));
  printf("%d\n", rand() % 100); // 0~99의 난수
  ```

### (3) toupper() / tolower()

- 문자 대소문자를 변환
  ```c
  char ch = 'a';
  printf("%c\n", toupper(ch)); // A
  ```
