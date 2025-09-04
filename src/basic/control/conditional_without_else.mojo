# src/basic/controls/conditional_without_else.mojo
def check_string(s: String) -> None:
    if s == "a":
        print("The string is 'a'.")
    elif s == "b":
        print("The string is 'b'.")
    elif s == "c":
        print("The string is 'c'.")


def main() -> None:
    check_string("a")
    check_string("b")
    check_string("c")
    check_string("d")


# End of the code
