# src/basic/composite/list_comprehension_permutations.mojo
def main():
    var lst1 = ["a", "b", "c"]
    var lst2 = ["i", "j", "k"]
    var lst3 = ["x", "y", "z"]

    var lst4 = [i + j + k for i in lst1 for j in lst2 for k in lst3]

    for item in lst4:
        print(item, end=", ")
