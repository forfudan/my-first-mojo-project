def main():
    var lst1 = [i * 2 for i in range(10) if i % 2 == 0]

    var lst2 = List[Int]()
    for i in range(10):
        if i % 2 == 0:
            lst2.append(i * 2)

    print("List Comprehension:")
    for i in lst1:
        print(i, end=", ")
    print("\nFull Syntax:")
    for i in lst2:
        print(i, end=", ")
