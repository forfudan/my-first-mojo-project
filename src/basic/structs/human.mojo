# src/basic/structs/human.mojo
from memory import UnsafePointer


struct Human:
    """A simple human structure."""

    var name: String
    var age: UInt8
    var height: Float16
    var date: List[UInt16]

    fn __init__(
        out self, name: String, age: UInt8, height: Float16, date: List[UInt16]
    ):
        """Initializes a human with a name."""
        self.name = name
        self.age = age
        self.height = height
        self.date = date


fn main():
    var human = Human(
        "Yuhao Zihong Mengzexianke Xianyong Zhu",
        124,
        1.70,
        List[UInt16](1901, 2, 5),
    )
    var ptr = UnsafePointer(to=human).bitcast[UInt8]()
    print("Fields of `human: Human` on stack")
    print("Byte 0x00-0x07 should be `data: UnsafePointer`:", end=" ")
    print((ptr + 0).bitcast[UnsafePointer[UInt8]]()[])
    print("Byte 0x08-0x0f should be `size: Int`:", end=" ")
    print((ptr + 8).bitcast[Int]()[])
    print("Byte 0x18 should be `age: UInt8`:", end=" ")
    print((ptr + 24).bitcast[UInt8]()[])
    print("Byte 0x1a-0x1b should be `height: Float16`:", end=" ")
    print((ptr + 26).bitcast[Float16]()[])
    print("Byte 0x20-0x27 should be `data: UnsafePointer`:", end=" ")
    print((ptr + 32).bitcast[UnsafePointer[UInt16]]()[])
    print("Byte 0x28-0x2f should be `size: Int`:", end=" ")
    print((ptr + 40).bitcast[Int]()[])
    print("Byte 0x30-0x37 should be `capacity: Int`:", end=" ")
    print((ptr + 48).bitcast[Int]()[])
    print("========================================")
    print("Data of `date: List[UInt16]` on heap")
    for i in range(0, 3):
        print(((ptr + 32).bitcast[UnsafePointer[UInt16]]()[] + i)[], end=" ")
