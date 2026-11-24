# src/basic/matching/respond_with_lists.mojo
def respond(command: String) raises -> String:
    match command.split():
        case []:
            return "Say something, master."
        case ["hi" | "hello" as greeting]:
            return String("Hello, master! (You said '", greeting, "'.)")
        case ["greet", name]:
            return String("Nice to meet you, ", name, "!")
        case ["add", a, b]:
            return String(a, " + ", b, " = ", Int(a) + Int(b))
        case _:
            return "I don't understand your command."


def main() raises:
    print(respond(""))
    print(respond("hello"))
    print(respond("greet Yuhao"))
    print(respond("add 3 4"))
    print(respond("add 1 2 3"))
