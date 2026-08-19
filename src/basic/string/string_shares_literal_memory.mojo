# src/basic/string/string_shares_literal_memory.mojo
def main():
    var a = "a long string literal that does not fit in 23 bytes"
    var b = "a long string literal that does not fit in 23 bytes"
    var c: StaticString = "a long string literal that does not fit in 23 bytes"

    print("String       a points at:", String(a.unsafe_ptr()))
    print("String       b points at:", String(b.unsafe_ptr()))
    print("StaticString c points at:", String(c.unsafe_ptr()))
    print()

    a += "!"  # the first modification makes `a` allocate its own memory
    print('after `a += "!"`:')
    print("String       a points at:", String(a.unsafe_ptr()))
    print("String       b points at:", String(b.unsafe_ptr()))
