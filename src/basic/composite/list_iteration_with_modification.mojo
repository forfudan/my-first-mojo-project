# src/basic/composite/list_iteration_with_modification.mojo
def main():
    var my_list = [1, 2, 3, 4, 5]

    # Change the elements of the list using a for loop
    for ref i in my_list:
        i = i + 1

    # Print the modified list
    for i in my_list:
        print(i, end=" ")
