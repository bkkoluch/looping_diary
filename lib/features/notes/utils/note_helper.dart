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

  final int currentMonthIndex = nextMonthIndex - 1;

  final int day = pageIndex - _numberOfDaysPassedSinceStartOFTheYearForEachMonth[currentMonthIndex];
  final int currentMonth = nextMonthIndex + 1;

  return '$day/$currentMonth';
}

double calculateTextSize(BuildContext? context) {
  if (context == null) {
    return 1;
  }

  // TODO: work on text size to scale correctly on different phones

  final screenHeightMultiplier = context.screenHeight * 0.01;
  final singleLinesHeightFactor = numberOfNotebookLinesOnAPage / screenHeightMultiplier;
  // final scaledTextHeight = 1.81 / singleLinesHeightFactor * 2.45;
  final scaledTextHeight = 4.4345 / singleLinesHeightFactor;
  return scaledTextHeight;
}

bool isPageEven(int pageIndex) => pageIndex % 2 == 0;
