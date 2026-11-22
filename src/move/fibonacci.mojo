from std.time import perf_counter_ns


def fib(n: Int64) -> Int64:
    if n <= 1:
        return n
    return fib(n - 1) + fib(n - 2)


def main():
    var start = perf_counter_ns()
    for i in range(40):
        print(fib(Int64(i)), end=", ")
    print()
    print("Time:", Float64(perf_counter_ns() - start) / 1e9, "seconds")
