import 'package:formz/formz.dart';

enum EmailValidationInvalid { invalid }

class Email extends FormzInput<String, EmailValidationInvalid?> {
  const Email.dirty(String value) : super.dirty(value);
  const Email.pure() : super.pure('');

  @override
  validator(String? value) => value == null || value.isEmpty ? EmailValidationInvalid.invalid : null;
}
