# src/basic/structs/complex_number.py
class Complex:
    """Complex number with real and imaginary parts."""

    # Define fields (attributes)
    # These are not mandatory in Python, but good for documentation.
    real: float  # Real part of the complex number
    imag: float  # Imaginary part of the complex number

    def __init__(self, real: float = 0.0, imag: float = 0.0):
        """Initializes a complex number with real and imaginary parts."""
        self.real = real
        self.imag = imag

    def __str__(self) -> str:
        """Returns a string representation of the complex number."""
        if self.imag < 0:
            return f"{self.real}{self.imag}i"
        else:
            return f"{self.real}+{self.imag}i"

    def __add__(self, other: "Complex") -> "Complex":
        """Adds two complex numbers."""
        return Complex(self.real + other.real, self.imag + other.imag)

    def __sub__(self, other: "Complex") -> "Complex":
        """Subtracts two complex numbers."""
        return Complex(self.real - other.real, self.imag - other.imag)

    def __mul__(self, other: "Complex") -> "Complex":
        """Multiplies two complex numbers."""
        return Complex(
            self.real * other.real - self.imag * other.imag,
            self.real * other.imag + self.imag * other.real,
        )

    def __truediv__(self, other: "Complex") -> "Complex":
        """Divides two complex numbers."""
        denominator: float = other.real * other.real + other.imag * other.imag
        if denominator == 0:
            raise ZeroDivisionError("Cannot divide by zero in complex division.")
        return Complex(
            (self.real * other.real + self.imag * other.imag) / denominator,
            (self.imag * other.real - self.real * other.imag) / denominator,
        )


def main():
    c1 = Complex(3.0, 4.0)
    c2 = Complex(1.0, -2.0)
    c3 = Complex()

    print("Complex Number 1:", c1)
    print("Complex Number 2:", c2)
    print("Complex Number 3:", c3)

    print("c1 + c2 =", c1 + c2)
    print("c1 - c2 =", c1 - c2)
    print("c1 * c2 =", c1 * c2)
    print("c1 / c2 =", c1 / c2)

    print("c1 + c3 =", c1 + c3)
    print("c1 - c3 =", c1 - c3)
    print("c1 * c3 =", c1 * c3)
    print("c1 / c3 =:", c1 / c3)


main()
