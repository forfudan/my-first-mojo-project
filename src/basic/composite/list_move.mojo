# src/basic/composite/list_move.mojo
def main():
    var lst1: List[List[Int]] = [[1]]
    print("Before moving the list:")
    print("lst1[0][0] =", lst1[0][0])

    var lst2 = lst1^
    print("After moving the list:")
    print("lst2[0][0] =", lst2[0][0])

    # print("Attempting to access lst1 after move:")
    # print("lst1[0][0] =", lst1[0][0])
