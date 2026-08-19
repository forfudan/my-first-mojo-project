# src/advanced/generic/favorite_food_with_multiple_traits.mojo
trait Animal:
    def get_name(self) -> String:
        ...

    def speech(self) raises -> String:
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

    def speech(self) raises -> String:
        return String("Meow! I love {}.").format(self.food)

    def length(self) -> Int:
        return self.name.byte_length()


struct Bird(Animal, Measurable):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) raises -> String:
        return String("Bugubugu! I love {}.").format(self.food)

    def length(self) -> Int:
        return self.food.byte_length()


struct Human(Animal, Measurable):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) raises -> String:
        return String("Hi! I love {}.").format(self.food)

    def length(self) -> Int:
        return self.name.byte_length() + self.food.byte_length()


def who_says_what[T: Animal](animal: T) raises:
    print(animal.get_name(), "says:", animal.speech())


def mysterious_number[U: Measurable](animal: U):
    print("The mysterious number of me is:", animal.length())


def main() raises:
    var saku = Cat("Saku", "chicken")
    var bili = Bird("Bili", "worms")
    var yuhao = Human(
        "Yuhao",
        (
            "生煎包 (sanci moedeu), a pan-fried baozi which is popular in Shanghai"
            " and Suzhou"
        ),
    )

    who_says_what(saku)
    mysterious_number(saku)
    who_says_what(bili)
    mysterious_number(bili)
    who_says_what(yuhao)
    mysterious_number(yuhao)
