# src/basic/variables/implicit_copy_between_variables_errors.mojo
# This will not compile from Mojo v0.25.6
def main():
    var lst1: List[Int] = [1, 2, 3]
    var lst2 = lst1
    print("lst1 =", end=" ")
    for i in lst1:
        print(i, end=", ")
    print("\nlst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")
