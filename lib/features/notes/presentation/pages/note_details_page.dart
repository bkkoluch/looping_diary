import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/core/ui/snack_bar.dart';
import 'package:looping_diary/core/utils/keyboard_utils.dart' as keyboard_utils;
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_snackbar.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/common/presentation/widgets/keyboard_dismiss_on_tap.dart';
import 'package:looping_diary/features/common/presentation/widgets/note_content.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/dialogs/delete_note_dialog.dart';
import 'package:looping_diary/features/notes/presentation/dialogs/leave_without_saving_note_dialog.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;
import 'package:looping_diary/res/strings.dart';

class NoteDetailsPage extends StatefulWidget {
  const NoteDetailsPage({required this.note, required this.pageIndex, Key? key}) : super(key: key);

  final Note note;
  final int pageIndex;

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  final TextEditingController noteTextFieldController = TextEditingController();
  final FocusNode noteTextFieldFocusNode = FocusNode();
  final NoteCubit cubit = getIt<NoteCubit>();

  @override
  void initState() {
    super.initState();
    cubit.updateCurrentNote(widget.note);
    noteTextFieldController.text = widget.note.entry ?? '';
  }

  @override
  Widget build(BuildContext context) => KeyboardDismissOnTapWidget(
        child: DeviceSizeBox(
          child: Scaffold(
            resizeToAvoidBottomInset: false,
            body: BlocConsumer<NoteCubit, NoteState>(
              bloc: cubit,
              listener: (BuildContext context, NoteState state) {
                if (state.shouldShowNoteSavedSnackBar) {
                  cubit.clearShouldShowNoteSavedSnackBar();
                  showNotificationSnackBar(CoreSnackBar.information(text: savedYourNoteSnackBarText.tr()));
                } else if (state.shouldShowNoteDeletedSnackBar) {
                  cubit.clearShouldShowNoteDeletedSnackBar();
                  showNotificationSnackBar(
                    CoreSnackBar.information(text: deletedYourNoteSnackBarText.tr()),
                    notificationKeyString: 'noteDeletedSnackBar',
                  );
                  context.router.pop();
                } else if (state.status == NoteStateStatus.noConnectionError) {
                  showNotificationSnackBar(
                    CoreSnackBar.information(text: noConnectionSnackBarText.tr()),
                    notificationKeyString: 'generalErrorSnackBar',
                  );
                }
              },
              builder: (_, __) => Stack(
                children: [
                  _buildNoteDetails(),
                  _buildAboveLayerWithQuickActions(),
                ],
              ),
            ),
          ),
        ),
      );

  Widget _buildNoteDetails() => NotebookStack(
        pageIndex: widget.pageIndex,
        child: SingleChildScrollView(
          child: NoteContent(
            pageIndex: widget.pageIndex,
            noteDate: widget.note.noteDate,
            noteEntryWidget: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.092),
                GestureDetector(
                  onTap: noteTextFieldFocusNode.requestFocus,
                  child: CoreTextField(
                    focusNode: noteTextFieldFocusNode,
                    controller: noteTextFieldController,
                    maxLines: context.isKeyboardVisible ? 11 : 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _buildAboveLayerWithQuickActions() => Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: note_helper.isPageEven(widget.pageIndex) ? CoreDimensions.paddingXS : 0),
            width: note_helper.isPageEven(widget.pageIndex) ? _noteBookMarginWidth : _noteBookContentWidth,
            child: note_helper.isPageEven(widget.pageIndex) ? _buildQuickActionsColumn() : const SizedBox.shrink(),
          ),
          Container(
            padding: EdgeInsets.only(right: note_helper.isPageEven(widget.pageIndex) ? 0 : CoreDimensions.paddingXS),
            width: note_helper.isPageEven(widget.pageIndex) ? _noteBookContentWidth : _noteBookMarginWidth,
            child: note_helper.isPageEven(widget.pageIndex) ? const SizedBox.shrink() : _buildQuickActionsColumn(),
          ),
        ],
      );

  Widget _buildQuickActionsColumn() => Column(
        children: [
          SizedBox(height: context.screenHeight * 0.1),
          InkWell(
            onTap: () => popPageDependingOnContents(context),
            child: Image.asset(
              Illustrations.home,
              color: ColorTokens.brandAccent,
              height: _iconSize,
              width: _iconSize,
            ),
          ),
          InkWell(
            onTap: () => saveNote(context, noteTextFieldController.text),
            child: CorePainterImage.sized(
              painter: PainterTokens.iconSaveNote,
              height: _iconSize,
              width: _iconSize,
            ),
          ),
          if (cubit.state.currentNote.entry != null && cubit.state.isNotErrorState)
            cubit.state.loading
                ? const CircularProgressIndicator(color: ColorTokens.brandAccent)
                : InkWell(
                    onTap: showDeleteNotePopup,
                    child: CorePainterImage.sized(
                      painter: PainterTokens.iconDeleteNote,
                      height: _iconSize,
                      width: _iconSize,
                    ),
                  ),
        ],
      );

  void popPageDependingOnContents(BuildContext context) async {
    await keyboard_utils.hideKeyboard();
    noteTextFieldFocusNode.unfocus();
    if (cubit.state.currentNote.entry != noteTextFieldController.text) {
      await LeaveWithoutSavingNoteDialog().show(context: context);
    } else {
      await context.router.pop();
    }
  }

  void saveNote(BuildContext context, String noteEntry) async {
    await keyboard_utils.hideKeyboard();

    cubit
      ..updateNoteEntry(noteTextFieldController.text)
      ..saveNote();
  }

  void showDeleteNotePopup() async {
    noteTextFieldFocusNode.unfocus();
    await keyboard_utils.hideKeyboard();
    await DeleteNoteDialog(cubit.deleteNote).show(context: context);
  }

  double get _iconSize => context.screenHeight * 0.05;

  double get _noteBookMarginWidth => context.screenWidth * 0.1;

  double get _noteBookContentWidth => context.screenWidth * 0.9;
}
