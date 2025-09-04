# src/advanced/generic/favorite_food_with_trait.mojo
trait Animal:
    def get_name(self) -> String:
        ...

    def speech(self) -> String:
        ...


struct Cat(Animal):  # Explicitly specify that Cat implements the Animal trait
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Meow! I love {}.").format(self.food)


struct Bird(Animal):  # Explicitly specify that Bird implements the Animal trait
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Bugubugu! I love {}.").format(self.food)


struct Human(
    Animal
):  # Explicitly specify that Human implements the Animal trait
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Hi! I love {}.").format(self.food)


def who_says_what[CertainType: Animal](animal: CertainType):
    print(animal.get_name(), "says:", animal.speech())


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
