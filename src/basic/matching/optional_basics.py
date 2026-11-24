# src/basic/matching/optional_basics.py
def main():
    a: int | None = 5
    b: int | None = None
    print(a, b)

    if a is not None:
        print("a holds", a)
    if b is None:
        print("b is empty")

    print(b if b is not None else 0)


main()
