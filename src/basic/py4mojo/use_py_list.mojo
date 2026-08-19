# src/basic/py4mojo/use_py_str.mojo

from std.python import Python


def main() raises:
    var py_str = Python.str("Hello, Python!")
    print("Python's str:\n", py_str, end="\n\n", sep="")

    var mojo_str = String("Hello, Mojo!")
    print("Mojo's String:\n", mojo_str, end="\n\n", sep="")

    var py_list = Python.list(
        1, 2, 3, 3.14, "Mojo", Python.list("nested", "list")
    )
    print("Python's list:\n", py_list, end="\n\n", sep="")

    var mojo_list = [1, 2, 3]
    print("Mojo's List:\n", mojo_list, end="\n\n", sep="")

    var py_dict = Python.dict(a=1, b=2, c=3)
    print("Python's dict:\n", py_dict, end="\n\n", sep="")

    var mojo_dict = {"a": 1, "b": 2, "c": 3}
    print("Mojo's Dict:\n", mojo_dict, end="\n\n", sep="")
