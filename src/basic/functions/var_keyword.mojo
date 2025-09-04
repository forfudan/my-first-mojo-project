# src/basic/functions/var_keyword.mojo
from memory import Pointer


def changeit(var a: Int8):
    print(
        String(
            "Within function call: argument `a` is of the value {} and the"
            " address {}"
        ).format(a, String(Pointer(to=a)))
    )
    a = 10
    print("Within function call: change value of a to 10 with `a = 10`")
    print(
        String(
            "Within function call: argument `a` is of the value {} and the"
            " address {}"
        ).format(a, String(Pointer(to=a)))
    )


def main():
    var x: Int8 = 5
    print(
        String(
            "Before function call: variable `x` is of the value {} and the"
            " address {}"
        ).format(x, String(Pointer(to=x)))
    )
    changeit(x)
    print(
        String(
            "Before function call: variable `x` is of the value {} and the"
            " address {}"
        ).format(x, String(Pointer(to=x)))
    )
