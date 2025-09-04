# src/basic/types/integer_operations_with_type_conversion.mojo
def main():
    var a: UInt8 = 12
    var b: Int8 = 23
    var c: Int128 = 1234

    print("a + b =", UInt16(a) + UInt16(b))  # Type conversion to UInt16
    print("a - c =", Int128(a) - c)  # Type conversion to Int128
    print("b * c =", Int64(b) * Int64(c))  # Type conversion to Int64
