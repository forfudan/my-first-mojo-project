# src/advanced/ownership/copy_move_inconsistency_use_again.mojo
struct Team(ImplicitlyCopyable):
    var names: List[String]

    def __init__(out self, var *names: String):
        # Copy the incoming names into the List
        self.names = List[String](elements=names^)

    def __copyinit__(out self, other: Self):
        self.names = other.names.copy()

    def __moveinit__(out self, deinit other: Self):
        self.names = other.names^
        # When move, add another person
        self.names.append("Yuhao")


def main():
    var a = Team("Akari", "Bob", "Coco", "David")
    var b = a

    print("New team `b` contains the following people: ")
    for i in b.names:
        print(i, end=", ")

    print("\nOld team `a` contains the following people: ")
    for i in a.names:
        print(i, end=", ")