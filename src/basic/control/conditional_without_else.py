# src/basic/controls/conditional_without_else.py
def check_string(s: str) -> None:
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


main()
