# src/advanced/parameterization/print_sentences.mojo
def print_sentence_twice(sentence: String):
    for _i in range(2):
        print(sentence)


def print_sentence_four_times(sentence: String):
    for _i in range(4):
        print(sentence)


def print_sentence_six_times(sentence: String):
    for _i in range(6):
        print(sentence)


def main():
    var first_sentence = String(input("Please enter the first sentence: "))
    print_sentence_twice(first_sentence)

    var second_sentence = String(input("Please enter the second sentence: "))
    print_sentence_four_times(second_sentence)

    var third_sentence = String(input("Please enter the third sentence: "))
    print_sentence_six_times(third_sentence)
