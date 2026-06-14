# src/basic/errors/handle_errors_another_example.mojo
def divide(x: Int, y: Int) raises -> Int:
    if y == 0:
        raise Error("Cannot divide by zero")
    else:
        return x // y


def main() raises:
    var a = 10
    var b = 2
    var result: Int
    try:
        print("`try` branch - Before calling the `divide()` function")
        result = divide(a, b)
        print("`try` branch - If this line is reached, no error occurred")
    except error_message:
        print(
            "`except` branch - Error occurred with the message:", error_message
        )
        print("`except` branch - Let's set the result to be 0")
        result = 0
    else:
        print("`else` branch - No errors occurred, result is:", result)
    finally:
        print("`finally` branch - No matter what, this block will execute")

    print(a, "//", b, "=", result)
