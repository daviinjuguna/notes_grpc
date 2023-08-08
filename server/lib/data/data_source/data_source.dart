import 'package:protos/protos.dart';
import 'package:server/data/db/data.dart';

class NoteDataSource {
  void addNote(Note note) => notes.add(note);
  void updateNote(Note note) {
    final index = notes.indexWhere((element) => element.id == note.id);
    if (index != -1) notes[index] = note;
  }

  void deleteNote(Note note) =>
      notes.removeWhere((element) => element.id == note.id);

  List<Note> get allNotes => notes;

  //paginatedNotes
  List<Note> getPaginatedNotes(int limit, int offset) =>
      notes.skip(offset).take(limit).toList();

  //get todos by note id
  List<Todo> getTodos(Note note) =>
      todos.where((element) => element.noteId == note.id).toList();

  //all todos
  List<Todo> get allTodos => todos;

  //task items
  void addTodo(Todo todo) => todos.add(todo);

  void addTodos(List<Todo> todosAdd) => todos.addAll(todosAdd);

  //update todo by todo
  void updateTodo(Todo todo) {
    final index = todos.indexWhere((element) => element.id == todo.id);
    if (index != -1) todos[index] = todo;
  }

  //update todo by noteId
  void updateTodos(List<Todo> todos) => todos.forEach(updateTodo);

  void deleteTodoById(Todo todo) =>
      todos.removeWhere((element) => element.id == todo.id);

  void deleteTodosByNoteId(Note note) =>
      todos.removeWhere((element) => element.noteId == note.id);
  void deleteTodos(List<Todo> todos) =>
      todos.removeWhere((element) => todos.contains(element));
}
