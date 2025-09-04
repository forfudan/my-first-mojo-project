struct Iter:
    var a: List[Int]

    def __init__(out self, a: List[Int]):
        self.a = a

    def __iter__(self) -> Int:
        return self.a[0]


def main():
    var a = List[Int](1, 2, 3, 4, 5)
    var iter = Iter(a)

    for i in iter:
        print(i, end=" ")  # Output: 1 2 3 4 5
