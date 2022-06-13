import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_button.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_snackbar.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';
import 'package:looping_diary/features/notes/presentation/widgets/empty_note_card.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_list_with_bookmarks.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_page_overlay.dart';
import 'package:looping_diary/res/painters/notebook_painters/notebook_painter.dart';
import 'package:looping_diary/res/strings.dart';

class HomePage extends StatefulWidget {
  const HomePage({this.pageToScrollTo, Key? key}) : super(key: key);

  final int? pageToScrollTo;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteCubit cubit = getIt<NoteCubit>();

  PageController notesCarrouselController = PageController(
    initialPage: Note.today.noteDate.toDateTime.numberOfDaysFromPreviousMonths + Note.today.noteDate.toDateTime.day,
  );
  int displayedListIndex = 0;

  @override
  void initState() {
    super.initState();
    cubit.fetchAllNotes();
    setState(() {
      displayedListIndex = cubit.state.todayNoteIndex;
    });

    if (widget.pageToScrollTo != null) {
      notesCarrouselController = PageController(initialPage: widget.pageToScrollTo!);
      displayedListIndex = widget.pageToScrollTo!;
    }
  }

  @override
  Widget build(BuildContext context) => DeviceSizeBox(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorTokens.brandSecondaryVeryLight,
          body: Stack(
            children: [
              CorePainterImage.sized(
                width: context.screenWidth,
                height: context.screenHeight,
                painter: NotebookPainter(Note.today.noteDate.toDateTime.dayOfYear),
              ),
              BlocBuilder<NoteCubit, NoteState>(
                bloc: cubit,
                builder: (_, NoteState state) {
                  if (state.status == NoteStateStatus.loading) {
                    return _buildLoadingIndicator();
                  } else if (state.status == NoteStateStatus.noConnectionError) {
                    return _buildRetryColumn();
                  }
                  return _buildNotesLists();
                },
              ),
            ],
          ),
          floatingActionButton: AnimatedSlide(
            offset: Offset(0, displayedListIndex == cubit.state.todayNoteIndex ? 3 : 0),
            duration: const Duration(milliseconds: 500),
            child: CoreButton(
              onTap: _scrollToTodayNote,
              child: CoreText.titleSm(todayButtonText.tr()),
              isSmall: true,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        ),
      );

  Widget _buildLoadingIndicator() => const Center(child: CircularProgressIndicator(color: ColorTokens.brandAccent));

  Widget _buildRetryColumn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoreSnackBar.information(text: noConnectionPageText.tr()),
            CoreButton(onTap: cubit.fetchAllNotes, child: const Text('Retry'))
          ],
        ),
      );

  Widget _buildNotesLists() {
    final List<List<Note>> notesDividedByDayAndMonth = cubit.state.notesSortedByDayAndYears;
    return PageView.builder(
      controller: notesCarrouselController,
      itemCount: notesDividedByDayAndMonth.length,
      onPageChanged: (int pageIndex) => setState(() => displayedListIndex = pageIndex),
      itemBuilder: (_, int pageIndex) {
        final List<Note> notesDividedByDay = notesDividedByDayAndMonth[pageIndex];
        final ScrollController listScrollController = ScrollController();
        if (notesDividedByDay.isEmpty) {
          return NotePageOverlay(
            underneathNotePage: EmptyNoteCard(pageIndex: pageIndex, pageViewController: notesCarrouselController),
            pageIndex: pageIndex,
            quickActionsColumn: _buildQuickActionsColumn(),
          );
        }
        return NotePageOverlay(
          underneathNotePage: NoteListWithBookmarks(
            onNoteTapped: _pushAddNotePageAndScrollToItWhenPopped,
            onPagesScrolled: () => setState(() {}),
            listScrollController: listScrollController,
            pageIndex: pageIndex,
            notesDividedByDay: notesDividedByDay,
          ),
          pageIndex: pageIndex,
          quickActionsColumn: _buildQuickActionsColumn(),
        );
      },
    );
  }

  Column _buildQuickActionsColumn() => Column(
        children: [
          SizedBox(height: context.screenHeight * 0.1),
          InkWell(
            onTap: () => context.router.push(const NoteCalendarRoute()),
            child: CorePainterImage.sized(
              painter: PainterTokens.iconCalendar,
              height: context.screenHeight * 0.05,
              width: context.screenHeight * 0.05,
            ),
          ),
        ],
      );

  void _scrollToTodayNote() => notesCarrouselController.animateToPage(
        cubit.state.todayNoteIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void _pushAddNotePageAndScrollToItWhenPopped(BuildContext context, Note note, int pageIndex) =>
      context.router.push(NoteDetailsRoute(note: note, pageIndex: pageIndex, autofocus: false)).whenComplete(() {
        if (notesCarrouselController.hasClients) {
          notesCarrouselController.jumpToPage(pageIndex);
        }
      });
}
