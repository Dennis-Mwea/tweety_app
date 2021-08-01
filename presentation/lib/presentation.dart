library feature;

import 'package:auto_route/auto_route.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:presentation/src/common/routes/router.dart';
import 'package:presentation/src/di/locator.dart';

class Presentation {
  static void init() {
    /// Feature module is dependent on Domain and Data modules,
    /// we need to init these two modules here
    Data.init();
    Domain.init();

    /// setup required locators for feature module
    setupLocator();
  }

  static RootStackRouter getFeatureRouter() => FeatureRouter();
}
