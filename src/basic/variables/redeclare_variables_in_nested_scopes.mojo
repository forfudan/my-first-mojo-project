# src/basic/variables/redeclare_variables_in_nested_scopes.mojo
def main():
    var a: Int = 1
    print("a =", a, " (before the if block)")
    if a < 10:
        var a: Float64 = 3.1415926
        print("a =", a, " (inside the if block)")
    print("a =", a, " (after the if block)")
