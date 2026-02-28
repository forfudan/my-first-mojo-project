# src/basic/packages/point_type/point.mojo
"""
A example module containing a `Point` struct and related structs and functions.
"""

# ===----------------------------------------------------------------------=== #
# Imports
# ===----------------------------------------------------------------------=== #
from memory import UnsafePointer
import math

# ===----------------------------------------------------------------------=== #
# Type or value aliases known at compiled time
# ===----------------------------------------------------------------------=== #
comptime FourByteFloat = SIMD[DType.float64, 1]
"""Alias for a 4-byte float (double precision)."""
comptime PI = 3.14159
"""Alias for the mathematical constant pi (π)."""

# ===----------------------------------------------------------------------=== #
# Functions
# ===----------------------------------------------------------------------=== #


fn print_address(a: Point):
    var ptr = UnsafePointer(to=a)
    print("Memory address of the point:", String(ptr))


fn distance[T: Distanceable](item: T) -> FourByteFloat:
    """Calculates the distance."""
    return item.__distance__()


# ===----------------------------------------------------------------------=== #
# Traits
# ===----------------------------------------------------------------------=== #
trait Distanceable:
    fn __distance__(self) -> Float64:
        ...


# ===----------------------------------------------------------------------=== #
# Structs
# ===----------------------------------------------------------------------=== #
struct Point(Distanceable):
    """A point in 2D space."""

    var x: FourByteFloat
    var y: FourByteFloat

    fn __init__(out self, x: FourByteFloat, y: FourByteFloat):
        self.x = x
        self.y = y

    fn __distance__(self) -> FourByteFloat:
        """Calculates the distance from the origin (0, 0)."""
        return math.sqrt(self.x * self.x + self.y * self.y)

    fn area(self) -> FourByteFloat:
        """Calculates the area of a circle with this point as the radius."""
        return PI * distance(self) * distance(self)
