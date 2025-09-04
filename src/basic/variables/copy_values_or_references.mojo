# src/basic/variables/copy_values_or_references.mojo
def main():
    var lst1: List[Int] = [1, 2, 3]
    # `lst1` is a variable of type `List[Int]` at Address 1
    var lst2: List[Int] = lst1
    # `lst2` is a variable of type `List[Int]` at Address 2

    print("lst1 =", end=" ")
    for i in lst1:
        print(i, end=", ")
    print("\nlst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")

    print("\nChanging lst1[0] to -1")
    lst1[0] = -1

    print("lst1 =", end=" ")
    for i in lst1:
        print(i, end=", ")
    print("\nlst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")
