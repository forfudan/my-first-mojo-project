fn fib (n: i64) -> i64 {
    if n <= 1 {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

fn main() {
    for i in 0..50 {
        print!("{}, ", fib(i));
    }
}