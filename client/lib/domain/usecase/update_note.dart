import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class UpdateNoteUseCase extends UnitUseCase<NoteEntity> {
  final NotesRepo _notesRepo;

  UpdateNoteUseCase(this._notesRepo);

  @override
  Future<Either<String, Unit>> call(NoteEntity params) {
    return _notesRepo.updateNote(params);
  }
}
