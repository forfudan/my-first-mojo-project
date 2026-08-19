# src/advanced/lifetimes/lifetime_function_pointer.mojo
def shorter(
    word1: String, word2: String
) -> Pointer[String, origin_of(word1, word2)]:
    if word1.byte_length() < word2.byte_length():
        return Pointer[String, origin_of(word1, word2)](to=word1)
    else:
        return Pointer[String, origin_of(word1, word2)](to=word2)


def main() raises:
    var a: String = String("beautiful")
    var b: String = String("pretty")

    var c = shorter(a, b)

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
            c[], String(Pointer(to=c[]))
        )
    )
