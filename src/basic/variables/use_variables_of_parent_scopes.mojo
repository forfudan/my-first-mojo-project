# src/basic/variables/use_variables_of_parent_scopes.mojo
def main():
    var a: Int = 1  # Declare a variable in the parent scope
    print(a)  # Access the variable `a` in the parent scope is valid
    for _i in range(5):  # for loop as a child scope
        print(a)  # Access the variable `a` in the child scope is valid
