# src/basic/matching/list_unpacking_wrong_length.mojo
# This code raises an error at runtime
def main() raises:
    var scores: List[Int] = [7, 9, 8, 10, 6]
    var [first, second] = scores
    print(first, second)
