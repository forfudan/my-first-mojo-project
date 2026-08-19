# src/basic/string/string_iteration_levels.mojo
def main():
    # "cafe" + combining acute accent (U+0301) + a grinning face (U+1F600).
    var s = "cafe\u0301\U0001f600"

    print("for char in s:                   ", end="")
    for char in s:
        print(char, end=" ")
    print()

    print("for cp in s.codepoints():        ", end="")
    for cp in s.codepoints():
        print(cp, end=" ")
    print()

    print("for b in s.bytes():              ", end="")
    for b in s.bytes():
        print(b, end=" ")
    print()

    print("for g in s.graphemes_reversed(): ", end="")
    for g in s.graphemes_reversed():
        print(g, end=" ")
    print()
