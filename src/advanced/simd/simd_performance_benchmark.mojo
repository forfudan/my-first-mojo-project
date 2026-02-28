# src/advanced/simd/simd_performance_benchmark.mojo
import benchmark


fn plain_iterations[iter: Int, a: SIMD[DType.float64, 8]]():
    result = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _i in range(iter):
        for _j in range(8):
            result[_j] += a[_j]
    print(result)
    return


fn simd_operation[iter: Int, a: SIMD[DType.float64, 8]]():
    result = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _ in range(iter):
        result += a
    print(result)
    return


fn main() raises:
    comptime a = SIMD[DType.float64, 8](1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    comptime iter = Int(10_000_000)

    var report_plain_iter = benchmark.run[func2 = plain_iterations[iter, a]](1)
    var report_simd_operation = benchmark.run[func2 = simd_operation[iter, a]](
        1
    )

    report_plain_iter.print_full()
    report_simd_operation.print_full()
