# src/basic/controls/sum_of_list_of_floats_without_loop.mojo
def main():
    var total = 0.0
    var numbers = [1.1, 2.2, 3.3, 4.4, 5.5]

    total += numbers[0]
    total += numbers[1]
    total += numbers[2]
    total += numbers[3]
    total += numbers[4]
    print("The sum of all items = ", total)
