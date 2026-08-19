# src/basic/py4mojo/use_py_functions.mojo

from std.python import Python


def main() raises:
    var py = Python.import_module("builtins")
    var py_max = py.max(3, 5, 2, 8, 1)  # Call Python's built-in max function
    print(
        "The maximum value among (3, 5, 2, 8, 1) using Python's max():\n",
        py_max,
        end="\n\n",
    )

    var mojo_max = max(3, 5, 2, 8, 1)  # Call Mojo's built-in max function
    print(
        "The maximum value among (3, 5, 2, 8, 1) using Mojo's max():\n",
        mojo_max,
        end="\n\n",
    )

    var py_len = py.len(
        "Hello, world! 你好世界！"
    )  # Call Python's built-in len function
    print(
        "The length of 'Hello, world! 你好世界！' using Python's len():\n",
        py_len,
        end="\n\n",
    )

    var mojo_len = String(
        "Hello, world! 你好世界！"
    ).byte_length()  # Mojo has no len() for strings
    print(
        "The length of 'Hello, world! 你好世界！' using Mojo's byte_length():\n",
        mojo_len,
        end="\n\n",
    )

    var mojo_codepoints = String(
        "Hello, world! 你好世界！"
    ).count_codepoints()  # This is what Python's len() counts
    print(
        "The length of 'Hello, world! 你好世界！' using Mojo's count_codepoints():\n",
        mojo_codepoints,
        end="\n\n",
    )
