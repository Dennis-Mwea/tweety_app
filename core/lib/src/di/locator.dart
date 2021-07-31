import 'package:core/src/di/locator.config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

final locator = GetIt.instance..allowReassignment = true;

@injectableInit
void setupLocator() {
  _init(locator);

  $initGetIt(locator);
}

void _init(GetIt locator) {}
