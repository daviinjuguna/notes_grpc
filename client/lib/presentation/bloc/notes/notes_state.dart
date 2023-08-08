part of 'notes_bloc.dart';

@immutable
class NotesState {
  final NotesStatus status;
  final List<NoteEntity> notes;
  final String error;

  const NotesState({
    this.status = NotesStatus.initial,
    this.notes = const [],
    this.error = '',
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is NotesState &&
        other.status == status &&
        listEquals(other.notes, notes) &&
        other.error == error;
  }

  @override
  int get hashCode => status.hashCode ^ notes.hashCode ^ error.hashCode;

  NotesState copyWith({
    NotesStatus? status,
    List<NoteEntity>? notes,
    String? error,
  }) {
    return NotesState(
      status: status ?? this.status,
      notes: notes ?? this.notes,
      error: error ?? this.error,
    );
  }

  @override
  String toString() =>
      'NotesState(status: $status, notes: $notes, error: $error)';
}

enum NotesStatus { initial, loading, success, failure }
