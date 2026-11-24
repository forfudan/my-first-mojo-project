# src/basic/matching/list_match_without_default.mojo
# This code will not compile
def size(items: List[Int]) -> String:
    match items:
        case []:
            return "empty"
        case [_, *_]:
            return "not empty"


def main():
    print(size([1, 2, 3]))
