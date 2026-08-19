# src/basic/string/string_indexing_and_slicing.mojo
def main():
    var s = "你好shìjiè😀🇨🇳"

    print("s[byte=0:6]      =", s[byte=0:6])
    print("s[codepoint=0]   =", s[codepoint=0])
    print("s[codepoint=2:8] =", s[codepoint=2:8])
    print("s[grapheme=8]    =", s[grapheme=8])
    print("s[grapheme=9]    =", s[grapheme=9])
