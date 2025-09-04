from numpy import int64
import time

def fib(n: int64) -> int64:
    if n <= int64(1):
        return int64(n)
    return int64(fib(n - 1) + fib(n - 2))

def main():
    for i in range(50):
        print(fib(int64(i)), end=", ")

t0 = time.time()
main()
t1 = time.time()
print(f"\nExecution time: {t1 - t0:.6f} seconds")