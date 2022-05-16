import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/common/presentation/widgets/keyboard_dismiss_on_tap.dart';
import 'package:looping_diary/features/common/presentation/widgets/safe_area_scrollable_scaffold.dart';
import 'package:looping_diary/features/home/presentation/widgets/core_app_bar.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({this.noteToAddOrEdit, Key? key}) : super(key: key);

  final Note? noteToAddOrEdit;

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final TextEditingController noteTextFieldController = TextEditingController();
  final NoteCubit cubit = getIt<NoteCubit>();

  @override
  void initState() {
    super.initState();
    noteTextFieldController.text = widget.noteToAddOrEdit?.entry ?? '';
    cubit.updateCurrentNote(widget.noteToAddOrEdit);
  }

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (_) => cubit,
        child: KeyboardDismissOnTapWidget(
          child: SafeAreaScrollableScaffold(
            appBar: CoreAppBar(
              noteDate: widget.noteToAddOrEdit?.noteDate,
              leading: IconButton(
                onPressed: () => popPageDependingOnContents(context),
                icon: const Icon(
                  Icons.arrow_back,
                  color: ColorTokens.white,
                ),
                color: ColorTokens.brandPrimary,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(CoreDimensions.paddingL),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CoreTextField(
                        focusNode: FocusNode(),
                        controller: noteTextFieldController,
                        maxLines: 28,
                        onChanged: (text) {
                          setState(() {});
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            floatingActionButton: AnimatedSlide(
              duration: const Duration(milliseconds: 1000),
              offset: noteTextFieldController.value.text.isNotEmpty ? Offset.zero : const Offset(0, 10),
              child: ElevatedButton(
                onPressed: () => cubit
                  ..updateNoteEntry(noteTextFieldController.text)
                  ..saveNote(),
                child: const Text('Save note'),
              ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
          ),
        ),
      );

  void popPageDependingOnContents(BuildContext context) {
    // TODO: add 'are you sure' popup if somethings is filled
    if (cubit.state.currentNote.entry != noteTextFieldController.text) {}
    context.router.pop();
  }
}
