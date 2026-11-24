# src/basic/matching/list_unpacking.py
def main():
    scores = [7, 9, 8, 10, 6]
    [first, *middle, last] = scores
    print("first:", first)
    print("middle:", middle)
    print("last:", last)


main()
