# src/basic/packages/test_point_type_package.mojo
import point_type
from point_type import point
from point_type.point import Point


fn main() raises:
    var x: Float64 = 3.0
    var y: Float64 = 4.0

    # Create a point using the imported point module
    var p = point.Point(x, y)
    var q = Point(12, 13)
    var r = point_type.point.Point(1, 2)

    point.print_address(p)
    point.print_address(q)
    point.print_address(r)

    print("Distance between the point and the origin:", point.distance(p))
    print("Distance between the point and the origin:", point.distance(q))
    print("Distance between the point and the origin:", point.distance(r))

    print(
        "Area of the circle with radius equal to the distance from the origin:",
        p.area(),
    )
    print(
        "Area of the circle with radius equal to the distance from the origin:",
        q.area(),
    )
    print(
        "Area of the circle with radius equal to the distance from the origin:",
        r.area(),
    )
