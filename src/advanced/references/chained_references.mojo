# src/advanced/references/chained_references.mojo


def return_as_reference(mut x: String) -> ref [x] String:
    var ref y = x
    return y


def main():
    var a = String("I am owned by 'a'")
    var ref b = a
    var ref c = b
    var ref d = return_as_reference(c)
    print("a:", a, "at", String(Pointer(to=a)))
    print("b:", b, "at", String(Pointer(to=b)))
    print("c:", c, "at", String(Pointer(to=c)))
    print("d:", d, "at", String(Pointer(to=d)))

    print("Changing `d`...")
    d = String("I am still owned by 'a' but I am longer now")
    print("a:", a, "at", String(Pointer(to=a)))
