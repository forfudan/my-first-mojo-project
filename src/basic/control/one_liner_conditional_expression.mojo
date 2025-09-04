# one_liner_conditional_expression.mojo
def main():
    var a = 10
    var b = "sunny"
    var c = "apple"

    var judge_sign = "negative" if a < 0 else "non-negative"
    var judge_weather = "nice" if b == "sunny" else "not nice"
    print(judge_sign)
    print(judge_weather)

    print("I am apple") if c == "apple" else print("I am not apple")
