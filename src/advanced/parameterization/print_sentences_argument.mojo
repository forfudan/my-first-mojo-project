# src/advanced/parameterization/print_sentences_argument.mojo
def print_sentence(sentence: String, times: Int):
    for _i in range(times):
        print(sentence)


def main() raises:
    var first_sentence = String(input("Please enter the first sentence: "))
    print_sentence(first_sentence, times=2)

    var second_sentence = String(input("Please enter the second sentence: "))
    print_sentence(second_sentence, times=4)

    var third_sentence = String(input("Please enter the third sentence: "))
    print_sentence(third_sentence, times=6)
