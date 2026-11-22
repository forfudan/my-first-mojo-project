#include <stdint.h>
#include <stdio.h>
#include <time.h>

int64_t fib(int n) {
  if (n <= 1) {
    return n;
  }
  return fib(n - 1) + fib(n - 2);
}

int main() {
  clock_t start = clock();
  for (int i = 0; i < 40; i++) {
    printf("%lld, ", (long long)fib(i));
  }
  printf("\nTime: %f seconds\n", (double)(clock() - start) / CLOCKS_PER_SEC);
}
