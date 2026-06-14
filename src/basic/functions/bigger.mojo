# src/basic/functions/bigger.mojo
def bigger(a: Int) -> Int:
    return a


def bigger(a: Int, b: Int) -> Int:
    return a if a > b else b


def main():
    print(bigger(1, 2))
    print(bigger(3))
