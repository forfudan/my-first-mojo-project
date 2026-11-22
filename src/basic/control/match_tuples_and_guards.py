# src/basic/control/match_tuples_and_guards.py
def where_is(px: int, py: int) -> str:
    match (px, py):
        case (0, 0):
            return "at the origin"
        case (0, y):
            return f"on the y-axis at y={y}"
        case (x, 0):
            return f"on the x-axis at x={x}"
        case (x, y) if x == y:
            return "on the diagonal"
        case _:
            return "somewhere else"


def main():
    print(where_is(0, 0))
    print(where_is(0, 5))
    print(where_is(3, 0))
    print(where_is(2, 2))
    print(where_is(1, 7))


main()
