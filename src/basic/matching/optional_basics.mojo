# src/basic/matching/optional_basics.mojo
def main():
    var a: Optional[Int] = 5
    var b: Optional[Int] = None
    print(a, b)

    if a:
        print("a holds", a.value())
    if not b:
        print("b is empty")

    print(b.or_else(0))
