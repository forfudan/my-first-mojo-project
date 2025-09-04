# src/basic/control/give_commands_with_while.mojo
def main():
    while True:
        var input = input(
            "Please enter one of the following commands:\n(1) hi\n(2) who\n(3)"
            " when\nIf you want to quit the program, enter 'bye' or"
            " 'farewell'\nWaiting for your order: "
        )
        print()
        if input == "hi":
            print("Hello, master!")
        elif input == "who":
            print("I am Mojo, your loyal assistant!")
        elif input == "when":
            print("I was born in the 2020s, and I am still growing!")
        elif input == "bye" or input == "farewell":
            print("Goodbye!")
            break
        else:
            print("I don't understand your command. Please try again.")

        print()
