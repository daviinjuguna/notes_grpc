import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class UpdateTodoUseCase extends UnitUseCase<TodoEntity> {
  final NotesRepo _repo;

  UpdateTodoUseCase(this._repo);

  @override
  Future<Either<String, Unit>> call(TodoEntity params) =>
      _repo.updateTodo(params);
}
