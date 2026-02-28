# src/extend/decimo/decimal_type.mojo
from decimo import BigDecimal


def main():
    var a = BigDecimal("1.23456789")
    var b = BigDecimal("3.1415926")

    print(
        a, "* 10**8 =", a * BigDecimal("10") ** BigDecimal("8")
    )  # The correct result should be 123456789.0
    print(
        b, "** 10 =", b.power(BigDecimal(10), precision=100)
    )  # The correct result should have around 70 digits after the decimal point
