# src/advanced/simd/create_simd.mojo
def main():
    var a = SIMD[DType.float64, 4](1.0, 2.0, 3.0, 4.0)
    var b = SIMD[DType.int64, 8](89, 117, 104, 97, 111, 90, 104, 117)
    var c = SIMD[DType.bool, 2](True, False)
    var d = SIMD[DType.uint8, 8](1, 2, 3, 4)
    var e = SIMD[DType.float32](1.0)
    print("a =", a)
    print("b =", b)
    print("c =", c)
    print("d =", d)
    print("e =", e)
