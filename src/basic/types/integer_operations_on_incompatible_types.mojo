# src/basic/types/integer_operations_on_incompatible_types.mojo
# This code will not compile
def main():
    var a: UInt8 = 12
    var b: Int8 = 23
    var c: Int128 = 1234

    print("a + b =", a + b)
    print("a - c =", a - c)
    print("b * c =", b * c)
