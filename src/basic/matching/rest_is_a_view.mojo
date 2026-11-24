# src/basic/matching/rest_is_a_view.mojo
def main():
    var numbers: List[Int] = [1, 2, 3]
    match numbers:
        case [_, *rest]:
            rest[0] = 100
        case _:
            pass
    print(numbers)
