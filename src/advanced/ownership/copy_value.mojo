# src/advanced/ownership/copy_value.mojo
from memory import Pointer


def main():
    var a: List[Float64] = [1.0, 2.0, 3.0, 4.0]
    print("a at address", String(Pointer(to=a)), "with values:")
    for i in a:
        print(i, end=", ")
    print()

    # Copy the value of `a` and let `b` to own it.
    var b = a.copy()
    print("b at address", String(Pointer(to=b)), "with values:")
    for i in b:
        print(i, end=", ")
    print()

    # Modify `b` to show that it is a copy.
    b[0] = -1.0
    b.append(5.0)
    print("b at address", String(Pointer(to=b)), "with values:")
    for i in b:
        print(i, end=", ")
    print()

    # After copy the value, `a` is still valid.
    print("a at address", String(Pointer(to=a)), "with values:")
    for i in a:
        print(i, end=", ")
    print()
