import 'package:formz/formz.dart';

enum PasswordValidationInvalid { invalid }

class Password extends FormzInput<String, PasswordValidationInvalid?> {
  const Password.dirty(String value) : super.dirty(value);
  const Password.pure() : super.pure('');

  @override
  validator(String? value) => value == null || value.isEmpty ? PasswordValidationInvalid.invalid : null;
}
