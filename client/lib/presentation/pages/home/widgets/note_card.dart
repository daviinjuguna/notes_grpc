import 'package:flutter/material.dart';
import 'package:flutter_platform_widgets/flutter_platform_widgets.dart';
import 'package:notes_gprc/core/app_colors.dart';
import 'package:notes_gprc/domain/domain.dart';

/// {@template note_card}
/// A card to display a note.
/// {@endtemplate}

class NoteCard extends StatelessWidget {
  /// {@macro note_card}
  /// creates a [NoteCard] instance.
  /// {@endtemplate}
  const NoteCard({
    super.key,
    required this.note,
    required this.onTap,
    required this.onDelete,
  });

  /// {@macro note}
  /// The note to display.
  /// {@endtemplate}
  final NoteEntity note;

  /// {@macro on_tap}
  /// The callback to call when the card is tapped.
  /// {@endtemplate}
  final VoidCallback onTap;

  /// {@macro on_delete}
  /// The callback to call when the delete button is tapped.
  /// {@endtemplate}
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      clipBehavior: Clip.antiAlias,
      color: note.color,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      note.content,
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.textColor(note.color),
                      ),
                    ),
                    if (note.todos.isNotEmpty) ...[
                      const SizedBox(height: 4),
                      Wrap(
                        spacing: 8,
                        children: [
                          ...note.todos.map((e) => TodoDisplay(
                                todo: e,
                                textColor: AppColors.textColor(note.color),
                              ))
                        ],
                      )
                    ]
                  ],
                ),
              ),
            ),
          ),
          PlatformIconButton(
            icon: Icon(
              PlatformIcons(context).delete,
            ),
            onPressed: onDelete,
          )
        ],
      ),
    );
  }
}

/// {@template todo_display}
/// A widget to display a todo item.
/// {@endtemplate}
class TodoDisplay extends StatelessWidget {
  /// {@macro todo_display}
  /// creates a [TodoDisplay] instance.
  /// {@endtemplate}
  const TodoDisplay({super.key, required this.todo, required this.textColor});

  /// {@macro todo}
  /// The todo to display.
  /// {@endtemplate}
  final TodoEntity todo;

  /// {@macro text_color}
  /// The color of the text.
  /// {@endtemplate}
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (todo.completed)
          Icon(
            Icons.check_box,
            color: Theme.of(context).colorScheme.secondary,
          ),
        if (!todo.completed)
          Icon(
            Icons.check_box_outline_blank,
            color: Theme.of(context).disabledColor,
          ),
        const SizedBox(width: 4),
        Text(
          todo.title,
          style: TextStyle(color: textColor),
        ),
      ],
    );
  }
}
