# src/basic/variables/explicit_copy_between_variables.mojo
def main():
    var a = 1
    var b = a.copy()  # Explicitly copy the value of `a` into a new variable `b`
    print("a =", a)
    print("b =", b)
    print(
        "a and b has the same address:",
        Pointer(to=a) == Pointer(to=b),
    )

    var str1: String = "Hello"
    var str2 = (
        str1.copy()
    )  # Explicitly copy the value of `str1` into a new variable `str2`
    print("str1 =", str1)
    print("str2 =", str2)
    print(
        "str1 and str2 has the same address:",
        Pointer(to=str1) == Pointer(to=str2),
    )

    var lst1: List[Int] = [1, 2, 3]
    var lst2 = lst1.copy()
    # Explicitly copy the value of `lst1` into a new variable `lst2`
    print("lst1 =", end=" ")
    for i in lst1:
        print(i, end=", ")
    print("\nlst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")
    print(
        "\nlst1 and lst2 has the same address:",
        Pointer(to=lst1) == Pointer(to=lst2),
    )
