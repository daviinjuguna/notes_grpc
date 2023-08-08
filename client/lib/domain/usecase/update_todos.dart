import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class UpdateTodosUseCase extends UnitUseCase<List<TodoEntity>> {
  final NotesRepo _repo;

  UpdateTodosUseCase(this._repo);

  @override
  Future<Either<String, Unit>> call(List<TodoEntity> params) =>
      _repo.updateTodos(params);
}
