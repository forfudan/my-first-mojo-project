# src/basic/composite/list_copy.mojo
def main():
    var lst1: List[List[Int]] = [[1]]
    var lst2 = lst1.copy()
    print("Before modifying the copied list:")
    print("lst1[0][0] =", lst1[0][0])
    print("lst2[0][0] =", lst2[0][0])

    lst2[0][0] = 100
    print("After modifying the copied list:")
    print("lst1[0][0] =", lst1[0][0])
    print("lst2[0][0] =", lst2[0][0])
