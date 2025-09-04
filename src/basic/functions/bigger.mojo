# src/basic/functions/bigger.mojo
fn bigger(a: Int) -> Int:
    return a


fn bigger(a: Int, b: Int) -> Int:
    return a if a > b else b


fn main():
    print(bigger(1, 2))
    print(bigger(3))
