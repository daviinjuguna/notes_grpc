import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template note_body}
/// The form body of the note details page.
/// {@endtemplate}
class NoteBody extends StatefulWidget {
  /// {@macro note_body}
  const NoteBody({super.key});

  @override
  State<NoteBody> createState() => _NoteBodyState();
}

class _NoteBodyState extends State<NoteBody> {
  AppLocalizations get l10n => AppLocalizations.of(context);
  NoteFormCubit get cubit => context.read<NoteFormCubit>();

  late final TextEditingController _titleController;
  @override
  void initState() {
    super.initState();
    _titleController =
        TextEditingController(text: cubit.state.existing?.content);
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormCubit, NoteFormState>(
      bloc: cubit,
      listenWhen: (previous, current) => previous.existing != current.existing,
      listener: (context, state) {
        _titleController.text = state.note.value;
      },
      buildWhen: (previous, current) =>
          previous.note != current.note || previous.color != current.color,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: PlatformTextFormField(
            controller: _titleController,
            maxLength: 2000,
            maxLines: null,
            minLines: 5,
            onChanged: cubit.noteChanged,
            material: (context, platform) {
              return MaterialTextFormFieldData(
                style: TextStyle(
                  color: AppColors.textColor(state.color.value),
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: state.color.value,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
            cupertino: (context, platform) {
              return CupertinoTextFormFieldData(
                style: TextStyle(
                  color: AppColors.textColor(state.color.value),
                ),
                decoration: BoxDecoration(
                  color: state.color.value,
                  border: Border.all(
                    color: CupertinoTheme.of(context).primaryColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
