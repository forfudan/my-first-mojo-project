# src/basic/functions/lambda_expression.mojo
def apply_twice(f: def(Int) thin -> Int, x: Int) -> Int:
    return f(f(x))


def main():
    var double = lambda (x: Int) -> Int: x * 2
    print(double(21))
    print(apply_twice(double, 3))
    print(apply_twice(lambda (x: Int) -> Int: x + 1, 40))
