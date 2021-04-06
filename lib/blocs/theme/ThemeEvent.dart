import 'package:equatable/equatable.dart';
import 'package:tweety_app/config/AppTheme.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ThemeChanged extends ThemeEvent {
  final AppTheme theme;

  const ThemeChanged(this.theme);

  @override
  List<Object?> get props => [theme];
}
