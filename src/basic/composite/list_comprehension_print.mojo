# src/basic/composite/list_comprehension_print.mojo
# This will not compile
def main():
    _ = [None]
    _ = [print(i**3, end=", ") for i in range(10)]
