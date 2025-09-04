def main():
    var numbers: List[String] = ["I", "am", "a", "list", "of", "strings"]
    # Create a list iterator
    var iterator = numbers.__iter__()

    # Replacement for the for loop
    while iterator.__has_next__():
        ref i = iterator.__next__()
        print(i, "at", String(Pointer(to=i)))
    # End of the replacement
