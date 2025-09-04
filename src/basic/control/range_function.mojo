# src/basic/controls/range_function.mojo
def main():
    for i in range(5):
        print(i, "*", i, "=", i * i)

    for _ in range(3):
        print("Important message shall be repeated three times.")
