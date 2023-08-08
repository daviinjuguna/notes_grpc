import 'package:protos/protos.dart';
import 'package:uuid/uuid.dart';

class TodoEntity {
  final String id;
  final String title;
  final bool completed;
  final String noteId;

  TodoEntity._({
    required this.id,
    required this.title,
    required this.completed,
    required this.noteId,
  });

  factory TodoEntity.empty() => TodoEntity._(
        id: const Uuid().v4(),
        title: '',
        completed: false,
        noteId: '',
      );

  factory TodoEntity.create({
    required String title,
    required String noteId,
  }) {
    final id = const Uuid().v4();
    return TodoEntity._(
      id: id,
      title: title,
      completed: false,
      noteId: noteId,
    );
  }

  static TodoEntity fromProto(Todo todo) {
    return TodoEntity._(
      id: todo.id,
      title: todo.title,
      completed: todo.completed,
      noteId: todo.noteId,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TodoEntity &&
        other.id == id &&
        other.title == title &&
        other.completed == completed &&
        other.noteId == noteId;
  }

  @override
  int get hashCode {
    return id.hashCode ^ title.hashCode ^ completed.hashCode ^ noteId.hashCode;
  }

  TodoEntity copyWith({
    String? title,
    bool? completed,
    String? noteId,
  }) {
    return TodoEntity._(
      id: id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
      noteId: noteId ?? this.noteId,
    );
  }
}

extension TodoEntityX on TodoEntity {
  Todo toProto() {
    return Todo()
      ..id = id
      ..title = title
      ..completed = completed
      ..noteId = noteId;
  }
}
