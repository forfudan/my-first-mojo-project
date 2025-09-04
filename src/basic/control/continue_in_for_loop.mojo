# src/basic/controls/continue_in_for_loop.mojo
def main():
    var my_list = [1, 2, 3, 4, 5]
    for i in my_list:
        if (i == 2) or (i == 4):  # Skip even numbers
            continue
        print(i, "*", i, "=", i * i)
    else:
        print("Loop completed successfully without early exit!")
