import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_button.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:table_calendar/table_calendar.dart';

class NoteCalendarPage extends StatefulWidget {
  const NoteCalendarPage({Key? key}) : super(key: key);

  @override
  State<NoteCalendarPage> createState() => _NoteCalendarPageState();
}

class _NoteCalendarPageState extends State<NoteCalendarPage> {
  // Using a fixed '2020' year as it's the closest leap year I've chosen
  // as I need February to have 29 days on the TableCalendar widget
  // also reusing the same object as a common variable can't be accessed in an initializer

  final DateTime _currentDay = DateTime(2020, DateTime.now().month, DateTime.now().day);
  DateTime _focusedDay = DateTime(2020, DateTime.now().month, DateTime.now().day);
  DateTime _selectedDay = DateTime(2020, DateTime.now().month, DateTime.now().day);

  final NoteCubit _noteCubit = getIt<NoteCubit>();

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brown,
        appBar: AppBar(
          backgroundColor: ColorTokens.brown,
          iconTheme: const IconThemeData.fallback().copyWith(color: ColorTokens.brandAccent),
        ),
        body: Column(
          children: [
            _buildCalendar(),
            const SizedBox(height: CoreDimensions.spacingL),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingM),
                child: _buildNotesColumnForSelectedDay(),
              ),
            ),
          ],
        ),
      );

  Widget _buildCalendar() => TableCalendar(
        currentDay: _currentDay,
        focusedDay: _focusedDay,
        calendarStyle: _calendarStyle,
        onDaySelected: _onDaySelected,
        onPageChanged: _onPageChanged,
        firstDay: DateTime.utc(2020),
        lastDay: DateTime.utc(2020, 12, 31),
        startingDayOfWeek: StartingDayOfWeek.monday,
        headerStyle: HeaderStyle(
          titleCentered: true,
          titleTextStyle: CoreText.titleSm('', color: ColorTokens.brandAccent).style,
          titleTextFormatter: _getTitleTextFormatter,
          leftChevronIcon: const Icon(Icons.chevron_left, color: ColorTokens.brandAccent),
          rightChevronIcon: const Icon(Icons.chevron_right, color: ColorTokens.brandAccent),
        ),
        selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
        availableCalendarFormats: const {CalendarFormat.month: 'Month'},
        daysOfWeekVisible: false,
        eventLoader: _getEventsForDay,
      );

  Widget _buildNotesColumnForSelectedDay() {
    final int noteListIndex = _getNoteListIndexFromSelectedDay(_selectedDay);
    final List<Note> notesToDisplay = _noteCubit.state.notesSortedByDayAndYears[noteListIndex + 2];

    return ListView.builder(
      itemCount: notesToDisplay.length,
      itemBuilder: (BuildContext context, int index) {
        final Note note = notesToDisplay[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: CoreDimensions.paddingXM),
          child: CoreButton(
            isScreenWidth: true,
            onTap: () => _navigateToNoteDetails(note, index),
            child: Padding(
              padding: const EdgeInsets.all(CoreDimensions.paddingS),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    flex: 3,
                    child: Text(
                      note.entry ?? '',
                      style: TextTokens.body(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const Spacer(),
                  Expanded(child: CoreText.body(note.noteDate.toReadableDate, maxLines: 1)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  CalendarStyle get _calendarStyle => CalendarStyle(
        outsideDaysVisible: false,
        selectedDecoration: const BoxDecoration(color: ColorTokens.brandAccent, shape: BoxShape.circle),
        weekendTextStyle: const TextStyle(color: ColorTokens.black),
        todayDecoration: BoxDecoration(color: ColorTokens.brandAccent.withOpacity(0.70), shape: BoxShape.circle),
        markerDecoration: const BoxDecoration(color: ColorTokens.scarletRed),
        markerMargin: const EdgeInsets.symmetric(horizontal: 0.5),
        markersMaxCount: 10,
        canMarkersOverflow: false,
      );

  String _getTitleTextFormatter(DateTime date, dynamic locale) => DateFormat.MMMM(locale).format(date);

  List<Note> _getEventsForDay(DateTime day) {
    final int noteListIndex = _getNoteListIndexFromSelectedDay(day);

    return _noteCubit.state.notesSortedByDayAndYears[noteListIndex + 2];
  }

  int _getNoteListIndexFromSelectedDay(DateTime day) {
    final DateTime _day = DateTime(2020, day.month, day.day);
    final DateTime _firstDay = DateTime(2020);

    return _day.difference(_firstDay).inDays;
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    // On double tap on the same day, navigate to its page
    if (selectedDay == _selectedDay) {
      final NoteDate selectedDayNoteDate = NoteDate.fromDateTime(selectedDay);
      context.router.replace(
        HomeRoute(pageToScrollTo: note_helper.noteDateToPageIndex(selectedDayNoteDate)),
      );
    }

    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  void _onPageChanged(DateTime focusedDay) => _focusedDay = focusedDay;

  void _navigateToNoteDetails(Note note, int pageIndex) => context.router.replaceAll([
        HomeRoute(),
        const NoteCalendarRoute(),
        NoteDetailsRoute(note: note, pageIndex: pageIndex, autofocus: false)
      ])
          // SetState used to rebuild the page on pop, if used changed the note before coming back
          .whenComplete(() => setState(() {}));
}
