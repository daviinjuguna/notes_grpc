part of 'note_form_cubit.dart';

@immutable
class NoteFormState {
  final NotesInput note;
  final TodoListInput todoList;
  final ColorInput color;
  final FormzSubmissionStatus status;
  final NoteEntity? existing;
  final bool isValid;

  const NoteFormState({
    this.note = const NotesInput.pure(),
    this.todoList = const TodoListInput.pure(),
    this.color = const ColorInput.pure(),
    this.status = FormzSubmissionStatus.initial,
    this.existing,
    this.isValid = false,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NoteFormState &&
        other.note == note &&
        other.todoList == todoList &&
        other.color == color &&
        other.status == status &&
        other.existing == existing &&
        other.isValid == isValid;
  }

  @override
  int get hashCode {
    return note.hashCode ^
        todoList.hashCode ^
        color.hashCode ^
        status.hashCode ^
        existing.hashCode ^
        isValid.hashCode;
  }

  NoteFormState copyWith({
    NotesInput? note,
    TodoListInput? todoList,
    ColorInput? color,
    FormzSubmissionStatus? status,
    NoteEntity? existing,
    bool? isValid,
  }) {
    return NoteFormState(
      note: note ?? this.note,
      todoList: todoList ?? this.todoList,
      color: color ?? this.color,
      status: status ?? this.status,
      existing: existing ?? this.existing,
      isValid: isValid ?? this.isValid,
    );
  }
}
