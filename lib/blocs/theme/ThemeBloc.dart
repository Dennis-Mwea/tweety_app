import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweety_app/blocs/theme/Bloc.dart';
import 'package:tweety_app/config/AppTheme.dart';
import 'package:tweety_app/utils/SharedObjects.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeData> {
  ThemeBloc() : super(AppTheme.appTheme.values.toList()[SharedObjects.prefs.getInt('theme') ?? 0]);

  @override
  Stream<ThemeData> mapEventToState(ThemeEvent event) async* {
    if (event is ThemeChanged) {
      // yield event.theme;
      // SharedObjects.prefs.setInt('theme', event.theme.index);
    }
  }
}
