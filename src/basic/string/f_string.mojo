# src/basic/string/f_string.mojo
# This code will not compile
def main():
    var a = String("Today is {day} {month} {year}").format(
        day=1, month="Janurary", year=2023
    )
    var b = String("{0:.2f} plus {1:.2%} equals {2:.3g}").format(
        1.1, 2.34, 3.45
    )


print(a)  # Not working in Mojo
print(b)  # Not working in Mojo
