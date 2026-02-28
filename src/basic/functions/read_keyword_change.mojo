# src/basic/functions/read_keyword_change.mojo
# This code will not compile
fn changeit(read some: List[Int]) -> List[Int]:
    some[0] = 100


fn main():
    var a = [1, 2, 3, 4, 5]  # Auto inferred as List[Int]
    changeit(a)