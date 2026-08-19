# src/advanced/lifetimes/combined_lifetime_string.mojo
def main() raises:
    var a: String = input("Type the first word `a`: ")
    var b: String = input("Type the first word `b`: ")
    var c: Pointer[String, origin = origin_of(a, b)]

    if a.byte_length() < b.byte_length():
        c = Pointer[String, origin = origin_of(a, b)](to=a)
    else:
        c = Pointer[String, origin = origin_of(a, b)](to=b)

    print("The first word you give is", a, "at address", String(Pointer(to=a)))
    print("The second word you give is", b, "at address", String(Pointer(to=b)))
    print("The shorter of the two words is", c[], "at address", String(c))
