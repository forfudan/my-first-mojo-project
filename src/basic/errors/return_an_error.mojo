fn return_error() -> Error:
    return Error("This is an error message")


fn main():
    try:
        print(return_error())
        print("No exception raised")
    except e:
        print("Caught an error:", e)
