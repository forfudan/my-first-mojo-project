# one_liner_conditional_expression.py
def main():
    a = 10
    b = "sunny"

    judge_sign = "negative" if a < 0 else "non-negative"
    judge_weather = "nice" if b == "sunny" else "not nice"
    print(judge_sign)
    print(judge_weather)

    print("I am apple") if c == "apple" else print("I am not apple")


main()
