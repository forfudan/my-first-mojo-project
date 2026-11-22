use std::time::Instant;

fn fib (n: i64) -> i64 {
    if n <= 1 {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

fn main() {
    let start = Instant::now();
    for i in 0..40 {
        print!("{}, ", fib(i));
    }
    println!("\nTime: {} seconds", start.elapsed().as_secs_f64());
}
