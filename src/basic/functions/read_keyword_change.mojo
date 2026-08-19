# src/basic/functions/read_keyword_change.mojo
# This code will not compile
def changeit(imm some: List[Int]) -> List[Int]:
    some[0] = 100


def main():
    var a: List[Int] = [1, 2, 3, 4, 5]
    changeit(a)