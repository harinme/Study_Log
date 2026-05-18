# 프로세스 생성

## 1. fork

### (1) fork의 개념

- 새로운 프로세스(자식 프로세스)를 생성하기 위해 사용되는 C언어의 시스템 호출
- 호출 시 부모 프로세스(Parent Process)를 복제하여 동일한 메모리 공간을 가진 자식 프로세스를 생성
- 부모와 자식 프로세는 동일한 코드를 실행하지만, 프로세스 ID(PID)를 통해 서로 구분 가능

### (2) 동작 방식

- `fork()`는 호출 시 두 번 반환됨
  - 부모 프로세스에서는 자식 프로세스의 PID를 반환
  - 자식 프로세스에서는 0을 반환
- 반환값을 통해 부모와 자식 프로세스를 구분하여 서로 다른 작업 수행 가능

### (3) fork의 활용

1. 함수 원형

   ```C
    #include <unistd.h>
    pid_t fork(void);

    // 양수: 부모 프로세스에서 반환된 자식 프로세스의 PID
    // 0: 자식 프로세스에서 반환
    // 음수: 프로세스 생성 실패
   ```

2. 예제

   ```C
    #include <stdio.h>
    #include <unistd.h>
    int main() {
      int pid = fork();
      if (pid > 0) {
        // 부모 프로세스
        printf("P PID = %d, C PID = %d\n", getpid(), pid);
      } else if (pid == 0) {
        // 자식 프로세스
        printf("C PID = %d\n", getpid());
      } else {
        // 에러 처리
        printf("Fork failed\n");
      }
      return 0;
    }
   ```
