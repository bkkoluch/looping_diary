const List<int> _numberOfDaysPassedSinceStartOFTheYearForEachMonth = [
  31,
  60,
  91,
  121,
  152,
  182,
  213,
  244,
  274,
  305,
  335,
  366,
];

String pageIndexToDayAndMonth(int pageIndex) {
  final int nextMonthIndex = _numberOfDaysPassedSinceStartOFTheYearForEachMonth.indexOf(
    _numberOfDaysPassedSinceStartOFTheYearForEachMonth.firstWhere((nextMonthIndex) => nextMonthIndex >= pageIndex),
  );

  final int currentMonthIndex = nextMonthIndex - 1;

  final int day = pageIndex - _numberOfDaysPassedSinceStartOFTheYearForEachMonth[currentMonthIndex];
  final int currentMonth = nextMonthIndex + 1;

  return '$day/$currentMonth';
}
