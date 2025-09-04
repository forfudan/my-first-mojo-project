# src/advanced/ownership/lifetime_owner_reference_fixed.mojo
def main():
    var a = String("Hello, Mojo!")
    var ptr = Pointer(to=a)

    print("a is at address", String(ptr), "with de-referenced value:", ptr[])

    var b = a  # A copy is made, a is still valid
    print("The value of `a` is copied to `b`. `b` is with value:", b)

    # Dereferencing the pointer still gives the value of `a`
    print("a is at address", String(ptr), "with de-referenced value:", ptr[])
