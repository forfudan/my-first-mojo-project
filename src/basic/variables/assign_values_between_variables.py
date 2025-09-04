# src/basic/variables/assign_values_between_variables.py
def main():
    a = 1  # `a` is now referring to an int object with value 1
    b = a  # `b` is now referring to an int object with value 1
    print("a =", a)
    print("b =", b)

    str1 = "Hello"  # `str1` is now referring to a string object with value "Hello"
    str2 = str1  # `str2` is now referring to the same string object as `str1`
    print("str1 =", str1)
    print("str2 =", str2)

    lst1: list[int] = [1, 2, 3]
    # `lst1` is now referring to a list object with three integers
    lst2: list[int] = lst1  # `lst2` is now referring to the same list object as `lst1`
    print("lst1 =", lst1)
    print("lst2 =", lst2)


main()
