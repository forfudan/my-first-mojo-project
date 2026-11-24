# src/basic/matching/while_case_todo.py
from dataclasses import dataclass


@dataclass
class Task:
    title: str
    urgent: bool = False
    done: bool = False


def main():
    todo = [
        Task("buy milk"),
        Task("feed the cat"),
        Task("write a chapter"),
    ]

    while todo:
        last = todo[-1]
        print("Doing:", last.title)
        todo.pop()
    print("Nothing left to do.")


main()
