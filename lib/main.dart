import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:presentation/presentation.dart';
import 'package:tweety_app/config/AppTheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// since main module is dependent on Core module and Feature module
  /// we need to init these dependent modules here
  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  Core.init();
  Presentation.init();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _coreRouter = Core.routBuilder(Presentation.getFeatureRouter());

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _coreRouter.defaultRouteParser(),
      routerDelegate: _coreRouter.delegate(),
      title: 'Flutter Clean Architecture Sample',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.appTheme[Themes.Dark],
    );
  }
}
