# src/basic/variables/variable_creation_without_var.mojo
# This code will not compile. Since Mojo v1.1.0, a new variable needs `var`.
def main():
    a = 1
    b = 2.5
    c = "Hello, world!"
    d = [1, 2, 3]
