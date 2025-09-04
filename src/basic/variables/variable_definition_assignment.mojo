# src/basic/variables/variable_definition_assignment.mojo
def main():
    # Define variables first
    var a: Int
    var b: Float64
    var c: String
    var d: List[Int]

    # Assign values to the variable names in separate lines
    a = 1
    b = 2.5
    c = String("Hello, world!")  # c = "Hello, world!" is also valid
    d = [1, 2, 3]
