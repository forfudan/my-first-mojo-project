# src/basic/controls/conditional_without_else.mojo
# This code will not compile
def check_string(s: String) -> String:
    if s == "a":
        return "The string is 'a'."
    elif s == "b":
        return "The string is 'b'."
    elif s == "c":
        return "The string is 'c'."


def main():
    print(check_string("a"))
    print(check_string("b"))
    print(check_string("c"))
    print(check_string("d"))


# End of the code
