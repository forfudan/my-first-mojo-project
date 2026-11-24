# src/basic/matching/names_var_and_ref.mojo
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

    match todo[0]:
        case Task(title=var title):
            title += " and eggs"
            print("Copy:", title)
    print("List:", todo[0].title)

    match todo[1]:
        case Task(done=ref done):
            done = True
    print(todo[1])
