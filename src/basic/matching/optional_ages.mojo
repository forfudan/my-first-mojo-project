# src/basic/matching/optional_ages.mojo
def how_old(name: String, ages: Dict[String, Int]) -> String:
    match ages.get(name):
        case .Some(age) if age < 18:
            return String(name, " is ", age, ". Too young for coffee.")
        case .Some(age):
            return String(name, " is ", age, ".")
        case .None:
            return String("I don't know ", name, " yet.")


def main():
    var ages: Dict[String, Int] = {"Python": 35, "Mojo": 3}
    print(how_old("Python", ages))
    print(how_old("Mojo", ages))
    print(how_old("Rust", ages))
