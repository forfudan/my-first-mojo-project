# src/basic/types/integers.mojo
def main():
    var a = 0x1F2D  # Hexadecimal
    var b = 0b1010  # Binary
    var c = -0o17  # Octal
    var d = 1234567890  # Decimal
    var e: UInt32 = 184  # 32-bit unsigned Integer
    var f = Int128(12345)  # 128-bit Integer from constructor
    var g: Int8 = Int8(
        12
    )  # 8-bit Integer from constructor and with type annotation
    var h = SIMD[DType.index, 1](10)  # Integer with index type
    print(a, b, c, d, e, f, g, h)
