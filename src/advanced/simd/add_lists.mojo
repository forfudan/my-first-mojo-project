# src/advanced/simd/add_lists.mojo
def add_lists(a: List[Float64], b: List[Float64]) -> List[Float64]:
    result = List[Float64]()
    for i in range(len(a)):
        result.append(a[i] + b[i])
    return result^


def main():
    a: List[Float64] = [1.0, 2.0, 3.0, 4.0]
    b: List[Float64] = [5.0, 6.0, 7.0, 8.0]
    result = add_lists(a, b)
    for i in result:
        print(i, end=", ")


# Output: 6.0, 8.0, 10.0, 12.0,
