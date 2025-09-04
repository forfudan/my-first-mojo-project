# src/basic/controls/print_fibonacci_numbers.py
def print_fibonacci(n: int) -> None:
    """Prints the first n Fibonacci numbers."""
    prev = 0
    curr = 1
    for _ in range(n):
        print(prev)
        prev, curr = curr, prev + curr


def main():
    print_fibonacci(50)


main()
