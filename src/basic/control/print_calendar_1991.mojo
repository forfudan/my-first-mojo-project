# print_calendar_1991.mojo
def print_calendar(year: Int) -> None:
    """Prints the calendar for the given year.

    Args:
        year: The year for which the calendar is printed.

    Note:
        The calendar is valid for years after 1582.
    """

    var days_in_month = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
    var which_weekday = 1  # 1991-01-01 is a Tuesday
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

    print("Calendar of", year)
    print()

    for m in range(12):
        print(months[m])
        print("Mon\tTue\tWed\tThu\tFri\tSat\tSun")
        # Print leading spaces for the first week of the month
        for _ in range(which_weekday):
            print("  ", end="\t")
        # Print the days of the month
        for d in range(1, days_in_month[m] + 1):
            print(d, end="\t")
            # If it's the last day of the week, print a newline
            if which_weekday == 6:
                print()
            which_weekday = (
                which_weekday + 1
            ) % 7  # Update the day of the week
        print("\n")


def main():
    print_calendar(1991)
