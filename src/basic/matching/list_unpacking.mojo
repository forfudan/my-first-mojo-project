# src/basic/matching/list_unpacking.mojo
def main() raises:
    var scores: List[Int] = [7, 9, 8, 10, 6]
    var [first, *middle, last] = scores
    print("first:", first)
    print("middle:", middle)
    print("last:", last)
