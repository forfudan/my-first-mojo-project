# src/basic/control/match_commands.py
def respond(command: str) -> str:
    match command:
        case "hi":
            return "Hello, master!"
        case "who":
            return "I am Mojo, your loyal assistant!"
        case "when":
            return "I was born in the 2020s, and I am still growing!"
        case "bye" | "farewell":
            return "Goodbye!"
        case _:
            return "I don't understand your command."


def main():
    print(respond("hi"))
    print(respond("when"))
    print(respond("farewell"))
    print(respond("dance"))


main()
