# src/basic/composite/list_assignment_with_only_equal_sign.mojo
def main():
    lst1 = [[1]]
    lst2 = lst1
    print("lst1[0][0] =", lst1[0][0])
    print("lst2[0][0] =", lst2[0][0])
