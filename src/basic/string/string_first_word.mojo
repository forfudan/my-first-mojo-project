# src/basic/string/string_first_word.mojo
def first_word(text: StringSpan) -> StringSpan[text.origin]:
    var idx = text.find(" ")
    if idx == -1:
        return text
    return text[byte=0:idx]

def main():
    var sentence = String("Mojo is a fast language")
    print(first_word(sentence))
    print(first_word("hello world"))
