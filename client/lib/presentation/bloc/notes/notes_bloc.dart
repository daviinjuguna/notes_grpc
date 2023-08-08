import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';
import 'package:collection/collection.dart';

import 'package:notes_gprc/domain/domain.dart';

part 'notes_event.dart';
part 'notes_state.dart';

class NotesBloc extends Bloc<NotesEvent, NotesState> {
  NotesBloc(this._useCase) : super(const NotesState()) {
    on<NotesEventStarted>((event, emit) {
      _subscription?.cancel();
      emit(state.copyWith(status: NotesStatus.loading));
      _subscription = _useCase
          .call(WatchNotesParams())
          .listen((notes) => add(_ReceivedNotes(notes)));
    });
    on<_ReceivedNotes>((event, emit) {
      final failureOrNotes = event.notes;
      emit(failureOrNotes.fold(
        (error) => state.copyWith(
          status: NotesStatus.failure,
          error: error,
        ),
        (notes) => state.copyWith(
          status: NotesStatus.success,
          notes: notes,
        ),
      ));
    });
  }

  final WatchNotesUseCase _useCase;
  StreamSubscription<Either<String, List<NoteEntity>>>? _subscription;

  @override
  Future<void> close() {
    _subscription?.cancel();
    return super.close();
  }
}
