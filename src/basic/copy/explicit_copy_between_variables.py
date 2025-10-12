# src/basic/variables/explicit_copy_between_variables.py
import copy


def main():
    a = 1
    b = copy.deepcopy(a)  # Explicitly copy the value of `a` into a new variable `b`
    print("a =", a)
    print("b =", b)
    print(
        "a and b are the same object:",
        id(a) == id(b),
    )

    str1: str = "Hello"
    str2 = copy.deepcopy(
        str1
    )  # Explicitly copy the value of `str1` into a new variable `str2`
    print("str1 =", str1)
    print("str2 =", str2)
    print("str1 and str2 are the same object:", id(str1) == id(str2))

    lst1: list[int] = [1, 2, 3]
    # `lst1` is now referring to a list object with three integers
    lst2: list[int] = (
        lst1.copy()
    )  # `lst2` is now referring to the same list object as `lst1`
    print("lst1 =", lst1)
    print("lst2 =", lst2)
    print("lst1 and lst2 are the same object:", id(lst1) == id(lst2))


main()
