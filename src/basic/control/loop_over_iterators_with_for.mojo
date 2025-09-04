# src/miji/basic/control/
# loop_over_iterators_with_for.mojo
def main():
    var iterator = range(10)

    # You can also use `for i in range(10)`
    # Mojo automatically creates an iterator
    for i in iterator:
        print(i, "at", String(Pointer(to=i)))
