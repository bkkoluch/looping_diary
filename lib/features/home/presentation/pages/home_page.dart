import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/common/presentation/widgets/device_size_box.dart';
import 'package:looping_diary/features/home/presentation/widgets/core_app_bar.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';
import 'package:looping_diary/features/notes/presentation/widgets/note_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final NoteCubit cubit = getIt<NoteCubit>();

  @override
  void initState() {
    super.initState();
    cubit.fetchAllNotes();
  }

  @override
  Widget build(_) => DeviceSizeBox(
        child: Scaffold(
          backgroundColor: ColorTokens.brandSecondaryVeryLight,
          appBar: const CoreAppBar(),
          body: BlocProvider.value(
            value: cubit,
            child: BlocBuilder<NoteCubit, NoteState>(
              builder: (_, state) {
                if (state.status == NoteStateStatus.loading) {
                  return _buildLoadingIndicator();
                }
                return _buildNotesList();
              },
            ),
          ),
          floatingActionButton: cubit.state.status == NoteStateStatus.loading || cubit.wasNoteCreatedToday
              ? const SizedBox.shrink()
              : _buildFloatingAddNoteButton(),
        ),
      );

  FloatingActionButton _buildFloatingAddNoteButton() => FloatingActionButton(
        backgroundColor: ColorTokens.brandPrimary,
        onPressed: _pushAddNotePageAndRebuildWhenPopped,
        child: SizedBox(
          width: CoreDimensions.defaultIconSize,
          height: CoreDimensions.defaultIconSize,
          child: Image.asset(Illustrations.newNote),
        ),
      );

  Widget _buildLoadingIndicator() => const Center(child: CircularProgressIndicator());

  // TODO: turn that to a carousel looking like:
  // 15/5/2020 - 16/5/2020 - 17/5/2020
  // 15/5/2021 - 16/5/2021 - 17/5/2021
  // 15/5/2022 - 16/5/2023 - 17/5/2023
  Widget _buildNotesList() {
    final List<Note> notes = cubit.state.allNotes;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: CoreDimensions.paddingL),
      itemCount: notes.length,
      itemBuilder: (_, int index) => InkWell(
        onTap: () => _pushAddNotePageAndRebuildWhenPopped(notes[index]),
        child: NoteCard(note: notes[index]),
      ),
    );
  }

  void _pushAddNotePageAndRebuildWhenPopped([Note? note]) =>
      context.router.push(AddNoteRoute(noteToAddOrEdit: note)).then((_) {
        // Used to force the rebuild after a page pop
        setState(() {});
      });
}
