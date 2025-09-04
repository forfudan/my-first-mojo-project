# src/advanced/generic/absable_trait.mojo
def main():
    var a = -1
    var b = -0.5
    var c = String("Hello, Mojo!")
    print(abs(a))  # Output: 1
    print(abs(b))  # Output: 0.5
    print(abs(c))  # Output: "Hello, Mojo!" (string is unchanged)
