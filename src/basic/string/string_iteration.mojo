# src/basic/string/string_iteration.mojo
def main():
    my_string = String("Hello, world! 你好，世界！")
    for char in my_string.codepoints():
        print(String(char), end="")


# def main():
#     var a = String("你好")
#     for i in a.as_bytes():
#         print(i[], end=" ")
#     # It prints: 228 189 160 229 165 189

# def main():
#     var a = String("Today is {day} {month} {year}").format(day=1, month="Janurary", year=2023)
#     var b = String("{0:.2f} plus {1:.2%} equals {2:.3g}").format(1.1, 2.34, 3.45)
