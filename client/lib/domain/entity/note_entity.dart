import 'dart:ui';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/foundation.dart';
import 'package:protos/protos.dart';
import 'package:uuid/uuid.dart';

import 'package:notes_gprc/domain/entity/todo_entity.dart';

//class NoteEntity
class NoteEntity {
  /// Unique identifier for the note
  final String id;

  /// Content of the note
  final String content;

  /// Color of the note
  final Color color;

  /// Time when the note was created
  final DateTime time;

  final List<TodoEntity> _todos;

  List<TodoEntity> get todos =>
      _todos.map((e) => e.copyWith(noteId: id)).toList();

  ///private constructor
  NoteEntity._({
    required this.id,
    required this.content,
    required this.color,
    required this.time,
    required List<TodoEntity> todos,
  }) : _todos = todos
            .map((e) => e.copyWith(
                  noteId: id,
                ))
            .toList();

  /// create constructor, it creates a new note with a unique id
  factory NoteEntity.create({
    required String content,
    required Color color,
    List<TodoEntity> todos = const [],
  }) {
    final id = const Uuid().v4();
    return NoteEntity._(
      id: id,
      content: content,
      color: color,
      time: DateTime.now(),
      todos: todos.map((e) => e.copyWith(noteId: id)).toList(),
    );
  }

  /// fromProto method, it converts a proto note to a note
  /// static method, it can be called without an instance of the class
  static NoteEntity fromProto(NoteWithTodos nwt) {
    return NoteEntity._(
      id: nwt.note.id,
      content: nwt.note.content,
      color: Color(nwt.note.color.toInt()),
      time: DateTime.fromMillisecondsSinceEpoch(nwt.note.timeInEpoch.toInt()),
      todos: nwt.todos.map((e) => TodoEntity.fromProto(e)).toList(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteEntity &&
        other.id == id &&
        other.content == content &&
        other.color == color &&
        other.time == time &&
        listEquals(other._todos, _todos);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        content.hashCode ^
        color.hashCode ^
        time.hashCode ^
        _todos.hashCode;
  }

  @override
  String toString() {
    return ' NoteEntity(id: $id)';
  }

  /// copyWith method, it creates a copy of the note with the new values, not id and time of the note
  NoteEntity copyWith({
    String? content,
    Color? color,
    List<TodoEntity>? todos,
  }) {
    return NoteEntity._(
      id: id,
      content: content ?? this.content,
      color: color ?? this.color,
      time: time,
      todos: todos ?? _todos,
    );
  }
}

extension NoteEntityX on NoteEntity {
  /// toProto method, it converts the note to a proto note
  Note toProto() {
    return Note()
      ..id = id
      ..content = content
      ..color = Int64(color.value)
      ..timeInEpoch = Int64(time.millisecondsSinceEpoch);
  }
}
