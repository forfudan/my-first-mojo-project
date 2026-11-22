import Foundation

func fib(_ n: Int64) -> Int64 {
    if n <= 1 {
        return n
    }
    return fib(n - 1) + fib(n - 2)
}

func main() {
    let start = Date()
    for i in 0..<40 {
        print("\(fib(Int64(i))), ", terminator: "")
    }
    print("\nTime: \(-start.timeIntervalSinceNow) seconds")
}

main()
