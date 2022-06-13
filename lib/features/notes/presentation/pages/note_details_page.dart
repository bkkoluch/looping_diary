import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/core/ui/snack_bar.dart';
import 'package:looping_diary/core/utils/keyboard_utils.dart' as keyboard_utils;
import 'package:looping_diary/features/common/presentation/widgets/core_painter_image.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_snackbar.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/common/presentation/widgets/note_content.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/cubit.dart';
import 'package:looping_diary/features/notes/presentation/dialogs/delete_note_dialog.dart';
import 'package:looping_diary/features/notes/presentation/dialogs/leave_without_saving_note_dialog.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_page_overlay.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';
import 'package:looping_diary/res/strings.dart';

class NoteDetailsPage extends StatefulWidget {
  const NoteDetailsPage({
    required this.note,
    required this.pageIndex,
    this.shouldNavigateToHomeOnPop = false,
    this.autofocus = true,
    Key? key,
  }) : super(key: key);

  final Note note;
  final int pageIndex;
  final bool autofocus;
  final bool shouldNavigateToHomeOnPop;

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  final TextEditingController noteTextFieldController = TextEditingController();
  final FocusNode noteTextFieldFocusNode = FocusNode();
  final NoteCubit cubit = getIt<NoteCubit>();

  bool isEditMode = false;

  @override
  void initState() {
    super.initState();
    cubit.updateCurrentNote(widget.note);
    noteTextFieldController.text = widget.note.entry ?? '';
    isEditMode = widget.autofocus;
  }

  @override
  Widget build(BuildContext context) => DeviceSizeBox(
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
            builder: (_, __) => NotePageOverlay(
              pageIndex: widget.pageIndex,
              underneathNotePage: _buildNoteDetails(),
              quickActionsColumn: _buildQuickActionsColumn(),
            ),
          ),
        ),
      );

  Widget _buildNoteDetails() => NotebookStack(
        pageIndex: widget.pageIndex,
        child: SingleChildScrollView(
          child: NoteContent(
            isNoteDetails: true,
            pageIndex: widget.pageIndex,
            noteDate: widget.note.noteDate,
            noteEntryWidget: Column(
              children: [
                SizedBox(height: context.screenHeight * 0.092),
                CoreTextField(
                  focusNode: noteTextFieldFocusNode,
                  controller: noteTextFieldController,
                  autofocus: widget.autofocus,
                  onTap: () => setState(() => isEditMode = true),
                  maxLines: context.isKeyboardVisible ? 10 : 16,
                ),
              ],
            ),
          ),
        ),
      );

  Column _buildQuickActionsColumn() => Column(
        children: [
          SizedBox(height: context.screenHeight * 0.1),
          _buildBackOrHomeIcon(),
          _buildSaveNoteIcon(),
          _buildDeleteNoteIcon(),
          _buildKeyboardToggleIcon(),
        ],
      );

  Widget _buildBackOrHomeIcon() => InkWell(
        onTap: () => _popPageDependingOnContents(context),
        child: widget.autofocus
            ? Image.asset(
                Illustrations.home,
                color: ColorTokens.brandAccent,
                height: _iconSize,
                width: _iconSize,
              )
            : _buildPainterIcon(PainterTokens.iconBack),
      );

  Widget _buildSaveNoteIcon() => InkWell(
        onTap: () => _saveNote(context, noteTextFieldController.text),
        child: _buildPainterIcon(PainterTokens.iconSaveNote),
      );

  Widget _buildDeleteNoteIcon() => cubit.state.loading
      ? const CircularProgressIndicator(color: ColorTokens.brandAccent)
      : InkWell(onTap: _showDeleteNotePopup, child: _buildPainterIcon(PainterTokens.iconDeleteNote));

  Widget _buildKeyboardToggleIcon() => InkWell(
        onTap: isEditMode
            ? () {
                keyboard_utils.hideKeyboard();
                FocusScope.of(context).unfocus();
                setState(() => isEditMode = false);
              }
            : () {
                keyboard_utils.showKeyboardAndFocusNode(context, noteTextFieldFocusNode);
                setState(() => isEditMode = true);
              },
        child: _buildPainterIcon(isEditMode ? PainterTokens.iconKeyboardHide : PainterTokens.iconKeyboardShow),
      );

  Widget _buildPainterIcon(CustomPainter painter) =>
      CorePainterImage.sized(painter: painter, height: _iconSize, width: _iconSize);

  void _popPageDependingOnContents(BuildContext context) async {
    await keyboard_utils.hideKeyboard();
    noteTextFieldFocusNode.unfocus();
    if (cubit.state.currentNote.entry != noteTextFieldController.text) {
      await LeaveWithoutSavingNoteDialog(_popOrReplacePage).show(context: context);
    } else {
      await _popOrReplacePage();
    }
  }

  void _saveNote(BuildContext context, String noteEntry) async {
    await keyboard_utils.hideKeyboard();

    cubit
      ..updateNoteEntry(noteTextFieldController.text)
      ..saveNote();
  }

  void _showDeleteNotePopup() async {
    noteTextFieldFocusNode.unfocus();
    await keyboard_utils.hideKeyboard();
    await DeleteNoteDialog(cubit.deleteNote).show(context: context);
  }

  Future<void> _popOrReplacePage() async {
    if (widget.shouldNavigateToHomeOnPop) {
      await context.router.replace(HomeRoute());
    } else {
      await context.router.pop();
    }
  }

  double get _iconSize => context.screenHeight * 0.05;
}
