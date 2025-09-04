# src/advanced/ownership/destroy_value.mojo
# This code will not compile
def main():
    var a: Int = 1

    if True:
        var b: Int = 100
        print("b =", b)

    print("a =", a)
    print("b= ", b)  # Lifetime of b ends, the value is destroyed too
