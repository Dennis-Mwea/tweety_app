class Validators {
  static String? passwordValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Password is invalid.';
    }

    return null;
  }

  static String? emailValidator(String? value) {
    if (value == null || value.isEmpty || !value.contains('@')) {
      return 'Email is invalid.';
    }

    return null;
  }
}
