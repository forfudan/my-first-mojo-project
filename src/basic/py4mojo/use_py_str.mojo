# src/basic/py4mojo/use_py_str.mojo

from python import Python


def main() raises:
    var py_str = Python.str("Hello, Python! 你好，蟒蛇！")
    print("Python's str, iterate and print each character:")
    for i in py_str:
        print(i, end="")

    print("\n")

    var mojo_str = String("Hello, Mojo! 你好，魔咒！")
    print("Mojo's String, iterate and print each character:")
    for i in mojo_str.codepoints():
        print(i, end="")
