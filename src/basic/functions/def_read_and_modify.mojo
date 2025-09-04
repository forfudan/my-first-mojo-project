def change_value_in_def(x: Int):
    print("===============================")
    print("Calling `change_value_in_def()`")
    print("x =", x, "at address", String(Pointer(to=x)))
    x = 2
    print("Change x to 2")
    print("x =", x, "at address", String(Pointer(to=x)))
    print("===============================")


def main():
    var a = 1
    print("Initializing a to 1")
    print("a =", a, "at address", String(Pointer(to=a)))
    change_value_in_def(a)
    print("a =", a, "at address", String(Pointer(to=a)))
