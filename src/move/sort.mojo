# src/move/sort.mojo

def bubble_sort(mut array: List[Float64]):
    n = len(array)
    for i in range(n):
        for j in range(0, n - 1 - i):
            if array[j] > array[j + 1]:
                array[j], array[j + 1] = array[j + 1], array[j]

def print_list(array: List[Float64]):
    print("[", end="")
    for i in range(len(array)):
        if i < len(array) - 1:
            print(array[i], end=", ")
        else:
            print(array[i], end="]\n")

def main():
    array = [64.1, 34.523, 25.1, -12.3, 22.0, -11.5, 90.49]
    print("Input array:", end=" ")
    print_list(array)
    bubble_sort(array)
    print("After sorting:", end=" ")
    print_list(array)