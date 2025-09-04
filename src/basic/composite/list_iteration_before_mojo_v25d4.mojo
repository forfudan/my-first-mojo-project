# src/basic/composite/list_iteration_before_mojo_v25d4.mojo
# This code is valid until Mojo v25.3
# It will not compile in Mojo v25.4 and later versions.
def main():
    my_list = List[Int](1, 2, 3, 4, 5)
    for i in my_list:
        print(i[], end=" ")  # De-referencing the element to get its value
