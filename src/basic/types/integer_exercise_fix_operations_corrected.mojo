# src/basic/types/integer_exercise_fix_operations_corrected.mojo
def main():
    var a: Int128 = 0x1F2D  # This is okay
    # var b: UInt32 = -23941
    var b: Int32 = -23941  # Corrected to signed integer
    var c: Int8 = 3  # This is okay
    # var d: UInt8 = 256
    var d: UInt16 = 256  # Corrected to avoid overflow
    var e: Int64 = -123456789
    # var f: Int16 = 1032512358647127389
    var f: Int128 = 1032512358647127389  # Corrected to avoid overflow

    print("a + b =", a + Int128(b))  # Ensure type consistency
    print(
        "c + d =",
        Int32(c) + Int32(d)
        # Int32 is superset of Int8 and UInt16
    )
    print("d + e =", Int64(d) + e)  # Ensure type consistency
    print("f - d =", f - Int128(d))  # Ensure type consistency
