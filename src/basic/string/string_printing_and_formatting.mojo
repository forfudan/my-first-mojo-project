# src/basic/string/string_printing_and_formatting.mojo
def main():
    var a = String("Today is {} {} {}").format(1, "Janurary", 2023)
    var b = String("{0} plus {1} equals {2}").format(1.1, 2.34, 3.45)
    var c = "{0} apples plus {1} oranges is {2}".format(3, 2, "nonsense")
    print(a)
    print(b)
    print(c)


# Output:
# Today is 1 Janurary 2023
# 1.1 plus 2.34 equals 3.45
# 3 apples plus 2 oranges is nonsense
