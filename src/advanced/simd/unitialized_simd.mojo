def main():
    var result = Float64(0)
    var d = SIMD[DType.float64, 32](1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0,
                                     9.0, 10.0, 11.0, 12.0, 13.0, 14.0, 15.0, 16.0,
                                     17.0, 18.0, 19.0, 20.0, 21.0, 22.0, 23.0, 24.0,
                                     25.0, 26.0, 27.0, 28.0, 29.0, 30.0, 31.0, 32.0)
    for i in range(len(d)):
        result += d[i]
    print("Sum of SIMD elements by iteration:", result)
    print("Sum of SIMD elements by method `reduce_add()`:", d.reduce_add())
    print("Expected: 528.0")