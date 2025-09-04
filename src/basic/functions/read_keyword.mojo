# src/basic/functions/read_keyword.mojo
def print_list_of_string(read a: List[String]):
    # `a` is a read-only reference of the list passed into the function
    print("[", end="")
    for i in range(len(a)):
        if i < len(a) - 1:
            print(String('"{}"').format(a[i]), end=", ")
        else:
            print(String('"{}"').format(a[i]), end="]\n")


def main():
    var lst = List[String]("Mojo", "Miji", "is", "interesting")
    var new_lst = print_list_of_string(lst)
