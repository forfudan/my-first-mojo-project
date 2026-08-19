# src/basic/string/t_string.mojo
def main():
    var name = "Mojo"
    var year = 2026

    var greeting = t"Hello, {name}! The year is {year}."
    print(greeting)

    # A t-string can be turned into a String when you need to keep it.
    var kept = String(t"{name} was released in {year}.")
    print(kept)

    # Expressions are allowed inside the braces.
    print(t"1 + 2 = {1 + 2}")
