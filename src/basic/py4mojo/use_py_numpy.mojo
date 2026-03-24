# src/basic/py4mojo/use_py_numpy.mojo

from python import Python


def main():
    var np = Python.import_module("numpy")
    var array_str = "1, 2, 3, 4, 5, 6, 7, 8, 9, 10"
    var a = np.fromstring(array_str, sep=",").reshape(5, 2)
    var b = np.fromstring(array_str, sep=",").reshape(2, 5)
    var a_mul_b = np.matmul(a, b)

    print("Array a (5x2):\n", a, end="\n\n", sep="")
    print("Array b (2x5):\n", b, end="\n\n", sep="")
    print("Result of a * b:\n", a_mul_b, end="\n\n", sep="")
