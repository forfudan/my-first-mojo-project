# src/basic/matching/if_case_ages.py
def main():
    ages = {"Python": 35, "Mojo": 3}

    if (age := ages.get("Mojo")) is not None:
        print("Mojo is", age)
    else:
        print("I don't know Mojo yet.")


main()
