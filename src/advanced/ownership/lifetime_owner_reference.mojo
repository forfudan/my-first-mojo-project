# src/advanced/ownership/lifetime_owner_reference.mojo
# This code will not compile
def main():
    var a = String("Hello, Mojo!")
    var ptr = Pointer(to=a)

    print("a is at address", String(ptr), "with de-referenced value:", ptr[])

    var b = a^  # Lifetime of `a` ends here
    print("The ownership is transferred to `b` with value: ", b)

    print(ptr[])
