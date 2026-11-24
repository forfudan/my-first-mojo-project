# src/basic/matching/task_patterns.py
from dataclasses import dataclass


@dataclass
class Task:
    title: str
    urgent: bool = False
    done: bool = False


def describe(task: Task) -> str:
    match task:
        case Task(done=True):
            return f"Done: {task.title}"
        case Task(title="feed the cat"):
            return "Feed the cat. Now."
        case Task(title=title, urgent=True):
            return f"Urgent: {title}"
        case Task(title=title):
            return f"Later: {title}"


def main():
    todo = [
        Task("buy milk"),
        Task("feed the cat"),
        Task("write a chapter", urgent=True),
        Task("pay rent", urgent=True, done=True),
    ]
    for task in todo:
        print(describe(task))


main()
