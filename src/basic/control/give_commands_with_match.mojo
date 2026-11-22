# src/basic/control/give_commands_with_match.mojo
def main() raises:
    while True:
        var input = input(
            "Please enter one of the following commands:\n(1) hi\n(2) who\n(3)"
            " when\nIf you want to quit the program, enter 'bye' or"
            " 'farewell'\nWaiting for your order: "
        )
        print()
        match input:
            case "hi":
                print("Hello, master!")
            case "who":
                print("I am Mojo, your loyal assistant!")
            case "when":
                print("I was born in the 2020s, and I am still growing!")
            case "bye" | "farewell":
                print("Goodbye!")
                break
            case _:
                print("I don't understand your command. Please try again.")

        print()
