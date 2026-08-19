# src/advanced/lifetimes/lifetime_function_ref.mojo
def shorter(a: String, b: String) -> ref[a, b] String:
    if a.byte_length() < b.byte_length():
        return a
    else:
        return b


def main() raises:
    var a: String = String("beautiful")
    var b: String = String("pretty")

    ref c = shorter(a, b)

    print(
        String('The first word you give is "{}" at address {}').format(
            a, String(Pointer(to=a))
        )
    )
    print(
        String('The second word you give is "{}" at address {}').format(
            b, String(Pointer(to=b))
        )
    )
    print(
        String('The shorter of the two words is "{}" at address {}').format(
            c, String(Pointer(to=c))
        )
    )
