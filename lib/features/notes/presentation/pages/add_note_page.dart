import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/common/presentation/widgets/core_text_field.dart';
import 'package:looping_diary/features/common/presentation/widgets/keyboard_dismiss_on_tap.dart';
import 'package:looping_diary/features/common/presentation/widgets/safe_area_scrollable_scaffold.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  final noteTextFieldController = TextEditingController();

  @override
  Widget build(BuildContext context) => KeyboardDismissOnTapWidget(
        child: SafeAreaScrollableScaffold(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingS),
                child: IconButton(
                  onPressed: () => popPageDependingOnContents(context),
                  icon: const Icon(Icons.arrow_back),
                  color: ColorTokens.brandPrimary,
                ),
              ),
              const SizedBox(height: CoreDimensions.spacingXL),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: CoreDimensions.paddingL),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CoreTextField(
                      focusNode: FocusNode(),
                      controller: noteTextFieldController,
                      maxLines: 30,
                      onChanged: (_) {
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
            offset: noteTextFieldController.value.text.isNotEmpty ? Offset.zero : const Offset(0, 20),
            child: ElevatedButton(
              onPressed: () {},
              child: const Text('Save note'),
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      );

  void popPageDependingOnContents(BuildContext context) {
    // TODO: add 'are you sure' popup if somethings is filled
    context.router.pop();
  }
}
