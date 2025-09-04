# src/basic/errors/handle_errors.py
def divide(x: int, y: int) -> int:
    if y == 0:
        raise Exception("Cannot divide by zero")
    else:
        return x // y


def main():
    a = 10
    b = 0
    result: int
    try:
        print("`try` branch - Before calling the `divide()` function")
        result = divide(a, b)
        print("`try` branch - If this line is reached, no error occurred")
    except Exception as error_message:
        print("`except` branch - Error occurred with the message:", error_message)
        print("`except` branch - Let's set the result to be 0")
        result = 0
    else:
        print("`else` branch - No errors occurred, result is:", result)
    finally:
        print("`finally` branch - No matter what, this block will execute")

    print(a, "//", b, "=", result)


main()
