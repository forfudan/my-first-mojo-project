# src/advanced/lifetimes/chained_lifetime.mojo

def main():
    var a = String("I am owned by `a`")
    ref b = a
    ref c = b
    var d = Pointer(to=c)
    var e = Pointer[T=String, origin = origin_of(a)](to=a)
    print("`a`:", a, "at", String(Pointer(to=a)))
    print("`b`:", b, "at", String(Pointer(to=b)))
    print("`c`:", c, "at", String(Pointer(to=c)))
    print("`d[]`:", d[], "at", String(Pointer(to=d[])))
    print("`e[]`:", e[], "at", String(Pointer(to=e[])))