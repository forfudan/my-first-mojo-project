# src/basic/types/incompatible_literal_type_and_annotation.mojo
# This code will not compile
def main():
    var a: Int = 42.5
    print(a)
