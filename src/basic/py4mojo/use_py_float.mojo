# src/basic/py4mojo/use_py_float.mojo

from python import Python


def main():
    var py_float = Python.float(200.808) / Python.float(12.34)
    print(
        "200.808 / 12.34 with Python's float:\n",
        py_float**py_float,
        end="\n\n",
        sep="",
    )

    var mojo_float = Float64(200.808) / Float64(12.34)
    print(
        "200.808 / 12.34 with Mojo's Float:  \n",
        mojo_float**mojo_float,
        end="\n\n",
        sep="",
    )
