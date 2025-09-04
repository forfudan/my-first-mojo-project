# src/basic/composite/list_iteration_with_modification.py
def main():
    my_list = [1, 2, 3, 4, 5]

    # Change teh variable i inside the loop
    for i in my_list:
        i = i + 1

    # Print the list
    for i in my_list:
        print(i, end=" ")  # Output: 1 2 3 4 5


main()
