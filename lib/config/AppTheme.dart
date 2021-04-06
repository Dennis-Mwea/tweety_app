import 'package:flutter/material.dart';

enum Themes { Light }

class AppTheme {
  static final appTheme = {
    Themes.Light: ThemeData(
      brightness: Brightness.light,
      primaryColor: Color(0xFF4299E1),
    ),
  };
}
