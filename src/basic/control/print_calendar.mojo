# src/basic/controls/print_calendar.mojo
def print_calendar(year: Int) -> None:
    """Prints the calendar for the given year.

    Args:
        year: The year for which the calendar is printed.

    Note:
        The calendar is valid for years after 1582.
    """

    var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    if year % 4 == 0 and (year % 100 != 0 or year % 400 == 0):
        days_in_month[1] = 29  # February in a leap year
    var day_of_week = (
        (year - 1) + (year - 1) // 4 - (year - 1) // 100 + (year - 1) // 400
    ) % 7
    var months = [
        "Jan",
        "Feb",
        "Mar",
        "Apr",
        "May",
        "Jun",
        "Jul",
        "Aug",
        "Sep",
        "Oct",
        "Nov",
        "Dec",
    ]

    print("┌", "─" * 37, "┐", sep="")
    print("│", " " * 10, "Calendar of ", year, " " * 11, "│", sep="")
    print("├", "─" * 37, "┤", sep="")

    for m in range(12):
        print("│", " " * 17, months[m], " " * 17, "│", sep="")
        print("│  Mon  Tue  Wed  Thu  Fri  Sat  Sun  │\n│  ", end="")
        # Print leading spaces for the first week of the month
        for _ in range(day_of_week):
            print("     ", end="")
        for d in range(1, days_in_month[m] + 1):
            if d <= 9:
                print(d, end="    ")
            else:
                print(d, end="   ")
            if day_of_week == 6:
                if d != days_in_month[m]:
                    # If it's Sunday and not the last day of the month
                    print("│\n│  ", end="")  # New line after Sunday
                else:
                    print("│")
            day_of_week = (day_of_week + 1) % 7  # Update
        # Print trailing spaces for the last week of the month
        if day_of_week != 0:  # If the last day is not Sunday
            for _ in range(day_of_week, 7):
                print("     ", end="")
            print("│")
        if m < 11:  # Not the last month
            print("├", "─" * 37, "┤", sep="")
        else:
            print("└", "─" * 37, "┘", sep="")


def main():
    while True:
        var year = Int(
            input("Enter a year (after 1582) to print its calendar: ")
        )
        if year <= 1582:
            print("Year must be after 1582. Please try again.")
            continue
        print_calendar(year)
        break
