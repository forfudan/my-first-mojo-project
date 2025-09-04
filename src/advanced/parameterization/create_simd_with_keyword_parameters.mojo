# src/advanced/parameterization/create_simd_with_keyword_parameters.mojo
def main():
    var a = SIMD[dtype = DType.float64, size=4](1.0, 2.0, 3.0, 4.0)
    var b = SIMD[dtype = DType.int64, size=8](
        89, 117, 104, 97, 111, 90, 104, 117
    )
    var c = SIMD[dtype = DType.bool, size=2](True, False)
    var d = SIMD[dtype = DType.uint8, size=8](1, 2, 3, 4)
    var e = SIMD[dtype = DType.float32, size=1](1.0)

    print("a =", a)
    print("b =", b)
    print("c =", c)
    print("d =", d)
    print("e =", e)
