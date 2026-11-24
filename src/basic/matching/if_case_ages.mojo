# src/basic/matching/if_case_ages.mojo
def main():
    var ages: Dict[String, Int] = {"Python": 35, "Mojo": 3}

    if case .Some(age) = ages.get("Mojo"):
        print("Mojo is", age)
    else:
        print("I don't know Mojo yet.")
