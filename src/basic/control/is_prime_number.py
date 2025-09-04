# %%
# src/basic/controls/is_prime_number.py
import time


def main():
    start: int = 10**18
    sqrt_of_start: int = 10**9
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


t0 = time.time()
main()
print("Execution time:", time.time() - t0, "seconds")

# %%
