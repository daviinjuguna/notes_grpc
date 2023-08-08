import 'package:dartz/dartz.dart';

export 'create_note.dart';
export 'create_todo.dart';
export 'delete_note.dart';
export 'delete_todo.dart';
export 'update_note.dart';
export 'update_todo.dart';
export 'update_todos.dart';
export 'watch_notes.dart';

abstract class UseCase<T, P> {
  Future<Either<String, T>> call(P params);
}

abstract class StreamUseCase<T, P> {
  Stream<Either<String, T>> call(P params);
}

abstract class UnitUseCase<P> extends UseCase<Unit, P> {}
