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
    Key? key,
  }) : super(key: key);

  final Note note;
  final int pageIndex;
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
    isEditMode = false;
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
                SizedBox(height: context.screenHeight * 0.11),
                CoreTextField(
                  focusNode: noteTextFieldFocusNode,
                  controller: noteTextFieldController,
                  onTap: () => setState(() => isEditMode = true),
                  maxLines: context.isKeyboardVisible ? 10 : 16,
                  autofocus: false,
                ),
              ],
            ),
          ),
        ),
      );

  Column _buildQuickActionsColumn() => Column(
        children: [
          SizedBox(height: context.screenHeight * 0.1),
          _buildBackIcon(),
          _buildSaveNoteIcon(),
          _buildDeleteNoteIcon(),
          _buildKeyboardToggleIcon(),
        ],
      );

  Widget _buildBackIcon() => InkWell(
        onTap: () => _popPageDependingOnContents(context),
        child: _buildPainterIcon(PainterTokens.iconBack),
      );

  Widget _buildSaveNoteIcon() => InkWell(
        onTap: () => _saveNote(context, noteTextFieldController.text),
        child: _buildPainterIcon(PainterTokens.iconSaveNote),
      );

  Widget _buildDeleteNoteIcon() => cubit.state.loading
      ? const CircularProgressIndicator(color: ColorTokens.brandAccent)
      : cubit.getNoteForDate(widget.note.noteDate)?.entry != null
          ? InkWell(onTap: _showDeleteNotePopup, child: _buildPainterIcon(PainterTokens.iconDeleteNote))
          : const SizedBox.shrink();

  Widget _buildKeyboardToggleIcon() => InkWell(
        onTap: isEditMode ? () async => await _hideKeyboardAndChangeKeyboardIcon() : _showKeyboardAndChangeKeyboardIcon,
        child: _buildPainterIcon(isEditMode ? PainterTokens.iconKeyboardHide : PainterTokens.iconKeyboardShow),
      );

  Widget _buildPainterIcon(CustomPainter painter) =>
      CorePainterImage.sized(painter: painter, height: _iconSize, width: _iconSize);

  Future<void> _hideKeyboardAndChangeKeyboardIcon() async {
    await _hideKeyboard();
    setState(() => isEditMode = false);
  }

  void _showKeyboardAndChangeKeyboardIcon() {
    keyboard_utils.showKeyboardAndFocusNode(context, noteTextFieldFocusNode);
    setState(() => isEditMode = true);
  }

  void _popPageDependingOnContents(BuildContext context) async {
    await _hideKeyboard();
    if (cubit.state.currentNote.entry != noteTextFieldController.text &&
        cubit.state.currentNote.noteDate == widget.note.noteDate) {
      await LeaveWithoutSavingNoteDialog(_popOrReplacePage).show(context: context);
    } else {
      await _popOrReplacePage();
    }
  }

  void _saveNote(BuildContext context, String noteEntry) async {
    await _hideKeyboard();

    cubit
      ..updateNoteEntry(noteTextFieldController.text)
      ..saveNote();
  }

  void _showDeleteNotePopup() async {
    await _hideKeyboard();
    await DeleteNoteDialog(_onDeleteNote).show(context: context);
  }

  void _onDeleteNote() async {
    cubit.deleteNote();
    await context.router.replace(HomeRoute(pageToScrollTo: widget.pageIndex));
  }

  Future<void> _hideKeyboard() async {
    setState(() => isEditMode = false);
    await keyboard_utils.hideKeyboard();
    FocusScope.of(context).unfocus();
  }

  Future<void> _popOrReplacePage() async {
    if (widget.shouldNavigateToHomeOnPop) {
      await context.router.replace(HomeRoute(pageToScrollTo: widget.pageIndex));
    } else {
      await context.router.pop();
    }
  }

  double get _iconSize => context.screenHeight * 0.05;
}
