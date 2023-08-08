import 'package:dartz/dartz.dart';
import 'package:notes_gprc/domain/domain.dart';

class CreateTodoUseCase extends UnitUseCase<List<TodoEntity>> {
  final NotesRepo _repo;

  CreateTodoUseCase(this._repo);

  @override
  Future<Either<String, Unit>> call(List<TodoEntity> params) =>
      _repo.createTodo(params);
}
