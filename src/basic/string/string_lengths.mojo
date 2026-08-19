# src/basic/string/string_lengths.mojo
def main():
    # Both strings display as "café", but they are encoded differently.
    # The first one uses the single code point U+00E9.
    # The second one uses "e" (U+0065) followed by a combining acute accent
    # (U+0301), which is written here with the `\u0301` escape sequence.
    var precomposed = "caf\u00e9"
    var decomposed = "cafe\u0301"

    print("precomposed:", precomposed)
    print("    byte_length()      =", precomposed.byte_length())
    print("    count_codepoints() =", precomposed.count_codepoints())
    print("    count_graphemes()  =", precomposed.count_graphemes())

    print("decomposed :", decomposed)
    print("    byte_length()      =", decomposed.byte_length())
    print("    count_codepoints() =", decomposed.count_codepoints())
    print("    count_graphemes()  =", decomposed.count_graphemes())
