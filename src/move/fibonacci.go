package main

import (
    "fmt"
    "time"
)

func fib(n int64) int64 {
    if n <= 1 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

func main() {
    start := time.Now()
    for i := int64(0); i < 40; i++ {
        fmt.Printf("%d, ", fib(i))
    }
    fmt.Printf("\nTime: %v seconds\n", time.Since(start).Seconds())
}
