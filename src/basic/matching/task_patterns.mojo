# src/basic/matching/task_patterns.mojo
struct Task(Copyable, Writable):
    var title: String
    var urgent: Bool
    var done: Bool

    def __init__(out self, title: String, urgent: Bool = False, done: Bool = False):
        self.title = title
        self.urgent = urgent
        self.done = done


def describe(task: Task) -> String:
    match task:
        case Task(done=True):
            return String("Done: ", task.title)
        case Task(title="feed the cat"):
            return "Feed the cat. Now."
        case Task(title=title, urgent=True):
            return String("Urgent: ", title)
        case Task(title=title):
            return String("Later: ", title)


def main():
    var todo: List[Task] = [
        Task("buy milk"),
        Task("feed the cat"),
        Task("write a chapter", urgent=True),
        Task("pay rent", urgent=True, done=True),
    ]
    for task in todo:
        print(describe(task))
