# src/basic/control/value_not_converging_but_break_after_some_steps.mojo
fn value_convergence(var value: Float64, tolerance: Float64 = 0.01) -> Float64:
    var counter = 0
    var max_steps = 100
    while value >= tolerance:
        value = (value + 1) / 2.0
        print("Current value:", value)

        if counter >= max_steps:
            print("Breaking after", max_steps, "steps.")
            break
        counter += 1
    return value


fn main():
    print("Converged value:", value_convergence(100.0, tolerance=0.0001))
