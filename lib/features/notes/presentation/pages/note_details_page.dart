import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/extensions/context_extensions.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/common/presentation/widgets/keyboard_dismiss_on_tap.dart';
import 'package:looping_diary/features/common/presentation/widgets/note_content.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/widgets/notebook_stack.dart';
import 'package:looping_diary/features/notes/utils/note_helper.dart' as note_helper;

class NoteDetailsPage extends StatefulWidget {
  const NoteDetailsPage({required this.note, required this.pageIndex, Key? key}) : super(key: key);

  final Note note;
  final int pageIndex;

  @override
  State<NoteDetailsPage> createState() => _NoteDetailsPageState();
}

class _NoteDetailsPageState extends State<NoteDetailsPage> {
  final TextEditingController noteTextFieldController = TextEditingController();
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
            body: Stack(
              children: [
                _buildNoteDetails(),
                _buildAboveLayerWithQuickActions(),
              ],
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
                CoreTextField(
                  focusNode: FocusNode(),
                  controller: noteTextFieldController,
                  maxLines: context.isKeyboardVisible ? 11 : 16,
                  onChanged: (_) => setState(() {}),
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
            width: note_helper.isPageEven(widget.pageIndex) ? context.screenWidth * 0.1 : context.screenWidth * 0.9,
            child: note_helper.isPageEven(widget.pageIndex) ? _buildQuickActionsColumn() : const SizedBox.shrink(),
          ),
          Container(
            padding: EdgeInsets.only(right: note_helper.isPageEven(widget.pageIndex) ? 0 : CoreDimensions.paddingXS),
            width: note_helper.isPageEven(widget.pageIndex) ? context.screenWidth * 0.9 : context.screenWidth * 0.1,
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
            ),
          ),
          InkWell(
            onTap: () => saveNote(noteTextFieldController.text),
            child: Image.asset(
              Illustrations.newNote,
              color: ColorTokens.brandAccent,
            ),
          ),
        ],
      );

  void popPageDependingOnContents(BuildContext context) {
    // TODO: add 'are you sure' popup if somethings is filled
    if (cubit.state.currentNote.entry != noteTextFieldController.text) {}
    context.router.pop();
  }

  void saveNote(String noteEntry) => cubit
    ..updateNoteEntry(noteTextFieldController.text)
    ..saveNote();
}
