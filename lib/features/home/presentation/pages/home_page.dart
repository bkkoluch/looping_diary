import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ld_ui/ld_ui.dart';
import 'package:looping_diary/core/extensions/datetime_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/core/style/lotties.dart';
import 'package:looping_diary/features/home/presentation/dialogs/basic_info_dialog.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';
import 'package:looping_diary/features/notes/presentation/widgets/empty_note_card.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_list_with_bookmarks.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_page_overlay.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:looping_diary/res/painters/notebook_painters/notebook_painter.dart';
import 'package:looping_diary/res/strings.dart';
import 'package:lottie/lottie.dart';

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
  Widget build(BuildContext context) => LDDeviceSizeBox(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: ColorTokens.brown,
          body: Stack(
            children: [
              LDPainterImage.sized(
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
            child: LDButton(
              onTap: _scrollToTodayNote,
              child: LDText.titleSm(todayButtonText.tr()),
              isSmall: true,
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterFloat,
        ),
      );

  Widget _buildLoadingIndicator() => Center(
        child: Padding(
          padding: EdgeInsets.only(
            left: note_helper.isPageEven(displayedListIndex) ? context.screenWidth * 0.1 : 0,
            right: note_helper.isPageEven(displayedListIndex) ? 0 : context.screenWidth * 0.1,
          ),
          child: Lottie.asset(Lotties.bookFlipping, animate: true, repeat: true),
        ),
      );

  Widget _buildRetryColumn() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingXL),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LDSnackBar.information(text: noConnectionPageText.tr()),
            LDButton(onTap: cubit.fetchAllNotes, child: const Text('Retry'))
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
          _buildIcon(onTap: _navigateToCalendarPage, painter: PainterTokens.iconCalendar),
          _buildIcon(onTap: _navigateToSettingsPage, painter: PainterTokens.iconSettings),
          _buildIcon(onTap: _showInfoPopup, painter: PainterTokens.iconInfoAlternate),
        ],
      );

  Widget _buildIcon({required VoidCallback onTap, required CustomPainter painter}) => InkWell(
        onTap: onTap,
        child: LDPainterImage.sized(
          painter: painter,
          height: context.screenHeight * 0.05,
          width: context.screenHeight * 0.05,
        ),
      );

  void _navigateToCalendarPage() =>
      context.router.push(NoteCalendarRoute(noteDate: note_helper.getNoteDateFromPageIndex(displayedListIndex)));

  void _navigateToSettingsPage() => context.router.push(const SettingsRoute());

  void _showInfoPopup() async => await BasicInfoDialog().show(context: context);

  void _scrollToTodayNote() => notesCarrouselController.animateToPage(
        cubit.state.todayNoteIndex,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );

  void _pushAddNotePageAndScrollToItWhenPopped(BuildContext context, Note note, int pageIndex) {
    context.router.push(NoteDetailsRoute(note: note, pageIndex: pageIndex)).whenComplete(() {
      if (notesCarrouselController.hasClients) {
        notesCarrouselController.jumpToPage(pageIndex);
      }
    });
  }
}
