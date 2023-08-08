import 'package:formz/formz.dart';

// Define input validation errors

enum NotesEmptyValidationError { empty }

class NotesInput extends FormzInput<String, NotesEmptyValidationError> {
  // Call super.pure to represent an unmodified form input.
  const NotesInput.pure() : super.pure('');

  // Call super.dirty to represent a modified form input.
  const NotesInput.dirty({String value = ''}) : super.dirty(value);

  // Override validator to handle validating a given input value.
  @override
  NotesEmptyValidationError? validator(String value) {
    return value.isEmpty ? NotesEmptyValidationError.empty : null;
  }
}
