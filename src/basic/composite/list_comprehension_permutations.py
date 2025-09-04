# src/basic/composite/list_comprehension_permutations.py
def main():
    lst1 = ["a", "b", "c"]
    lst2 = ["i", "j", "k"]
    lst3 = ["x", "y", "z"]

    lst4 = [i + j + k for i in lst1 for j in lst2 for k in lst3]

    for item in lst4:
        print(item, end=", ")


main()
