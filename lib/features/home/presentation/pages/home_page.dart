import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:looping_diary/core/injector/injector.dart';
import 'package:looping_diary/core/services/navigation/navigation_service.gr.dart';
import 'package:looping_diary/core/style/color_tokens.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/illustrations.dart';
import 'package:looping_diary/features/home/presentation/widgets/core_app_bar.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_cubit.dart';
import 'package:looping_diary/features/notes/presentation/cubits/note_state.dart';

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
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: ColorTokens.brandSecondaryVeryLight,
        appBar: const CoreAppBar(),
        body: BlocProvider.value(
          value: cubit,
          child: BlocBuilder<NoteCubit, NoteState>(
            builder: (context, state) {
              if (state.status == NoteStateStatus.loading) {
                return _buildLoadingIndicator();
              }
              return _buildNotesList();
            },
          ),
        ),
        floatingActionButton: cubit.isTodayNoteCreated ? const SizedBox.shrink() : _buildFloatingAddNoteButton(context),
      );

  FloatingActionButton _buildFloatingAddNoteButton(BuildContext context) => FloatingActionButton(
        backgroundColor: ColorTokens.brandPrimary,
        onPressed: () {
          context.router.push(AddNoteRoute(noteToAddOrEdit: _getNoteToEdit)).then((_) {
            // Used to force the rebuild after a page pop
            setState(() {});
          });
        },
        child: SizedBox(
          width: CoreDimensions.defaultIconSize,
          height: CoreDimensions.defaultIconSize,
          child: Image.asset(Illustrations.newNote),
        ),
      );

  // TODO: turn that to a carousel looking like:
  // 15/5/2020 - 16/5/2020 - 17/5/2020
  // 15/5/2021 - 16/5/2021 - 17/5/2021
  // 15/5/2022 - 16/5/2023 - 17/5/2023

  Widget _buildLoadingIndicator() => const Center(child: CircularProgressIndicator());

  Widget _buildNotesList() {
    final List<Note> notes = cubit.state.allNotes;
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: CoreDimensions.paddingL),
      itemCount: notes.length,
      itemBuilder: (BuildContext context, int index) {
        final NoteDate noteDate = notes[index].noteDate;
        return InkWell(
          onTap: () => context.router.push(AddNoteRoute(noteToAddOrEdit: notes[index])).then((_) {
            // Used to force the rebuild after a page pop
            setState(() {});
          }),
          child: Card(
            elevation: CoreDimensions.noteCardElevation,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CoreDimensions.noteCardBorderRadius)),
            margin: const EdgeInsets.all(CoreDimensions.paddingM),
            child: Padding(
              padding: const EdgeInsets.all(CoreDimensions.paddingS),
              child: Column(
                children: [
                  Text(noteDate.toReadableDate),
                  const Divider(thickness: CoreDimensions.noteCardDividerThickness),
                  Text(notes[index].entry ?? ''),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Note? get _getNoteToEdit => cubit.state.allNotes.isNotEmpty
      ? cubit.state.allNotes.firstWhereOrNull((note) => note.noteDate == NoteDate.today)
      : null;
}
