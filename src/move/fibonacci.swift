func fib(_ n: Int64) -> Int64 {
    if n <= 1 {
        return n
    }
    return fib(n - 1) + fib(n - 2)
}

func main() {
    for i in 0..<50 {
        print("\(fib(Int64(i))), ", terminator: "")
    }
}

main()