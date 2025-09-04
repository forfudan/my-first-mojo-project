# src/advanced/parameterization/print_sentences_parameter.mojo
def print_sentence[times: Int](sentence: String):
    for _i in range(times):
        print(sentence)


def main():
    var first_sentence = String(input("Please enter the first sentence: "))
    print_sentence[times=2](first_sentence)

    var second_sentence = String(input("Please enter the second sentence: "))
    print_sentence[times=4](second_sentence)

    var third_sentence = String(input("Please enter the third sentence: "))
    print_sentence[times=6](third_sentence)
