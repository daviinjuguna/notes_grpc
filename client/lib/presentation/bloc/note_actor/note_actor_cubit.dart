import 'package:bloc/bloc.dart';
import 'package:notes_gprc/domain/domain.dart';

part 'note_actor_state.dart';

class NoteActorCubit extends Cubit<NoteActorState> {
  NoteActorCubit(this._repo) : super(NoteActorState.initial);
  final NotesRepo _repo;

  //delete the note
  void delete(NoteEntity note) async {
    emit(NoteActorState.loading);
    final failureOrSuccess = await _repo.deleteNote(note);
    emit(
      failureOrSuccess.fold(
        (f) => NoteActorState.failure,
        (_) => NoteActorState.success,
      ),
    );
  }
}
