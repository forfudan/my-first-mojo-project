const std = @import("std");

fn fib(n: i64) i64 {
    if (n <= 1) {
        return n;
    }
    return fib(n - 1) + fib(n - 2);
}

pub fn main() !void {
    var timer = try std.time.Timer.start();
    var i: i64 = 0;
    while (i < 40) : (i += 1) {
        std.debug.print("{d}, ", .{fib(i)});
    }
    const seconds = @as(f64, @floatFromInt(timer.read())) / 1e9;
    std.debug.print("\nTime: {d} seconds\n", .{seconds});
}
