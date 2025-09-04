# src/advanced/ownership/transfer_value_and_use_again.mojo
# This code will not compile
def main():
    var a = List[Float64](1.0, 2.0, 3.0, 4.0)

    # Transfer ownership from `a` to `b`
    var b = a^

    # After transferring ownership, `a` is no longer valid.
    for i in a:
        print(i, end="  ")
