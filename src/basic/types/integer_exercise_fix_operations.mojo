# src/basic/types/integer_exercise_fix_operations.mojo
def main():
    var a: Int128 = 0x1F2D
    var b: UInt32 = -23941
    var c: Int8 = 3
    var d: UInt8 = 256
    var e: Int64 = -123456789
    var f: Int16 = 1032512358647127389

    print("a + b =", a + b)
    print("c + d =", c + d)
    print("d + e =", d + e)
    print("f - d =", f - d)
