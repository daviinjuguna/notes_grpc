part of 'notes_bloc.dart';

@immutable
abstract class NotesEvent {}

class NotesEventStarted extends NotesEvent {}

class _ReceivedNotes extends NotesEvent {
  final Either<String, List<NoteEntity>> notes;
  _ReceivedNotes(this.notes);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is _ReceivedNotes && other.notes == notes;
  }

  @override
  int get hashCode => notes.hashCode;
}
