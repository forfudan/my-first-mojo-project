# src/basic/py4mojo/use_py_functions.py


def main():
    py_max = max(3, 5, 2, 8, 1)  # Call Python's built-in max function
    print(
        "The maximum value among (3, 5, 2, 8, 1) using Python's max():\n",
        py_max,
        end="\n\n",
    )

    py_len = len("Hello, world! 你好世界！")  # Call Python's built-in len function
    print(
        "The length of 'Hello, world! 你好世界！' using Python's len():\n",
        py_len,
        end="\n\n",
    )


main()
