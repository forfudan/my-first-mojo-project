# src/basic/string/string_literal_vs_string.mojo
# This is only relevant for Mojo v25.4 and earlier.
def main():
    var s1 = (
        "I am of the string literal type with the type name `StringLiteral`"
    )
    var s2 = String("I am of the string type with the type name `String`")

    var ptr1 = s1.unsafe_ptr()  # Unsafe pointer to the string literal
    var ptr2 = s2._ptr_or_data  # Unsafe pointer to the string

    print(s1)
    print("My meta data is store at the address", String(Pointer(to=s1)))
    print("My first letter is stored at the address ", ptr1)
    for i in range(66):
        # Print each character of the string literal unsafely
        print(chr(Int(ptr1[unsafe_offset=i])), end=" ")
    print()
    print("=" * 80)
    print(s2)
    print("My meta data is stored at the address", String(Pointer(to=s2)))
    print("My first letter is stored at the address", ptr2)
    for i in range(51):
        # Print each character of the string unsafely
        print(chr(Int(ptr2[unsafe_offset=i])), end=" ")
