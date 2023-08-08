import 'dart:async';

import 'package:protos/protos.dart';
import 'package:rxdart/rxdart.dart';
import 'package:server/data/data_source/data_source.dart';
import 'package:server/data/db/data.dart';

class NoteService extends NoteServiceBase {
  final NoteDataSource _source = NoteDataSource();
  final BehaviorSubject<List<Note>> _controller = BehaviorSubject.seeded(notes);
  final BehaviorSubject<List<Todo>> _todoController =
      BehaviorSubject.seeded(todos);

  @override
  Stream<NoteAllResponse> all(ServiceCall call, Empty request) async* {
    //listen to additianal stream changes
    //use rxdart to combine streams
    final stream = Rx.combineLatest2(_controller.stream, _todoController.stream,
        (notes, todos) {
      return notes.map((note) => NoteWithTodos()
        ..note = note
        ..todos.addAll(todos.where((todo) => todo.noteId == note.id)));
    });
    yield* stream.map((e) => NoteAllResponse()..notes.addAll(e));
  }

  //create notes with todos
  @override
  Future<Empty> create(ServiceCall call, Stream<NoteWithTodos> request) async {
    final currentTodo = todos;
    final currentNotes = notes;
    await for (final NoteWithTodos noteWithTodos in request) {
      currentNotes.add(noteWithTodos.note);
      currentTodo.addAll(noteWithTodos.todos);
    }
    _controller.add(currentNotes);
    _todoController.add(currentTodo);
    return Empty();
  }
  // @override
  // Future<Empty> create(ServiceCall call, Stream<NoteWithTodos> request) async {
  //   await for (final noteWithTodos in request) {
  //     final note = noteWithTodos.note;
  //     _source.addNote(note);
  //     _controller.add(_source.allNotes);
  //     _source.addTodos(noteWithTodos.todos);
  //     _todoController.add(_source.allTodos);
  //   }

  //   return Empty();
  // }

  //update notes with also update todos
  @override
  Future<Empty> update(ServiceCall call, Stream<NoteWithTodos> request) async {
    final currentTodo = todos;
    final currentNotes = notes;
    await for (final NoteWithTodos noteWithTodos in request) {
      //update note
      final index = currentNotes
          .indexWhere((element) => element.id == noteWithTodos.note.id);
      if (index != -1) currentNotes[index] = noteWithTodos.note;
      //update todo
      final noteId = noteWithTodos.note.id;
      currentTodo
        ..removeWhere((e) => e.noteId == noteId)
        ..addAll(noteWithTodos.todos);
    }
    _controller.add(currentNotes);
    _todoController.add(currentTodo);
    return Empty();
  }

  //delete notes, also delete todos
  @override
  Future<Empty> delete(ServiceCall call, Note request) async {
    final currentTodo = todos;
    final currentNotes = notes;
    final note = request;

    //delete note
    currentNotes.removeWhere((element) => element.id == note.id);
    currentTodo.removeWhere((element) => element.noteId == note.id);

    //update streams
    _controller.add(currentNotes);
    _todoController.add(currentTodo);
    return Empty();
  }

  @override
  Stream<TodoList> allTodos(ServiceCall call, TodoAllRequest request) async* {
    final note = request.note;

    //listen to additianal stream changes
    yield* _todoController.stream.map((todos) => TodoList()
      ..todos.addAll(todos.where((todo) => todo.noteId == note.id)));
  }

  @override
  Future<Empty> createTodo(ServiceCall call, Stream<TodoList> request) async {
    //currenr list
    final currentList = todos;
    await for (final todoList in request) {
      currentList.addAll(todoList.todos);
      if (todoList.todos.isEmpty) {
        break;
      }
    }
    _todoController.add(currentList);
    return Empty();
  }

  @override
  Future<Empty> updateTodo(ServiceCall call, Stream<TodoList> request) async {
    //currenr list
    final currentList = todos;
    await for (final todoList in request) {
      //update todo
      todoList.todos.forEach((todo) {
        final index =
            currentList.indexWhere((element) => element.id == todo.id);
        if (index != -1) currentList[index] = todo;
      });
      if (todoList.todos.isEmpty) {
        break;
      }
    }
    _todoController.add(currentList);
    return Empty();
  }

  @override
  Future<Empty> updateSingleTodo(ServiceCall call, Todo request) async {
    final todo = request;
    _source.updateTodo(todo);
    _todoController.add(_source.allTodos);
    return Empty();
  }

  @override
  Future<Empty> deleteAllTodos(
    ServiceCall call,
    Stream<TodoList> request,
  ) async {
    //currenr list
    final currentList = todos;
    await for (final todoList in request) {
      //delete todo
      currentList.removeWhere((element) => todoList.todos.contains(element));
      if (todoList.todos.isEmpty) {
        break;
      }
    }
    _todoController.add(currentList);
    return Empty();
  }

  @override
  Future<Empty> deleteTodo(ServiceCall call, Todo request) async {
    final todo = request;
    _source.deleteTodoById(todo);
    _todoController.add(_source.allTodos);
    return Empty();
  }
}
