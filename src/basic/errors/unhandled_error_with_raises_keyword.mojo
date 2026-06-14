# src/basic/errors/unhandled_error_with_raises_keyword.mojo
def divide(x: Int, y: Int) raises -> Int:
    if y == 0:
        raise Error("Cannot divide by zero")
    else:
        return x // y


def main() raises:
    var div1 = divide(10, 2)
    print("10 // 2 =", div1)
    var div2 = divide(10, 0)
    print("10 // 0 =", div2)
