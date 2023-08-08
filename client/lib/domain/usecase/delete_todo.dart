import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class DeleteTodoUseCase extends UnitUseCase<TodoEntity> {
  final NotesRepo _repo;

  DeleteTodoUseCase(this._repo);

  @override
  Future<Either<String, Unit>> call(TodoEntity params) =>
      _repo.deleteTodo(params);
}
