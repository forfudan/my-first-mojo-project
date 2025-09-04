package main

import "fmt"

func fib(n int64) int64 {
    if n <= 1 {
        return n
    }
    return fib(n-1) + fib(n-2)
}

func main() {
    for i := int64(0); i < 50; i++ {
        fmt.Printf("%d, ", fib(i))
    }
}