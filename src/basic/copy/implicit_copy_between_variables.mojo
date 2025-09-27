# src/basic/variables/implicit_copy_between_variables.mojo
def main():
    var a = 1
    var b = a  # Implicitly copy the value of `a` into a new variable `b`
    # This is equivalent to `var b = a.copy()`
    print("a =", a)
    print("b =", b)
    print(
        "a and b has the same address:",
        Pointer(to=a) == Pointer(to=b),
    )

    var str1: String = "Hello"
    var str2 = (
        str1  # Implicitly copy the value of `str1` into a new variable `str2`
    )
    # This is equivalent to `var str2 = str1.copy()`
    print("str1 =", str1)
    print("str2 =", str2)
    print(
        "str1 and str2 has the same address:",
        Pointer(to=str1) == Pointer(to=str2),
    )

    var bool1: Bool = True
    var bool2 = bool1  # Implicitly copy the value of `bool1` into a new variable `bool2`
    # This is equivalent to `var bool2 = bool1.copy()`
    print("bool1 =", bool1)
    print("bool2 =", bool2)
    print(
        "bool1 and bool2 has the same address:",
        Pointer(to=bool1) == Pointer(to=bool2),
    )
