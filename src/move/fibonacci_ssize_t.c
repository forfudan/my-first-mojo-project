#include <stdint.h>
#include <stdio.h>

ssize_t fib(int n) {
  if (n <= 1) {
    return n;
  }
  return fib(n - 1) + fib(n - 2);
}

int main() {
  for (int i = 0; i < 50; i++) {
    printf("%ld, ", fib(i));
  }
}