# src/advanced/references/ref_in_local_scope.mojo
def main():
    var a = String("I am owned by `a`")
    var ref b = a
    print(a, "at", String(Pointer(to=a)))
    print(b, "at", String(Pointer(to=b)))

    b = String("I am owned by `a` but modified via `b`")
    print(a, "at", String(Pointer(to=a)))
    print(b, "at", String(Pointer(to=b)))
