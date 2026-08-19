# src/basic/control/give_commands.mojo
def main() raises:
    var input = input(
        "Please enter one of the following commands:\n(1) hi\n(2) who\n(3)"
        " when\nWaiting for your order: "
    )
    if input == "hi":
        print("Hello, master!")
    elif input == "who":
        print("I am Mojo, your loyal assistant!")
    elif input == "when":
        print("I was born in the 2020s, and I am still growing!")
    else:
        print("I don't understand your command.")
