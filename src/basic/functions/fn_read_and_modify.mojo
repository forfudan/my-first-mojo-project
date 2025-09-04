fn change_value_in_fn(x: Int):
    x = 2
    print(x)


def main():
    var a = 1
    change_value_in_fn(a)
    print(a)
