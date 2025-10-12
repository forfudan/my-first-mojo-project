# src/advanced/ownership/transfer_value_explicitly.mojo
def main():
    var a = List[Float64](1.0, 2.0, 3.0, 4.0)
    print(
        "The meta data of the list `a` is stored at address",
        String(Pointer(to=a)),
        "\nThe first element of the list `a` is stored at address",
        a._data,
        "\nThe list `a` contains ",
        end="",
    )
    for i in a:
        print(i, end="  ")
    print()

    # Transfer ownership from `a` to `b`
    var b = a^
    print(
        "The meta data of the list `b` is stored at address",
        String(Pointer(to=b)),
        "\nThe first element of the list `b` is stored at address",
        b._data,
        "\nThe list `b` contains ",
        end="",
    )
    for i in b:
        print(i, end="  ")
    print()
