# src/advanced/simd/simd_performance.mojo
from std.time import perf_counter_ns


def main():
    var number_of_iterations = 1000000
    var a = SIMD[DType.float64, 8](1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0)

    # We will add up `a` element-wise for 1,000,000 times.

    # Use plain iterations
    var t0 = perf_counter_ns()
    var result_iter = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _i in range(number_of_iterations):
        for _j in range(8):
            result_iter[_j] += a[_j]
    var t_delta = perf_counter_ns() - t0
    print("Use plain iterations over all elements:")
    print("Result is", result_iter, "in", t_delta, "nano-seconds.")

    print()

    # Use SMID operation
    t0 = perf_counter_ns()
    var result_simd = SIMD[DType.float64, 8](0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
    for _ in range(number_of_iterations):
        result_simd += a
    t_delta = perf_counter_ns() - t0
    print("Use vectorized operation on all elements:")
    print("Result is", result_simd, "in", t_delta, "nano-seconds.")
    print()
