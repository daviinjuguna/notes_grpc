import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:formz/formz.dart';
import 'package:meta/meta.dart';
import 'package:notes_gprc/domain/domain.dart';

part 'note_form_state.dart';

class NoteFormCubit extends Cubit<NoteFormState> {
  NoteFormCubit(this._repo) : super(const NoteFormState());
  final NotesRepo _repo;

  //check on existing note, this is when editing the note
  void initialize(NoteEntity? note) {
    if (note != null) {
      emit(state.copyWith(
        note: NotesInput.dirty(value: note.content),
        todoList: TodoListInput.dirty(value: note.todos),
        color: ColorInput.dirty(value: note.color),
        existing: note,
      ));
    }
  }

  //update the note
  void noteChanged(String value) {
    final note = NotesInput.dirty(value: value);
    emit(state.copyWith(
      note: note,
      isValid: Formz.validate([note, state.todoList, state.color]),
    ));
  }

  //update the todo list
  void todoListChanged(List<TodoEntity> value) {
    final todoList = TodoListInput.dirty(value: value);
    emit(state.copyWith(
      todoList: todoList,
      isValid: Formz.validate([state.note, todoList, state.color]),
    ));
  }

  //update todo title
  void todoTitleChanged(String value, int index) {
    final todoList = state.todoList.value;
    final todoItem = todoList[index].copyWith(title: value);
    final newList = todoList
        .asMap()
        .map((key, value) {
          if (key == index) {
            return MapEntry(key, todoItem);
          } else {
            return MapEntry(key, value);
          }
        })
        .values
        .toList();

    final todoListInput = TodoListInput.dirty(value: newList);
    emit(state.copyWith(
      todoList: todoListInput,
      isValid: Formz.validate([state.note, todoListInput, state.color]),
    ));
  }

  //complete todo title
  void todoCompleteChanged(bool value, int index) {
    final todoList = state.todoList.value;
    final todoItem = todoList[index].copyWith(completed: value);
    final newList = todoList
        .asMap()
        .map((key, value) {
          if (key == index) {
            return MapEntry(key, todoItem);
          } else {
            return MapEntry(key, value);
          }
        })
        .values
        .toList();

    final todoListInput = TodoListInput.dirty(value: newList);
    emit(state.copyWith(
      todoList: todoListInput,
      isValid: Formz.validate([state.note, todoListInput, state.color]),
    ));
  }

  //on todo reorder
  void todoReorder(int oldIndex, int newIndex) {
    //control when moving item to last index
    if (oldIndex < newIndex) {
      newIndex -= 1;
    }
    final todoList = state.todoList.value;
    final todoItem = todoList[oldIndex];
    final newList = todoList.where((e) => e.id != todoItem.id).toList()
      ..insert(newIndex, todoItem);

    final todoListInput = TodoListInput.dirty(value: newList);
    emit(state.copyWith(
      todoList: todoListInput,
      isValid: Formz.validate([state.note, todoListInput, state.color]),
    ));
  }

  //delete todo item
  void todoDelete(int index) {
    final todoList = state.todoList.value;
    final newList = todoList.where((e) => e.id != todoList[index].id).toList();
    final todoListInput = TodoListInput.dirty(value: newList);
    emit(state.copyWith(
      todoList: todoListInput,
      isValid: Formz.validate([state.note, todoListInput, state.color]),
    ));
  }

  //update the color
  void colorChanged(Color value) {
    final color = ColorInput.dirty(value: value);
    emit(state.copyWith(
      color: color,
      isValid: Formz.validate([state.note, state.todoList, color]),
    ));
  }

  //submit the note
  Future<void> submit() async {
    if (!state.isValid) return;
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final Either<String, Unit> res;
    if (state.existing != null) {
      res = await _repo.updateNote(
        state.existing!.copyWith(
          content: state.note.value,
          todos: state.todoList.value,
          color: state.color.value,
        ),
      );
    } else {
      res = await _repo.createNote(
        NoteEntity.create(
          content: state.note.value,
          todos: state.todoList.value,
          color: state.color.value,
        ),
      );
    }
    emit(res.fold(
      (l) => state.copyWith(
        status: FormzSubmissionStatus.failure,
      ),
      (r) => state.copyWith(
        status: FormzSubmissionStatus.success,
      ),
    ));
  }
}
