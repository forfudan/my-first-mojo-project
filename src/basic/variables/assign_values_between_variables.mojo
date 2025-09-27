# src/basic/variables/assign_values_between_variables.mojo
def main():
    var a = 1  # Put the value 1 into the variable with name `a` and type `Int`
    var b = a  # Copy the value of `a` into the variable with name `b` and type `Int`
    print("a =", a)
    print("b =", b)
    print(
        "a and b has the same address:",
        Pointer(to=a) == Pointer(to=b),
    )

    var str1: String = "Hello"
    var str2 = str1
    print("str1 =", str1)
    print("str2 =", str2)
    print(
        "str1 and str2 has the same address:",
        Pointer(to=str1) == Pointer(to=str2),
    )
