from decimo import BigInt


def main():
    var a = Int(1234567890123456789)
    var b = Int(12)
    print(a, "*", b, "=", BigInt(a) * BigInt(b))
    print(a, "**", b, "=", BigInt(a) ** BigInt(b))
