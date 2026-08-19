# src/advanced/add_simds.mojo
def main():
    var a = SIMD[DType.float64, 4](1.0, 2.0, 3.0, 4.0)
    var b = SIMD[DType.float64, 4](5.0, 6.0, 7.0, 8.0)
    var result = a + b
    print(result)
    # Output: [6.0, 8.0, 10.0, 12.0]
