# src/basic/matching/names_read_only.mojo
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
    var todo: List[Task] = [Task("buy milk")]

    match todo[0]:
        case Task(done=done):
            done = True
