# src/basic/structs/human.mojo
from std.memory import Pointer


struct Human:
    """A simple human structure."""

    var name: String
    var age: UInt8
    var height: Float16
    var date: List[UInt16]

    def __init__(
        out self,
        name: String,
        age: UInt8,
        height: Float16,
        var date: List[UInt16],
    ):
        """Initializes a human with a name."""
        self.name = name
        self.age = age
        self.height = height
        self.date = date^


def main():
    var human = Human(
        "Yuhao Zihong Mengzexianke Xianyong Zhu",
        124,
        1.70,
        [UInt16(1901), UInt16(2), UInt16(5)],
    )
    var ptr = Pointer(to=human).unsafe_bitcast[UInt8]()
    print("Fields of `human: Human` on stack")
    print("Byte 0x00-0x07 should be `data: Pointer`:", end=" ")
    print(ptr.unsafe_offset(0).unsafe_bitcast[Int]()[unsafe_offset=0])
    print("Byte 0x08-0x0f should be `size: Int`:", end=" ")
    print(ptr.unsafe_offset(8).unsafe_bitcast[Int]()[unsafe_offset=0])
    print("Byte 0x18 should be `age: UInt8`:", end=" ")
    print(ptr.unsafe_offset(24).unsafe_bitcast[UInt8]()[unsafe_offset=0])
    print("Byte 0x1a-0x1b should be `height: Float16`:", end=" ")
    print(ptr.unsafe_offset(26).unsafe_bitcast[Float16]()[unsafe_offset=0])
    print("Byte 0x20-0x27 should be `data: Pointer`:", end=" ")
    print(ptr.unsafe_offset(32).unsafe_bitcast[Int]()[unsafe_offset=0])
    print("Byte 0x28-0x2f should be `size: Int`:", end=" ")
    print(ptr.unsafe_offset(40).unsafe_bitcast[Int]()[unsafe_offset=0])
    print("Byte 0x30-0x37 should be `capacity: Int`:", end=" ")
    print(ptr.unsafe_offset(48).unsafe_bitcast[Int]()[unsafe_offset=0])
    print("========================================")
    print("Data of `date: List[UInt16]` on heap")
    var date_ptr = human.date.unsafe_ptr()
    for i in range(0, 3):
        print(date_ptr[unsafe_offset=i], end=" ")
