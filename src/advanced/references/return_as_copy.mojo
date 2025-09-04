# src/advanced/references/return_as_copy.mojo
def return_first_element_as_copy(mut a: List[String]) -> String:
    if len(a) == 0:
        raise Error("List is empty.")
    else:
        return a[0]


def main():
    var lst = List[String]("Mojo", "is", "interesting")
    print("The 1st item of the list is '", lst[0], "'", sep="")
    var val = return_first_element_as_copy(lst)
    val = String("Miji")
    print("The 1st item of the list is '", lst[0], "' now", sep="")
