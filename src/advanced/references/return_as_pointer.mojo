# src/advanced/references/return_as_pointer.mojo
def return_first_element_as_pointer(
    mut a: List[String],
) -> Pointer[String, origin_of(a)]:
    if len(a) == 0:
        raise Error("List is empty.")
    else:
        return Pointer(to=a[0])


def main():
    var lst: List[String] = ["Mojo", "is", "interesting"]
    print("The 1st item of the list is '", lst[0], "'", sep="")
    var ptr = return_first_element_as_pointer(lst)
    ptr[] = String("Miji")
    print("The 1st item of the list is '", lst[0], "' now", sep="")
