# src/basic/py4mojo/use_py_decimal.mojo

from python import Python
import decimo  # Pure Mojo implementation


def main():
    var decimal = Python.import_module("decimal")
    decimal.getcontext().prec = 36  # Set precision to 36 decimal places
    var py_pi = decimal.Decimal("3.1415926535897932384626433832795028841971")
    var py_e = decimal.Decimal("2.7182818284590452353602874713526624977572")
    var py_ratio = py_pi / py_e
    print(
        "The value of pi divided by e using Python's Decimal:\n",
        py_ratio,
        end="\n\n",
    )

    var mojo_pi = decimo.Decimal("3.1415926535897932384626433832795028841971")
    var mojo_e = decimo.Decimal("2.7182818284590452353602874713526624977572")
    var mojo_ratio = mojo_pi / mojo_e
    print(
        "The value of pi divided by e using Mojo's Decimal:\n",
        mojo_ratio,
    )
