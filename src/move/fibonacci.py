import time


def fib(n: int) -> int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def main():
    start = time.perf_counter()
    for i in range(40):
        print(fib(i), end=", ")
    print()
    print("Time:", time.perf_counter() - start, "seconds")

main()
