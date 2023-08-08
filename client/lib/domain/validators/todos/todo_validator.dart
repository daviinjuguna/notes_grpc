import 'package:formz/formz.dart';
import 'package:notes_gprc/domain/domain.dart';

// Define input validation errors
enum TodoListValidationError { max, emptyTitle }

// Extend FormzInput and provide the input type and error type.
class TodoListInput
    extends FormzInput<List<TodoEntity>, TodoListValidationError> {
  // Call super.pure to represent an unmodified form input.
  const TodoListInput.pure() : super.pure(const []);

  // Call super.dirty to represent a modified form input.
  const TodoListInput.dirty({List<TodoEntity> value = const []})
      : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  TodoListValidationError? validator(List<TodoEntity> value) {
    //check max
    if (value.length > 5) {
      return TodoListValidationError.max;
    }
    //check empty title
    if (value.any((element) => element.title.isEmpty)) {
      return TodoListValidationError.emptyTitle;
    }
    return null;
  }
}
