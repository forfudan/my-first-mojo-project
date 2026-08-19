# src/basic/string/string_iteration.mojo
def main():
    var my_string = String("Hello, world! 你好，世界！")
    for char in my_string:
        print(char, end="")
    print()
