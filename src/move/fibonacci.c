#include <stdint.h>
#include <stdio.h>

int64_t fib(int n) {
  if (n <= 1) {
    return n;
  }
  return fib(n - 1) + fib(n - 2);
}

int main() {
  for (int i = 0; i < 50; i++) {
    printf("%lld, ", fib(i));
  }
}