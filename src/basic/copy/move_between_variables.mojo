# src/basic/variables/move_between_variables.mojo
def main():
    var lst1: List[Int] = [1, 2, 3]
    var lst2 = lst1^
    # Move the value of `lst1` into a new variable `lst2`
    print("lst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")

    var str1: String = "Hello"
    var str2 = str1^  # Move the value of `str1` into a new variable `str2`
    print()
    print("str2 =", str2)
