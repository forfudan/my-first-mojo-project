# src/basic/control/repeat_until_with_while.mojo
def main():
    var prev = 0
    var curr = 1
    var threshold = 1_000_000_000

    while True:
        prev, curr = curr, prev + curr
        if curr > threshold:
            break

    print("First Fibonacci number > ", threshold, ": ", curr, sep="")
