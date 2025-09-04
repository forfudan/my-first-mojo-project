# src/basic/control/
# loop_over_iterators_with_while.mojo
def main():
    var iterator = range(10)

    # Replacement for the for loop
    while iterator.__has_next__():
        i = iterator.__next__()
        print(i, "at", String(Pointer(to=i)))
    # End of the replacement
