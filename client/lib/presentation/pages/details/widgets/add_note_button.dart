import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/presentation.dart';

class AddNoteButton extends StatelessWidget {
  const AddNoteButton({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      buildWhen: (previous, current) =>
          previous.isValid != current.isValid ||
          previous.existing != current.existing,
      builder: (context, state) {
        return SafeArea(
          child: PlatformElevatedButton(
            onPressed: state.isValid
                ? () {
                    context.read<NoteFormCubit>().submit();
                  }
                : null,
            child:
                Text(state.existing == null ? l10n.addNote : l10n.updateNote),
          ),
        );
      },
    );
  }
}
