# src/basic/control/loop_over_iterators_with_while.mojo

from std.memory import Pointer


def main() raises:
    var iterator = range(10)
    var i: Int

    # Replacement for the for loop
    while True:
        try:
            i = iterator.__next__()
            print(i, "at", String(Pointer(to=i)))
        except:  # StopIteration ends the iteration
            break
    # End of the replacement
