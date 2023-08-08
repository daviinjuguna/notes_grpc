import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class CreateNoteUseCase extends UnitUseCase<NoteEntity> {
  final NotesRepo _notesRepo;

  CreateNoteUseCase(this._notesRepo);

  @override
  Future<Either<String, Unit>> call(NoteEntity params) {
    return _notesRepo.createNote(params);
  }
}
