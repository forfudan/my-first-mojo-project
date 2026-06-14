# src/advanced/lifetimes/copy_values_of_different_origins.mojo
# This will not compile


def main():
    var a = String("Hello, Python!")
    var b = String("Hello, Mojo!")
    var c = Pointer[type=String, origin = origin_of(a)](to=a)
    var d = Pointer[type=String, origin = origin_of(b)](to=b)
    c = d
