import 'package:flutter/material.dart';
import 'package:looping_diary/core/style/core_dimensions.dart';
import 'package:looping_diary/core/style/design_tokens/color_tokens.dart';
import 'package:looping_diary/features/notes/domain/models/note_date.dart';

class CoreAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CoreAppBar({
    this.toolbarHeight = CoreDimensions.defaultAppBarHeight,
    this.noteDate,
    this.leading,
    Key? key,
  }) : super(key: key);

  final double toolbarHeight;
  final NoteDate? noteDate;
  final Widget? leading;

  @override
  Widget build(_) => AppBar(
        toolbarHeight: toolbarHeight,
        centerTitle: true,
        title: Text((noteDate ?? NoteDate.today).toReadableDate),
        leading: leading,
        backgroundColor: ColorTokens.brandPrimary,
        elevation: CoreDimensions.defaultAppBarElevation,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.only(
            bottomStart: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
            bottomEnd: Radius.circular(CoreDimensions.defaultAppBarBorderRadius),
          ),
        ),
      );

  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
