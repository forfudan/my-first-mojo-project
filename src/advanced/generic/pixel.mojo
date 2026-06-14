# src/advanced/generic/pixel.mojo


struct Pixel(Writable):
    var x: Int
    var y: Int

    def __init__(out self, x: Int, y: Int):
        self.x = x
        self.y = y

    def write_to[T: Writer](self, mut writer: T):
        writer.write("Pixel(", self.x, ", ", self.y, ")")

    def __add__(self, other: Pixel) -> Pixel:
        return Pixel(self.x**2 + other.x**2, self.y**2 + other.y**2)


def main():
    var point1 = Pixel(212, 149)
    var point2 = Pixel(-12, 391)
    print(String(point1))
    print(String(point2))

    var point3 = point1 + point2  # point1.__add__(point2)
    print(String(point3))
