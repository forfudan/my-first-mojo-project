# src/basic/matching/while_case_todo_pop_first.mojo
# This code will not compile
struct Task(Copyable, Writable):
    var title: String
    var urgent: Bool
    var done: Bool

    def __init__(out self, title: String, urgent: Bool = False, done: Bool = False):
        self.title = title
        self.urgent = urgent
        self.done = done


def main():
    var todo: List[Task] = [Task("buy milk"), Task("feed the cat")]

    while case [*_, last] = todo:
        _ = todo.pop()
        print("Doing:", last.title)
