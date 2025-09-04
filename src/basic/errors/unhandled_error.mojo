# src/basic/errors/unhandled_error.mojo
def divide(x: Int, y: Int) -> Int:
    if y == 0:
        raise Error("Cannot divide by zero")
    else:
        return x // y


def main():
    var div1 = divide(10, 2)
    print("10 // 2 =", div1)
    var div2 = divide(10, 0)
    print("10 // 0 =", div2)
