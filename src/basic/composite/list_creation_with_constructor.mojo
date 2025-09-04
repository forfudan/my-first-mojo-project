# src/basic/composite/list_creation.mojo
def main():
    my_list_of_integers = List[Int](1, 2, 3, 4, 5)
    var my_list_of_floats = List[Float64](0.125, 12.0, 12.625, -2.0, -12.0)
    var my_list_of_strings: List[String] = List[String]("Mojo", "is", "awesome")
