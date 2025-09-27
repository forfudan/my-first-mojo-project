# src/basic/copy/copy_values_or_references.py
def main():
    lst1 = [1, 2, 3]  # `lst1` is now referring to a list object with three integers
    lst2 = lst1  # `lst2` is now referring to the same list object as `lst1`
    print("lst1 =", lst1)
    print("lst2 =", lst2)
    print("Changing lst1[0] to -1")
    lst1[0] = -1  # This modifies the list object that both `lst1` and `lst2` refer to
    print("lst1 =", lst1)
    print("lst2 =", lst2)


main()
