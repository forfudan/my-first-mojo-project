# src/basic/matching/while_case_todo.mojo
struct Task(Copyable, Writable):
    var title: String
    var urgent: Bool
    var done: Bool

    def __init__(out self, title: String, urgent: Bool = False, done: Bool = False):
        self.title = title
        self.urgent = urgent
        self.done = done


def main():
    var todo: List[Task] = [
        Task("buy milk"),
        Task("feed the cat"),
        Task("write a chapter"),
    ]

    while case [*_, last] = todo:
        print("Doing:", last.title)
        _ = todo.pop()
    print("Nothing left to do.")
