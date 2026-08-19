# src/basic/py4mojo/use_py_print.mojo

from std.python import Python


def main() raises:
    Python.evaluate(
        'print(f"The value {-2} is an integer, and {3.1415926:.3%} is a'
        ' float in Python.")'
    )
