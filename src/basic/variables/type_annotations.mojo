# src/basic/variables/type_annotations.mojo
fn main():
    var a: Float64 = 120.0  # Use type annotations for literals
    var b: Int = 24  # Use type annotations for literals
    var c = String("Hello, world!")  # Use explicit constructors
    var d = Int128(100) ** Int128(2)  # Use explicit constructors

    print(a, b, c, d)
