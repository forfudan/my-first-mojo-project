# src/basic/composite/list_printing.mojo
def print_list_of_floats(array: List[Float64]):
    print("[", end="")
    for i in range(len(array)):
        if i < len(array) - 1:
            print(array[i], end=", ")
        else:
            print(array[i], end="]\n")


def print_list_of_strings(array: List[String]):
    print("[", end="")
    for i in range(len(array)):
        if i < len(array) - 1:
            print(array[i], end=", ")
        else:
            print(array[i], end="]\n")


def main():
    var my_list_of_floats: List[Float64] = [0.125, 12.0, 12.625, -2.0, -12.0]
    var my_list_of_strings: List[String] = ["Mojo", "is", "awesome"]
    print("Printing lists directly with built-in print():")
    print(my_list_of_floats)
    print(my_list_of_strings)
    print()
    print("Printing lists using custom print functions:")
    print_list_of_floats(my_list_of_floats)
    print_list_of_strings(my_list_of_strings)
