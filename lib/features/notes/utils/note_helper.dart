import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

const numberOfNotebookLinesOnAPage = 16;

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

NoteDate getNoteDateFromPageIndex(int pageIndex) => NoteDate(
      day: pageIndexToDay(pageIndex),
      month: pageIndexToMonth(pageIndex),
      year: DateTime.now().year,
    );

int pageIndexToDay(int pageIndex) => int.tryParse(pageIndexToDayAndMonth(pageIndex).split('/')[0])!;

int pageIndexToMonth(int pageIndex) => int.tryParse(pageIndexToDayAndMonth(pageIndex).split('/')[1])!;

String pageIndexToDayAndMonth(int pageIndex) {
  final int nextMonthIndex = _numberOfDaysPassedSinceStartOFTheYearForEachMonth.indexOf(
    _numberOfDaysPassedSinceStartOFTheYearForEachMonth.firstWhere((nextMonthIndex) => nextMonthIndex >= pageIndex),
  );

  final int day;
  final int currentMonth;

  if (nextMonthIndex > 0) {
    final int currentMonthIndex = nextMonthIndex > 0 ? nextMonthIndex - 1 : nextMonthIndex;
    day = pageIndex - _numberOfDaysPassedSinceStartOFTheYearForEachMonth[currentMonthIndex];
    currentMonth = nextMonthIndex + 1;
  } else {
    day = pageIndex;
    currentMonth = 1;
  }

  return '$day/$currentMonth';
}

int noteDateToPageIndex(NoteDate noteDate) {
  final int day = noteDate.day;
  final int month = noteDate.month;

  if (month > 1) {
    return _numberOfDaysPassedSinceStartOFTheYearForEachMonth[month - 2] + day;
  } else {
    return day;
  }
}

double calculateTextSize(BuildContext? context) {
  if (context == null) {
    return 1;
  }

  // TODO: work on text size to scale correctly on different phones

  final screenHeightMultiplier = context.screenHeight * 0.01;
  final singleLinesHeightFactor = numberOfNotebookLinesOnAPage / screenHeightMultiplier;
  final scaledTextHeight = 4.425 / singleLinesHeightFactor;
  return scaledTextHeight;
}

bool isPageEven(int pageIndex) => pageIndex % 2 == 0;
