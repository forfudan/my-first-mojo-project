# src/basic/controls/conditional_without_elif.mojo
def check_even_or_odd(number: Int):
    if number % 2 == 0:
        print(number, "is an even number.")
    else:
        print(number, "is an odd number.")


def main():
    check_even_or_odd(24123)
    check_even_or_odd(1982)
    check_even_or_odd(-123)
