import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:notes_gprc/presentation/presentation.dart';

/// {@template todo_list}
/// Widget to display the list of todos.
/// {@endtemplate}
class TodoList extends StatefulWidget {
  const TodoList({super.key});

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  late List<TodoEntity> _todoItem =
      context.read<NoteFormCubit>().state.todoList.value;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NoteFormCubit, NoteFormState>(
      listenWhen: (previous, current) => previous.existing != current.existing,
      listener: (context, state) {
        _todoItem = state.todoList.value;
      },
      buildWhen: (previous, current) => previous.todoList != current.todoList,
      builder: (context, state) {
        _todoItem = state.todoList.value;
        return ReorderableListView.builder(
          buildDefaultDragHandles: false,
          itemCount: _todoItem.length,
          padding: const EdgeInsets.all(3),
          shrinkWrap: true,
          proxyDecorator: (child, index, animation) {
            final elevation = lerpDouble(0, 8, animation.value);
            return ScaleTransition(
              scale: Tween<double>(begin: 1, end: 0.95).animate(animation),
              child: Material(
                elevation: elevation ?? 0.0,
                animationDuration: const Duration(milliseconds: 100),
                borderRadius: BorderRadius.circular(8),
                child: child,
              ),
            );
          },
          onReorder: context.read<NoteFormCubit>().todoReorder,
          itemBuilder: (context, index) {
            final todo = _todoItem[index];
            return Dismissible(
              key: ValueKey(todo.id),
              direction: DismissDirection.endToStart,
              onDismissed: (DismissDirection direction) {
                context.read<NoteFormCubit>().todoDelete(index);
              },
              child: Card(
                child: PlatformListTile(
                  leading: PlatformCheckbox(
                    value: todo.completed,
                    onChanged: (value) {
                      context
                          .read<NoteFormCubit>()
                          .todoCompleteChanged(value!, index);
                    },
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ReorderableDelayedDragStartListener(
                        index: index,
                        child: const Icon(Icons.drag_handle),
                      ),
                      PlatformIconButton(
                        icon: Icon(PlatformIcons(context).delete),
                        onPressed: () {
                          context.read<NoteFormCubit>().todoDelete(index);
                        },
                      )
                    ],
                  ),
                  title: PlatformTextFormField(
                    initialValue: todo.title,
                    material: (context, platform) {
                      return MaterialTextFormFieldData(
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.primary,
                        ),
                        decoration: const InputDecoration(
                          border: InputBorder.none,
                        ),
                      );
                    },
                    cupertino: (context, platform) {
                      return CupertinoTextFormFieldData(
                        decoration: const BoxDecoration(),
                        style: TextStyle(
                          color: CupertinoTheme.of(context).primaryColor,
                        ),
                      );
                    },
                    onChanged: (value) {
                      context
                          .read<NoteFormCubit>()
                          .todoTitleChanged(value, index);
                    },
                  ),
                  material: (context, platform) => MaterialListTileData(
                    tileColor: Theme.of(context).colorScheme.background,
                    textColor: Theme.of(context).colorScheme.primary,
                  ),
                  cupertino: (context, platform) => CupertinoListTileData(
                    backgroundColor:
                        CupertinoTheme.of(context).scaffoldBackgroundColor,
                  ),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
