import 'package:formz/formz.dart';

enum PseudoValidationError { empty, invalid }

class Pseudo extends FormzInput<String, PseudoValidationError> {
  const Pseudo.pure() : super.pure('');
  const Pseudo.dirty([super.value = '']) : super.dirty();

  @override
  PseudoValidationError? validator(String value) {
    if (value.isEmpty) return PseudoValidationError.empty;
    return null;
  }
}
