# src/print_odd_numbers_with_for_and_while.mojo


def main():
    # for loop
    print("Odd numbers from 1 to 10 using for loop:")
    for i in range(1, 11):
        if i % 2 == 1:
            print(i, end=" ")

    # while loop
    print("\nOdd numbers from 1 to 10 using while loop:")
    var i = 1
    while i < 10:
        if i % 2 == 1:
            print(i, end=" ")
        i += 1  # Increment i by 1
