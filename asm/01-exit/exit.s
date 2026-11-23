# 종료 코드를 커널에 넘기고 프로그램을 끝냄
# 확인: ./exit; echo $?
.intel_syntax noprefix   # ?

.section .data           # ?
.section .text           # ?
.globl _start            # ?

_start:
  mov eax, 1             # 부탁 종류: 시스템 콜 1번 = exit
  mov ebx, 0             # 부탁에 필요한 값: 종료 코드
  int 0x80               # 커널 호출 = 주문 넣기. 없으면 CPU가 뒤 칸까지 실행하다 segfault