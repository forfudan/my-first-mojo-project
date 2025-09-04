# src/advanced/references/transfer_ownership_via_reference.mojo
# This code will not compile
def main():
    var a = String("I am owned by `a`")
    var ref b = a
    print(a, "at", String(Pointer(to=a)))
    print(b, "at", String(Pointer(to=b)))

    b = String("I am owned by `a` but modified via `b`")
    print(a, "at", String(Pointer(to=a)))
    print(b, "at", String(Pointer(to=b)))

    var c = b^
    print(c, "at", String(Pointer(to=c)))
