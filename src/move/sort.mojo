# src/move/sort.mojo

def bubble_sort(mut array: List[Float64]):
    var n = len(array)
    for i in range(n):
        for j in range(0, n - 1 - i):
            if array[j] > array[j + 1]:
                array[j], array[j + 1] = array[j + 1], array[j]


def main():
    var array: List[Float64] = [64.1, 34.523, 25.1, -12.3, 22.0, -11.5, 90.49]
    print("Input array:", array)
    bubble_sort(array)
    print("After sorting:", array)
