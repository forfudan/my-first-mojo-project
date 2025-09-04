const std = @import("std");

fn fib(n: i32) i64 {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

pub fn main() void {
    var i: i32 = 0;
    while (i < 50) : (i += 1) {
        std.debug.print("{}, ", .{fib(i)});
    }
}