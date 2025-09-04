fn main():
    var s = String("你好shìjiè😀🇨🇳")
    var idx = 0
    print("Index | Binary       | Decimal | Hexadecimal")
    for i in s.as_bytes():
        var byte_dec = Int(i)
        var byte_bin = bin(byte_dec)
        var byte_hex = hex(byte_dec)
        print(idx, "    | ", byte_bin, " | ", byte_dec, "   | ", byte_hex)
        idx += 1
