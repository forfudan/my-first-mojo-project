# src/basic/controls/is_prime_number.mojo
def main():
    var start: Int = 10**18
    var sqrt_of_start: Int = 10**9
    for number in range(start, start + 100 + 1):
        for divisor in range(2, sqrt_of_start + 1):
            if number % divisor == 0:
                print(
                    number,
                    "is not a prime number with smallest divisor",
                    divisor,
                )
                break
        else:
            print(number, "is a prime number")


# import benchmark


# def is_prime_number():
#     var start: Int = 10**18
#     var sqrt_of_start: Int = 10**9
#     for number in range(start, start + 100):
#         for divisor in range(2, sqrt_of_start + 1):
#             if number % divisor == 0:
#                 print(
#                     number,
#                     "is not a prime number with smallest divisor",
#                     divisor,
#                 )
#                 break
#         else:
#             print(number, "is a prime number")


# fn main() raises:
#     var report = benchmark.run[is_prime_number]()
#     report.print_full()
