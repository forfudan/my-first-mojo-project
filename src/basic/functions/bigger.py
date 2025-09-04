# src/basic/functions/bigger.mojo
def bigger(a: int, b: int | None = None) -> int:
    """Returns the bigger of one or two integers.

    Args:
        a (int): First integer.
        b (int | None): Second integer. Defaults to None.

    Returns:
        int: The bigger of the two integers if both are provided,
            otherwise returns the first integer.
    """

    if b is None:
        return a
    return a if a > b else b


def main():
    print(bigger(1, 2))
    print(bigger(3))


main()
