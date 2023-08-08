import 'package:flutter/material.dart';
import 'package:formz/formz.dart';

enum ColorValidationError { empty }

class ColorInput extends FormzInput<Color, ColorValidationError> {
  const ColorInput.pure() : super.pure(Colors.white);
  const ColorInput.dirty({Color value = Colors.white}) : super.dirty(value);

  @override
  ColorValidationError? validator(Color? value) {
    return value == null ? ColorValidationError.empty : null;
  }
}
