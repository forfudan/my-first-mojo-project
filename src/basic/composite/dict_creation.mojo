def main():
    var d = {1: 1, 2: 2, 3: 3}
    var l = [k + k for k in d.keys()]
    for i in l:
        print(i)
