import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/features/notes/domain/models/note.dart';

class NoteCard extends StatelessWidget {
  const NoteCard({required this.note, Key? key}) : super(key: key);

  final Note note;

  @override
  Widget build(_) => Card(
        elevation: CoreDimensions.noteCardElevation,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(CoreDimensions.noteCardBorderRadius)),
        margin: const EdgeInsets.all(CoreDimensions.paddingM),
        child: Padding(
          padding: const EdgeInsets.all(CoreDimensions.paddingS),
          child: Column(
            children: [
              Text(note.noteDate.toReadableDate),
              const Divider(thickness: CoreDimensions.noteCardDividerThickness),
              Text(note.entry ?? ''),
            ],
          ),
        ),
      );
}
