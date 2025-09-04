# src/basic/variables/unintended_reassignment_in_nested_scopes.mojo
def main():
    var a = 1
    if a == 1:
        a = 2  # Reassign `a` to 2
        # This `a` is the same variable as the outer `a`
        # They both refer to the same address in memory
    print("a=", a)

    var b = 1
    if b == 1:
        var b = 2  # Create a new variable `b` in the local scope
        # This `b` shadows the outer `b`
        # They refer to different addresses in memory
    print("b=", b)
