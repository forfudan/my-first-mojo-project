def main():
    var a = String("I am owned by `a`")
    var ref b = a
    var ref c = b
    var d = Pointer(to=c)
    var e = Pointer[type=String, origin = __origin_of(a)](to=a)
    print("`a`:", a, "at", String(Pointer(to=a)))
    print("`b`:", b, "at", String(Pointer(to=b)))
    print("`c`:", c, "at", String(Pointer(to=c)))
    print("`d[]`:", d[], "at", String(Pointer(to=d[])))
    print("`e[]`:", e[], "at", String(Pointer(to=e[])))

    var ref f = a._ptr_or_data
    print(String(f))
    # var z = a^
    # print(String(f))
