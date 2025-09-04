# src/basic/variables/use_variables_of_sub_scopes.mojo
# This code will not compile
def main():
    if True:
        var a: Int = 1
        print(a)
    print(a)  # This will cause an error
