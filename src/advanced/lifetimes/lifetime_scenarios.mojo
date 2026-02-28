# src/advanced/lifetimes/lifetime_scenarios.mojo
def main():
    var a: List[Int] = [1, 2, 3]
    var x = String("I am a string.")

    ref b = a
    ref y = x
    var c = Pointer(to=a)
    var z = Pointer(to=x)

    print("0-th element of `a` via `b`:", b[0])
    print("1-st element of `a` via `c`:", c[][1])

    var d = a^

    for i in range(0, 3):
        var e = d[i]
        print("Idx", i, "of `d` is:", e)

    x += " and I am modified."
    print(y)
    print(z[])

    print("The end of the example.")
