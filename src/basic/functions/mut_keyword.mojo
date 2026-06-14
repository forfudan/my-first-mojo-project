# src/basic/functions/mut_keyword.mojo
from std.memory import Pointer


def changeit(mut a: Int8) raises:
    a = 10
    print(
        String(
            "In function call: argument `a` is of the value {} and the"
            " address {}"
        ).format(a, String(Pointer(to=a)))
    )


def main() raises:
    var x: Int8 = 5
    print(
        String(
            "Before change:    variable `x` is of the value {} and the"
            " address {}"
        ).format(x, String(Pointer(to=x)))
    )
    changeit(x)
    print(
        String(
            "Before change:    variable `x` is of the value {} and the"
            " address {}"
        ).format(x, String(Pointer(to=x)))
    )
