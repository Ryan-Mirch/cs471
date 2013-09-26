/* YuAs1Ex3.c - Answer 8
 * Author: Yu, Danny (dyu6)
 * Date: 9/5/13
 */

#include <stdio.h>

int ack(int m, int n);

// assumes m and n are never negative
int ack(int m, int n) {
  if (m == 0) {
    return n + 1;
  }
  else {
    if (n == 0) {
      return ack(m-1, 1);
    }
    else {
      return ack(m-1, ack(m,n-1));
    }
  }
}

int main(void) {
  //printf("ack(1,0) = %d\n", ack(1,0));
  //printf("ack(0,3) = %d\n", ack(0,3));
  //printf("ack(1,2) = %d\n", ack(1,2));
  //printf("ack(2,1) = %d\n", ack(2,1));
  int N, result;
  for (N = 0; N < 50; N++ ) {
    result = ack(3, N);
    printf("ack(3,N), N = %d\n", N);
  }
  return 0;
}
