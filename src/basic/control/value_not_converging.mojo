# src/basic/control/value_not_converging.mojo
def value_convergence(var value: Float64, tolerance: Float64 = 0.01) -> Float64:
    while value >= tolerance:
        value = (value + 1) / 2.0
        print("Current value:", value)
    return value


def main():
    print("Converged value:", value_convergence(100.0, tolerance=0.0001))
