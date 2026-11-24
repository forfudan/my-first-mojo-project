# src/basic/matching/respond_with_rest.mojo
def respond(command: String) raises -> String:
    match command.split():
        case ["add", *numbers]:
            var total = 0
            for number in numbers:
                total += Int(number)
            return String("The sum is ", total, ".")
        case _:
            return "I don't understand your command."


def main() raises:
    print(respond("add 1 2 3 4"))
    print(respond("add 42"))
    print(respond("add"))
