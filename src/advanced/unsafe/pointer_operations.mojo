# src/advanced/unsafe/pointer_operations.mojo
from std.memory import Pointer


def main():
    var a = 42
    var p = Pointer(to=a)
    print("Safe dereference:", p[])

    var lst: List[Int] = [1, 2, 3]
    var raw = lst.unsafe_ptr()
    print("First element: ", raw[unsafe_offset=0])
    print("Third element: ", raw.unsafe_offset(2)[unsafe_offset=0])

    # Nothing stops the following line. There is no fourth element.
    print("Out of bounds:  ", raw[unsafe_offset=9])
