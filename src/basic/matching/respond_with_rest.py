# src/basic/matching/respond_with_rest.py
def respond(command: str) -> str:
    match command.split():
        case ["add", *numbers]:
            total = 0
            for number in numbers:
                total += int(number)
            return f"The sum is {total}."
        case _:
            return "I don't understand your command."


def main():
    print(respond("add 1 2 3 4"))
    print(respond("add 42"))
    print(respond("add"))


main()
