# src/basic/functions/lambda_expression.py
def apply_twice(f, x: int) -> int:
    return f(f(x))


def main():
    double = lambda x: x * 2
    print(double(21))
    print(apply_twice(double, 3))
    print(apply_twice(lambda x: x + 1, 40))

main()
