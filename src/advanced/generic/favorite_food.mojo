# src/advanced/generic/favorite_food.mojo
struct Cat:
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Meow! I love {}.").format(self.food)


struct Bird:
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Bugubugu! I love {}.").format(self.food)


struct Human:
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def get_name(self) -> String:
        return self.name

    def speech(self) -> String:
        return String("Hi! I love {}.").format(self.food)


def cat_says_what(animal: Cat):
    print(animal.get_name(), "says:", animal.speech())


def bird_says_what(animal: Bird):
    print(animal.get_name(), "says:", animal.speech())


def human_says_what(animal: Human):
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

    cat_says_what(saku)
    bird_says_what(bili)
    human_says_what(yuhao)
