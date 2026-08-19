# src/basic/composite/list_printing.mojo
def main():
    var my_list_of_floats: List[Float64] = [0.125, 12.0, 12.625, -2.0, -12.0]
    var my_list_of_strings: List[String] = ["Mojo", "is", "awesome"]
    print(my_list_of_floats)
    print(my_list_of_strings)
