# src/advanced/simd/simd_performance_benchmark.mojo
import std.benchmark


def plain_iterations[iter: Int, a: SIMD[DType.float64, 8]]():
    var result = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _i in range(iter):
        for _j in range(8):
            result[_j] += a[_j]
    print(result)
    return


def simd_operation[iter: Int, a: SIMD[DType.float64, 8]]():
    var result = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _ in range(iter):
        result += a
    print(result)
    return


def main() raises:
    comptime a = SIMD[DType.float64, 8](1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)
    comptime iter = Int(10_000_000)

    var report_plain_iter = std.benchmark.run(plain_iterations[iter, a])
    var report_simd_operation = std.benchmark.run(simd_operation[iter, a])

    report_plain_iter.print_full()
    report_simd_operation.print_full()
