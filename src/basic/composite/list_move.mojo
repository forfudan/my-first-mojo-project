# src/basic/composite/list_move.mojo
def main():
    var lst1: List[List[Int]] = [[1, 2], [3, 4]]
    print("Before moving the list:")
    print("lst1 =", lst1)

    var lst2 = lst1^
    print("After moving the list:")
    print("lst2 =", lst2)

    # print("Attempting to access lst1 after move:")
    # print("lst1 =", lst1)
