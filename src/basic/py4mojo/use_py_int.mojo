# src/basic/py4mojo/use_py_int.mojo

from python import Python
from decimo import BInt  # For verification


def main() raises:
    var py_int = Python.int(43)
    print("43^43 with Python's int:\n", py_int**py_int, end="\n\n", sep="")

    var mojo_int = Int(43)
    print(
        "43^43 with Mojo's Int:  \n", mojo_int**mojo_int, end="\n\n", sep=""
    )

    var decimo_int = BInt(43)
    print(
        "43^43 with Decimo's BInt:\n",
        decimo_int**decimo_int,
        end="\n\n",
        sep="",
    )
