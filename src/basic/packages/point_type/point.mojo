# src/basic/packages/point_type/point.mojo
"""
A example module containing a `Point` struct and related structs and functions.
"""

# ===----------------------------------------------------------------------=== #
# Imports
# ===----------------------------------------------------------------------=== #
from std.memory import Pointer
import std.math

# ===----------------------------------------------------------------------=== #
# Type or value aliases known at compiled time
# ===----------------------------------------------------------------------=== #
comptime EightByteFloat = SIMD[DType.float64, 1]
"""Alias for a 8-byte float (double precision)."""
comptime PI = 3.14159
"""Alias for the mathematical constant pi (π)."""

# ===----------------------------------------------------------------------=== #
# Functions
# ===----------------------------------------------------------------------=== #


def print_address(a: Point):
    var ptr = Pointer(to=a)
    print("Memory address of the point:", String(ptr))


def distance[T: Distanceable](item: T) -> EightByteFloat:
    """Calculates the distance."""
    return item.__distance__()


# ===----------------------------------------------------------------------=== #
# Traits
# ===----------------------------------------------------------------------=== #
trait Distanceable:
    def __distance__(self) -> Float64:
        ...


# ===----------------------------------------------------------------------=== #
# Structs
# ===----------------------------------------------------------------------=== #
struct Point(Distanceable):
    """A point in 2D space."""

    var x: EightByteFloat
    var y: EightByteFloat

    def __init__(out self, x: EightByteFloat, y: EightByteFloat):
        self.x = x
        self.y = y

    def __distance__(self) -> EightByteFloat:
        """Calculates the distance from the origin (0, 0)."""
        return std.math.sqrt(self.x * self.x + self.y * self.y)

    def area(self) -> EightByteFloat:
        """Calculates the area of a circle with this point as the radius."""
        return PI * distance(self) * distance(self)
