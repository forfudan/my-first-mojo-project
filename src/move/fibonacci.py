import time

def fib(n: int) -> int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)

def main():
    for i in range(50):
        print(fib(i), end=", ")

t0 = time.time()
main()
t1 = time.time()
print(f"\nExecution time: {t1 - t0:.6f} seconds")