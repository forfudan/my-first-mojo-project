def main():
    var a: Float64 = 1.23456789  # Cannot be represented exactly in binary
    var b: Float64 = 3.1415926

    print(
        a, "* 10.0**8 =", a * 10.0**8
    )  # The correct result should be 123456789.0
    print(
        b, "** 10 =", b**10
    )  # The correct result should have around 70 digits after the decimal point
