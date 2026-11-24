# src/basic/matching/optional_ages.py
def how_old(name: str, ages: dict[str, int]) -> str:
    match ages.get(name):
        case None:
            return f"I don't know {name} yet."
        case age if age < 18:
            return f"{name} is {age}. Too young for coffee."
        case age:
            return f"{name} is {age}."


def main():
    ages = {"Python": 35, "Mojo": 3}
    print(how_old("Python", ages))
    print(how_old("Mojo", ages))
    print(how_old("Rust", ages))


main()
