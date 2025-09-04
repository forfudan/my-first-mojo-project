def fib(n: Int64) -> Int64:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def main():
    for i in range(50):
        print(fib(i), end=", ")
