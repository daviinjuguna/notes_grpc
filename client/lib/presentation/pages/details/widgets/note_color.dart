import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template note_color}
/// Widget to display the note color options.
/// {@endtemplate}
class NoteColor extends StatelessWidget {
  /// {@macro note_color}
  /// creates a [NoteColor] instance.
  const NoteColor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Wrap(
            alignment: WrapAlignment.spaceBetween,
            runSpacing: 10,
            children: AppColors.noteColors
                .map(
                  (color) => GestureDetector(
                    onTap: () {
                      context.read<NoteFormCubit>().colorChanged(color);
                    },
                    child: AnimatedContainer(
                      width: 50,
                      height: 50,
                      duration: const Duration(milliseconds: 500),
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                        border: Border.fromBorderSide(
                          state.color.isValid && state.color.value == color
                              ? const BorderSide(width: 1.5)
                              : BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }
}
