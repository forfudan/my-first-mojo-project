# src/basic/controls/print_fibonacci_numbers.mojo
def print_fibonacci(n: Int) -> None:
    """Prints the first n Fibonacci numbers."""
    if n > 93:
        print(
            "Warning: The input number is too large."
            "The Fibonacci numbers will overflow."
        )
        return

    var prev = 0
    var curr = 1
    for _ in range(n):
        print(prev)
        prev, curr = curr, prev + curr


def main():
    print_fibonacci(95)
