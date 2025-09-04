# src/basic/composite/list_comprehension_print.mojo
def main():
    var a: List[None]
    _ = [print(i**3, end=", ") for i in range(10)]
