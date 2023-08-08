import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class WatchNotesUseCase
    extends StreamUseCase<List<NoteEntity>, WatchNotesParams> {
  final NotesRepo _notesRepo;

  WatchNotesUseCase(this._notesRepo);

  @override
  Stream<Either<String, List<NoteEntity>>> call(WatchNotesParams params) {
    return _notesRepo.watchNotes();
  }
}

class WatchNotesParams {}
