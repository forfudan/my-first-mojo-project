# src/basic/variables/move_between_variables_errors.mojo
# This code will compile but with warnings
def main():
    var a = 1
    var b = a^  # Move the value of `a` into a new variable `b`
    print("a =", a)
    print("b =", b)
    print(
        "a and b has the same address:",
        Pointer(to=a) == Pointer(to=b),
    )
