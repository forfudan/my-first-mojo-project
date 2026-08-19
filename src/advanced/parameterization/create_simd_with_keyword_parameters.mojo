# src/advanced/parameterization/create_simd_with_keyword_parameters.mojo
def main():
    var a = SIMD[dtype = DType.float64, length=4](1.0, 2.0, 3.0, 4.0)
    var b = SIMD[dtype = DType.int64, length=8](
        89, 117, 104, 97, 111, 90, 104, 117
    )
    var c = SIMD[dtype = DType.bool, length=2](True, False)
    var d = SIMD[dtype = DType.float32, length=1](1.0)

    print("a =", a)
    print("b =", b)
    print("c =", c)
    print("d =", d)
