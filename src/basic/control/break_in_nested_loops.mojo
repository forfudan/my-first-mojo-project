# src/basic/controls/break_and_else_statement_in_for_loop.mojo
def main():
    var my_list = [1, 2, 3, 4, 5]
    for i in my_list:
        if i == 5:
            break
        for j in my_list:
            if j == 3:
                break
            print("i =", i, "j =", j)
        else:
            print("Inner loop completed without break!")
    else:
        print("Outer loop completed without break!")
