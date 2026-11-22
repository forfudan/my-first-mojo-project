# src/advanced/lifetimes/combined_lifetime_wrong.mojo
# This code will not compile
def main() raises:
    var a: Int = Int(input("Type the first integer `a`: "))
    var b: Int = Int(input("Type the second integer `b`: "))
    var c: Pointer[Int, origin_of(a)]

    if a < b:
        c = Pointer(to=a)
    else:
        c = Pointer(to=b)

    print(
        "The first integer you give is", a, "at address", String(Pointer(to=a))
    )
    print(
        "The second integer you give is", b, "at address", String(Pointer(to=b))
    )
    print("The smaller of the two integers is", c[], "at address", String(c))
