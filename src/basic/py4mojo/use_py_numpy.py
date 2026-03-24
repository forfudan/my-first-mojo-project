# src/basic/py4mojo/use_py_numpy.py

import numpy as np


def main():
    array_str = "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    a = np.fromstring(array_str, sep=",").reshape(5, 2)
    b = np.fromstring(array_str, sep=",").reshape(2, 5)
    a_mul_b = np.matmul(a, b)

    print("Array a (5x2):\n", a, end="\n\n", sep="")
    print("Array b (2x5):\n", b, end="\n\n", sep="")
    print("Result of a * b:\n", a_mul_b, end="\n\n", sep="")


main()
