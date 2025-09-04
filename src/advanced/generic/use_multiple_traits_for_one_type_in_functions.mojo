# src/advanced/generic/use_multiple_traits_for_one_type_in_functions.mojo
trait Animal:
    def get_name(self) -> String:
        ...

    def speech(self) -> String:
        ...


trait Measurable:
    def length(self) -> Int:
        ...


struct Cat(Animal, Measurable):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Meow! I love {}.").format(self.food)

    def length(self) -> Int:
        return len(self.name)


struct Bird(Animal, Measurable):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Bugubugu! I love {}.").format(self.food)

    def length(self) -> Int:
        return len(self.food)


struct Human(Animal, Measurable):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Hi! I love {}.").format(self.food)

    def length(self) -> Int:
        return len(self.name) + len(self.food)


def who_says_what[T: Animal & Measurable](animal: T):
    print(animal.get_name(), "says:", animal.speech())
    print("The mysterious number of me is: ", animal.length())


def main():
    saku = Cat("Saku", "chicken")
    bili = Bird("Bili", "worms")
    yuhao = Human(
        "Yuhao",
        (
            "生煎包 (sanci moedeu), a pan-fried baozi which is popular in Shanghai"
            " and Suzhou"
        ),
    )

    who_says_what(saku)
    who_says_what(bili)
    who_says_what(yuhao)
