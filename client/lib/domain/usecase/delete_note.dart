import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class DeleteNoteUseCase extends UnitUseCase<NoteEntity> {
  final NotesRepo _notesRepo;

  DeleteNoteUseCase(this._notesRepo);

  @override
  Future<Either<String, Unit>> call(NoteEntity params) {
    return _notesRepo.deleteNote(params);
  }
}
