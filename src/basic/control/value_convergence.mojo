# src/basic/controls/value_convergence.mojo
fn value_convergence(
    var value: Float64,
    tolerance: Float64 = 0.01,
) -> Float64:
    while abs(value - 1) >= tolerance:
        value = (value + 1) / 2.0
        print("Current value:", value)
    return value


fn main():
    print("Converged value:", value_convergence(100.0, tolerance=0.0001))
