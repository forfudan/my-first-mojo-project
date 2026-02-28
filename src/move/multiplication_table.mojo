# src/move/multiplication_table.mojo
def main():
    print("Nine-nine Multiplication Table")
    for i in range(1, 10):
        for j in range(i, 10):
            print("{} * {} = {}".format(i, j, i*j), end="\t")
        print()
