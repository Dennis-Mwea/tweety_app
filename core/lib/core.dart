import 'package:auto_route/auto_route.dart';
import 'package:core/src/di/locator.dart';

/// A Calculator.
class Core {
  static void init() {
    // setup required locators for core module
    setupLocator();
  }

  static RootStackRouter routBuilder(RootStackRouter router) {
    locator.registerLazySingleton<StackRouter>(() => router);

    return router;
  }
}
