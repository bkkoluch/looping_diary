import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';
import 'package:looping_diary/features/notes/presentation/widgets/empty_note_card.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_list_with_bookmarks.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteCubit cubit = getIt<NoteCubit>();
  final PageController notesCarrouselController = PageController(
    initialPage: Note.today.noteDate.toDateTime.numberOfDaysFromPreviousMonths + Note.today.noteDate.toDateTime.day,
  );

  @override
  void initState() {
    super.initState();
    cubit.fetchAllNotes();
  }

  @override
  Widget build(_) => DeviceSizeBox(
        child: Scaffold(
          backgroundColor: ColorTokens.brandSecondaryVeryLight,
          body: NotebookStack(
            pageIndex: Note.today.noteDate.toDateTime.dayOfYear,
            child: BlocBuilder<NoteCubit, NoteState>(
              bloc: cubit,
              builder: (_, NoteState state) {
                if (state.status == NoteStateStatus.loading) {
                  return _buildLoadingIndicator();
                }
                return _buildNotesLists();
              },
            ),
          ),
        ),
      );

  Widget _buildLoadingIndicator() => const Center(child: CircularProgressIndicator());

  Widget _buildNotesLists() {
    final List<List<Note>> notesDividedByDayAndMonth = cubit.state.notesSortedByDayAndYears;
    return PageView.builder(
      controller: notesCarrouselController,
      itemCount: notesDividedByDayAndMonth.length,
      itemBuilder: (_, int listIndex) {
        final List<Note> notesDividedByDay = notesDividedByDayAndMonth[listIndex];
        final ScrollController listScrollController = ScrollController();
        if (notesDividedByDay.isEmpty) {
          return EmptyNoteCard(pageIndex: listIndex);
        }
        return NoteListWithBookmarks(
          onNoteTapped: _pushAddNotePageAndRebuildWhenPopped,
          onPagesScrolled: () => setState(() {}),
          listScrollController: listScrollController,
          listIndex: listIndex,
          notesDividedByDay: notesDividedByDay,
        );
      },
    );
  }

  void _pushAddNotePageAndRebuildWhenPopped([Note? note]) =>
      context.router.push(AddNoteRoute(noteToAddOrEdit: note)).then((_) {
        // Used to force the rebuild after a page pop
        setState(() {});
      });
}
