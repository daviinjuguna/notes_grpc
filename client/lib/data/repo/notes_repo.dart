import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';
import 'package:protos/protos.dart';
import 'package:rxdart/rxdart.dart';

class NotesRepoImp implements NotesRepo {
  final NoteServiceClient _client;

  NotesRepoImp(this._client);

  @override
  Stream<Either<String, List<NoteEntity>>> watchNotes() async* {
    final request = Empty();

    yield* _client.all(request).map((response) {
      final notes = response.notes;
      final entity = notes.map((note) {
        return NoteEntity.fromProto(note);
      }).toList();
      return right<String, List<NoteEntity>>(entity);
    }).onErrorReturnWith((error, stackTrace) {
      log("watchNotes", error: error, stackTrace: stackTrace);
      return left<String, List<NoteEntity>>('error');
    });
  }

  @override
  Future<Either<String, Unit>> createNote(NoteEntity note) async {
    try {
      final stream = _generateFromNote(note);
      await _client.create(stream);
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("createNote", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> updateNote(NoteEntity note) async {
    try {
      final stream = _generateFromNote(note);
      await _client.update(stream);
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("updateNote", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> deleteNote(NoteEntity note) async {
    try {
      await _client.delete(note.toProto());
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("deleteNote", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> createTodo(
    List<TodoEntity> todos,
  ) async {
    try {
      final todoList = _generateFromTodo(todos);
      await _client.createTodo(todoList);
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("createTodo", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> updateTodo(TodoEntity todo) async {
    try {
      await _client.updateSingleTodo(todo.toProto());
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("updateTodo", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> updateTodos(List<TodoEntity> todos) async {
    try {
      final todoList = _generateFromTodo(todos);
      await _client.updateTodo(todoList);
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("updateTodos", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }

  @override
  Future<Either<String, Unit>> deleteTodo(TodoEntity todo) async {
    try {
      await _client.deleteTodo(todo.toProto());
      return right<String, Unit>(unit);
    } catch (e, s) {
      log("updateTodo", error: e, stackTrace: s);
      return left<String, Unit>('error');
    }
  }
}

Stream<NoteWithTodos> _generateFromNote(NoteEntity note) async* {
  // yield TodoList()..todos.addAll(note.todos.map((e) => e.toProto()));
  yield NoteWithTodos()
    ..note = note.toProto()
    ..todos.addAll(note.todos.map((e) => e.toProto()));
}

Stream<TodoList> _generateFromTodo(List<TodoEntity> todos) async* {
  yield TodoList()..todos.addAll(todos.map((e) => e.toProto()));
}
