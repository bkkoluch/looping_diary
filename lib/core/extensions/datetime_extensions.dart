const List<int> _numberOfDaysByMonth = [31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

extension DateTimeExtensions on DateTime {
  // Including leap year

  int get dayOfYear => day + numberOfDaysFromPreviousMonths;

  int get numberOfDaysFromPreviousMonths {
    int tempMonth = month;
    int days = 0;

    while (tempMonth > 1) {
      days = days + _numberOfDaysByMonth[tempMonth - 1];
      tempMonth--;
    }

    return days;
  }

  bool get isToday => isSameDayAs(DateTime.now());

  bool isSameDayAs(DateTime date) => year == date.year && month == date.month && day == date.day;

  String get toReadableFormat {
    final String dayString = day.toString().length == 1 ? '0$day' : day.toString();
    final String monthString = month.toString().length == 1 ? '0$month' : month.toString();

    return '$dayString/$monthString/$year';
  }
}
