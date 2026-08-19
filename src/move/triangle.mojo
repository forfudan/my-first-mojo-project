# src/move/triangle.mojo


struct Triangle(Writable):
    """A struct to represent a triangle."""

    # Declare attributes
    var a: Float64
    var b: Float64
    var c: Float64

    def __init__(out self, a: Float64, b: Float64, c: Float64) raises:
        """Initializes a triangle with three sides.

        Args:
            a: Length of side a.
            b: Length of side b.
            c: Length of side c.

        Raises:
            Error: If the lengths do not form a valid triangle.
        """
        self.a = a
        self.b = b
        self.c = c

        if (
            (self.a + self.b <= self.c)
            or (self.a + self.c <= self.b)
            or (self.b + self.c <= self.a)
        ):
            raise Error("The lengths of sides do not form a valid triangle.")

    def area(self) -> Float64:
        """Calculates the area of the triangle using Heron's formula.

        Returns:
            Float64: The area of the triangle.
        """
        var s = (self.a + self.b + self.c) / 2
        return (s * (s - self.a) * (s - self.b) * (s - self.c)) ** 0.5

    def perimeter(self) -> Float64:
        """Calculates the perimeter of the triangle.

        Returns:
            Float64: The perimeter of the triangle.
        """
        return self.a + self.b + self.c

    def __str__(self) raises -> String:
        """Returns a string representation of the triangle.

        Returns:
            A string representation of the triangle.

        Notes:
            You can use the `str()` or `print()` to call this method.
        """
        return "Triangle(a={}, b={}, c={})".format(self.a, self.b, self.c)


def main() raises:
    # A valid triangle with sides 3, 4, and 5
    print("Creating a valid triangle with sides 3, 4, and 5:")
    var triangle = Triangle(3, 4, 5)
    print(String(triangle))
    print("Area: {}".format(triangle.area()))
    print("Perimeter: {}".format(triangle.perimeter()))

    # An invalid triangle with sides 1, 2, and 3
    print("\nCreating an invalid triangle with sides 1, 2, and 3:")
    var invalid_triangle: Triangle
    try:
        invalid_triangle = Triangle(1, 2, 3)
        print(String(invalid_triangle))
    except e:
        print("Error:", e)
