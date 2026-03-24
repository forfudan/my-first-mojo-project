# src/basic/py4mojo/use_py_decimal.py

import decimal


def main():
    decimal.getcontext().prec = 36  # Set precision to 36 decimal places
    py_pi = decimal.Decimal("3.1415926535897932384626433832795028841971")
    py_e = decimal.Decimal("2.7182818284590452353602874713526624977572")
    py_ratio = py_pi / py_e
    print(
        "The value of pi divided by e using Python's Decimal:\n",
        py_ratio,
        end="\n\n",
    )


main()
