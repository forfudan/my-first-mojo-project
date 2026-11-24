# src/basic/matching/optional_value_on_empty.mojo
# This code aborts at runtime
def main():
    var b: Optional[Int] = None
    print(b.value())
