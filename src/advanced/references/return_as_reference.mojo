# src/advanced/references/return_as_reference.mojo
def return_first_element_as_reference(
    mut a: List[String],
) raises -> ref[origin_of(a[0])] String:
    if len(a) == 0:
        raise Error("List is empty.")
    else:
        return ref a[0]


def main() raises:
    var lst: List[String] = ["Mojo", "is", "interesting"]
    print("The 1st item of the list is '", lst[0], "'", sep="")
    ref first = return_first_element_as_reference(lst)
    first = String("Miji")
    print("The 1st item of the list is '", lst[0], "' now", sep="")
