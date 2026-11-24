# src/basic/matching/respond_with_lists.py
def respond(command: str) -> str:
    match command.split():
        case []:
            return "Say something, master."
        case ["hi" | "hello" as greeting]:
            return f"Hello, master! (You said '{greeting}'.)"
        case ["greet", name]:
            return f"Nice to meet you, {name}!"
        case ["add", a, b]:
            return f"{a} + {b} = {int(a) + int(b)}"
        case _:
            return "I don't understand your command."


def main():
    print(respond(""))
    print(respond("hello"))
    print(respond("greet Yuhao"))
    print(respond("add 3 4"))
    print(respond("add 1 2 3"))


main()
