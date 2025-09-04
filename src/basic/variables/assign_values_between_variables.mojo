# src/basic/variables/assign_values_between_variables.mojo
def main():
    var a = 1  # Put the value 1 into the variable with name `a` and type `Int`
    var b = a  # Copy the value of `a` into the variable with name `b` and type `Int`
    print("a =", a)
    print("b =", b)

    var str1: String = "Hello"
    var str2 = str1
    print("str1 =", str1)
    print("str2 =", str2)

    var lst1: List[Int] = [1, 2, 3]
    # Put the value [1, 2, 3] into the variable with name `lst1` and type `List[Int]`
    var lst2 = lst1
    # Copy the value of `lst1` into the variable with name `lst2` and type `List[Int]`
    print("lst1 =", end=" ")
    for i in lst1:
        print(i, end=", ")
    print("\nlst2 =", end=" ")
    for i in lst2:
        print(i, end=", ")
