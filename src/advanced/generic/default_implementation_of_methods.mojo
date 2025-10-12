# src/advanced/generic/default_implementation_of_methods.mojo
trait Talkative:
    def greet(self) -> None:
        print("Hello!")


struct Cat(Talkative):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food


struct Bird(Talkative):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def greet(self) -> None:
        print("Hello! Bugu, bugu, bugu, bugu, bugu!")


struct Human(Talkative):
    var name: String
    var food: String

    def __init__(out self, name: String, food: String):
        self.name = name
        self.food = food

    def greet(self) -> None:
        print(
            "Hello! I am {}, I am a talkative person. I can say more than just"
            " hello and I love talking about food and weather. My favorite food"
            " is {}, a pan-fried baozi which is popular in Shanghai and Suzhou."
            .format(self.name, self.food)
        )


def main():
    saku = Cat("Saku", "chicken")
    bili = Bird("Bili", "worms")
    yuhao = Human(
        "Yuhao",
        "生煎包 (sanci moedeu)",
    )

    saku.greet()
    bili.greet()
    yuhao.greet()
