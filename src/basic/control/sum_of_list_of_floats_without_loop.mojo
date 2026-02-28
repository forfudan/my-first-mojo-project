# src/basic/controls/sum_of_list_of_floats_without_loop.mojo
def main():
    var total = 0.0
    var numbers = [1.1, 2.2, 3.3, 4.4, 5.5]

    ref number = numbers[0]
    total += number
    number = numbers[1]
    total += number
    number = numbers[2]
    total += number
    number = numbers[3]
    total += number
    number = numbers[4]
    total += number
    print("The sum of all items = ", total)
