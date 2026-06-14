# src/basic/control/loop_over_list_with_while.mojo

from std.memory import Pointer


def main() raises:
    var numbers: List[String] = ["I", "am", "a", "list", "of", "strings"]
    # Create a list iterator
    var iterator = numbers.__iter__()

    # Replacement for the for loop
    while True:
        try:
            ref i = iterator.__next__()
            print(i, "at", String(Pointer(to=i)))
        except:  # StopIteration ends the iteration
            break
    # End of the replacement
