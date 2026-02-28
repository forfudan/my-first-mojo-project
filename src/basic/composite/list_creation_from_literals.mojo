# src/basic/composite/list_creation_from_literals.mojo
def main():
    my_list_of_integers = [1, 2, 3, 4, 5]
    var my_list_of_floats: List[Float64] = [0.125, 12.0, 12.625, -2.0, -12.0]
    var my_list_of_strings: List[String] = ["Mojo", "is", "awesome"]
    var my_list_of_list_of_integers: List[List[Int]] = [[1, 2], [3, 4], [5, 6]]

    print(my_list_of_integers[0])
    print(my_list_of_floats[0])
    print(my_list_of_strings[0])
    print(my_list_of_list_of_integers[0][0])
