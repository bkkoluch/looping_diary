extension DateTimeExtensions on DateTime {
  bool get isToday => isSameDayAs(DateTime.now());

  bool isSameDayAs(DateTime date) => year == date.year && month == date.month && day == date.day;

  String get toReadableFormat {
    final String dayString = day.toString().length == 1 ? '0$day' : day.toString();
    final String monthString = month.toString().length == 1 ? '0$month' : month.toString();

    return '$dayString/$monthString/$year';
  }
}
