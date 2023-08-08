import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:notes_gprc/l10n/l10n.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template add_todo_tile}
/// Widget to add a todo.
/// {@endtemplate}
class AddTodoTile extends StatelessWidget {
  const AddTodoTile({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BlocBuilder<NoteFormCubit, NoteFormState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: PlatformTextButton(
            child: Text(l10n.addTodo),
            onPressed: () {
              final todo = TodoEntity.empty();
              final todos = state.todoList.value;
              context.read<NoteFormCubit>().todoListChanged([...todos, todo]);
            },
            material: (context, platform) => MaterialTextButtonData(
              style: TextButton.styleFrom(
                backgroundColor: Theme.of(context).colorScheme.primary,
                foregroundColor: Theme.of(context).colorScheme.onPrimary,
              ),
            ),
            cupertino: (context, platform) => CupertinoTextButtonData(
              padding: EdgeInsets.zero,
              color: CupertinoDynamicColor.withBrightness(
                color: AppColors.light.primary,
                darkColor: AppColors.dark.primary,
              ),
              child: Text(
                l10n.addTodo,
                style: TextStyle(
                  color: CupertinoDynamicColor.withBrightness(
                    color: AppColors.light.onPrimary,
                    darkColor: AppColors.dark.onPrimary,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
