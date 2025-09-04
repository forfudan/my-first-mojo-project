# src/basic/errors/propagate_errors.mojo
fn divide(x: Float64, y: Float64) raises -> Float64:
    if y == 0:
        raise Error("Error in `divide()`: Cannot divide by zero")
    else:
        return x // y


fn area_when_radius_is_ratio(a: Float64, b: Float64) raises -> Float64:
    var pi: Float64 = 3.14159
    var radius: Float64

    try:
        radius = divide(a, b)
    except e:
        var new_error = Error(
            "\nError in `area_when_radius_is_ratio()`: The radius is not a"
            " valid ratio\nTraced back: "
            + String(e)
        )
        raise new_error

    return radius**2 * pi


fn main() raises:
    print(
        "This program calculates the area of a circle when the radius equals"
        " a / b"
    )
    var a = Float64(input("Enter the value for a: "))
    var b = Float64(input("Enter the value for b: "))
    print("The area =", area_when_radius_is_ratio(a, b))
