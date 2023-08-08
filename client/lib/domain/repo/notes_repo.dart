import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

abstract class NotesRepo {
  Stream<Either<String, List<NoteEntity>>> watchNotes();

  Future<Either<String, Unit>> createNote(NoteEntity note);

  Future<Either<String, Unit>> updateNote(NoteEntity note);

  Future<Either<String, Unit>> deleteNote(NoteEntity note);

  Future<Either<String, Unit>> createTodo(List<TodoEntity> todos);

  Future<Either<String, Unit>> updateTodos(List<TodoEntity> todos);

  Future<Either<String, Unit>> updateTodo(TodoEntity todo);

  Future<Either<String, Unit>> deleteTodo(TodoEntity todo);
}
