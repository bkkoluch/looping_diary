import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/design_tokens/text_tokens.dart';
import 'package:looping_diary/core/utils/keyboard_utils.dart' as keyboard_utils;
import 'package:looping_diary/features/common/presentation/widgets/core_text.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

const int _yearLimiter = 1950;

class NoteContent extends StatelessWidget {
  const NoteContent({
    required this.noteEntryWidget,
    required this.noteDate,
    required this.pageIndex,
    this.isNoteDetails = false,
    Key? key,
  }) : super(key: key);

  final Widget noteEntryWidget;
  final NoteDate noteDate;
  final int pageIndex;
  final bool isNoteDetails;

  @override
  Widget build(BuildContext context) => Stack(
        clipBehavior: Clip.none,
        children: [
          Align(
            alignment: note_helper.isPageEven(pageIndex) ? Alignment.topRight : Alignment.topLeft,
            child: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.05),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AutoSizeText('${noteDate.day}/${noteDate.month}/', style: TextTokens.titleLg(context: context)),
                    GestureDetector(
                      onTap: () => _showYearChoiceBottomSheet(context),
                      child: AutoSizeText(
                        noteDate.year.toString(),
                        style: TextTokens.titleLg(
                          context: context,
                          color: isNoteDetails ? ColorTokens.brandAccent : ColorTokens.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          noteEntryWidget,
        ],
      );

  void _showYearChoiceBottomSheet(BuildContext context) async {
    final ScrollController listScrollController = ScrollController();
    await keyboard_utils.hideKeyboard();

    unawaited(
      showBarModalBottomSheet(
        context: context,
        enableDrag: false,
        builder: (context) => Container(
          color: ColorTokens.brown,
          height: context.screenHeight * 0.7,
          child: ListView.builder(
            controller: listScrollController,
            itemCount: DateTime.now().year - _yearLimiter,
            itemBuilder: (_, int year) => InkWell(
              onTap: () => _onYearRowTapped(context, year),
              child: Padding(
                padding: const EdgeInsets.all(CoreDimensions.paddingM),
                child: Column(
                  children: [
                    CoreText.titleLg(
                      '${_getYearToDisplay(year)}',
                      color: _getYearToDisplay(year) == noteDate.year ? ColorTokens.brandAccent : ColorTokens.black,
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

    await Future.delayed(const Duration(milliseconds: 250), () {
      listScrollController.animateTo(
        listScrollController.position.maxScrollExtent,
        curve: Curves.ease,
        duration: const Duration(milliseconds: 500),
      );
    });
  }

  Note _getNoteToEdit(int year) {
    final NoteDate noteDateToPush = noteDate.copyWith(year: _getYearToDisplay(year));

    return _noteExists(noteDateToPush)
        ? getIt<NoteCubit>().getNoteForDate(noteDateToPush)!
        : Note(noteDate: noteDateToPush, id: noteDateToPush.toDateTime.toIso8601String());
  }

  void _onYearRowTapped(BuildContext context, int year) => context.router.push(
        NoteDetailsRoute(
          pageIndex: pageIndex,
          shouldNavigateToHomeOnPop: true,
          note: _getNoteToEdit(year),
        ),
      );

  bool _noteExists(NoteDate noteDate) => getIt<NoteCubit>().getNoteForDate(noteDate) != null;

  int _getYearToDisplay(int yearFromList) => yearFromList + _yearLimiter + 1;
}
