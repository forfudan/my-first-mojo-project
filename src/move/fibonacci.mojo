# src/move/fibonacci.mojo
def fib(n: Int) -> Int:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def main():
    for i in range(40):
        print(fib(i), end=", ")
