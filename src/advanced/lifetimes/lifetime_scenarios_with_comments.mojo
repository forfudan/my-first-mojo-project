# src/advanced/lifetimes/lifetime_scenarios_with_comments.mojo
def main():
    var a: List[Int] = [1, 2, 3]  # Lifetime of `a` starts here
    var x = String("I am a string.")  # Lifetime of `x` starts here

    ref b = a  # Lifetime of `b` starts here, sharing `a`
    ref y = x  # Lifetime of `y` starts here, sharing `x`
    var c = Pointer(to=a)  # Lifetime of `c` starts here, pointing to `a`
    var z = Pointer(to=x)  # Lifetime of `z` starts here, pointing to `x`

    print(
        "0-th element of `a` via `b`:", b[0]
    )  # Lifetime of `b` ends here, last used
    print(
        "1-st element of `a` via `c`:", c[][1]
    )  # Lifetime of `c` ends here, last used

    var d = a^  # Lifetime of `d` starts here, transferring ownership from `a`
    # Lifetime of `a` ends here, ownership transferred to `d`

    for i in range(0, 3):  # Lifetime of `i` starts here
        var e = d[i]  # Lifetime of `e` starts here, each loop iteration
        print(
            "Idx", i, "of `d` is:", e
        )  # Lifetime of `e` ends here, out of scope

    x += " and I am modified."
    print(y)  # Lifetime of `y` ends here, last used
    print(z[])  # Lifetime of `z` ends here, last used
    # Lifetime of `x` ends here, last used via `z`

    print("The end of the example.")
