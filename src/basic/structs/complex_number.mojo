# src/basic/structs/complex_number.mojo
struct Complex(Writable):
    """Complex number with real and imaginary parts."""

    var real: Float64
    """Real part of the complex number."""
    var imag: Float64
    """Imaginary part of the complex number."""

    def __init__(out self, real: Float64 = 0.0, imag: Float64 = 0.0):
        """Initializes a complex number with real and imaginary parts.

        Args:
            real: The real part of the complex number (default is 0.0).
            imag: The imaginary part of the complex number (default is 0.0).
        """
        self.real = real
        self.imag = imag

    def write_to[T: Writer](self, mut writer: T):
        """Writes the complex number to a writer."""
        if self.imag < 0:
            writer.write(self.real, self.imag, "i")
        else:
            writer.write(self.real, "+", self.imag, "i")

    def __add__(self, other: Self) -> Self:
        """Adds two complex numbers."""
        return Complex(self.real + other.real, self.imag + other.imag)

    def __sub__(self, other: Self) -> Self:
        """Subtracts two complex numbers."""
        return Complex(self.real - other.real, self.imag - other.imag)

    def __mul__(self, other: Self) -> Self:
        """Multiplies two complex numbers."""
        return Complex(
            self.real * other.real - self.imag * other.imag,
            self.real * other.imag + self.imag * other.real,
        )

    def __truediv__(self, other: Self) raises -> Self:
        """Divides two complex numbers."""
        var denominator: Float64 = (
            other.real * other.real + other.imag * other.imag
        )
        if denominator == 0:
            raise Error("Cannot divide by zero in complex division.")
        return Complex(
            (self.real * other.real + self.imag * other.imag) / denominator,
            (self.imag * other.real - self.real * other.imag) / denominator,
        )


def main() raises:
    var c1 = Complex(3.0, 4.0)
    var c2 = Complex(1.0, -2.0)
    var c3 = Complex()

    print("Complex number c1:", c1)
    print("Complex number c2:", c2)
    print("Complex number c3:", c3)

    print("c1 + c2 =", c1 + c2)
    print("c1 - c2 =", c1 - c2)
    print("c1 * c2 =", c1 * c2)
    print("c1 / c2 =", c1 / c2)

    print("c1 + c3 =", c1 + c3)
    print("c1 - c3 =", c1 - c3)
    print("c1 * c3 =", c1 * c3)
    try:
        print("c1 / c3 =:", c1 / c3)
    except e:
        print("c1 / c3 raised:", e)
