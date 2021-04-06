import 'package:equatable/equatable.dart';
import 'package:fimber/fimber.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:tweety_app/blocs/auth/AuthBloc.dart';
import 'package:tweety_app/blocs/theme/Bloc.dart';
import 'package:tweety_app/config/AppTheme.dart';
import 'package:tweety_app/network/NetworkClient.dart';
import 'package:tweety_app/pages/login/LoginPage.dart';
import 'package:tweety_app/repositories/AuthenticationRepository.dart';
import 'package:tweety_app/utils/SharedObjects.dart';
import 'package:tweety_app/utils/SimpleBlocObserver.dart';

GetIt locator = GetIt.instance;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SharedObjects.prefs = await CachedSharedPreferences.getInstance();
  EquatableConfig.stringify = kDebugMode;
  Bloc.observer = SimpleBlocObserver();
  Fimber.plantTree(DebugTree.elapsed());
  locator.registerLazySingleton(() => NetworkClient('http://192.168.100.32:8000/'));
  // Prefs.themeIndexPref = Prefs.prefs.getInt('theme') ?? 0;

  runApp(MultiRepositoryProvider(providers: [
    RepositoryProvider(create: (_) => AuthenticationRepository()),
  ], child: Tweety()));
}

class Tweety extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => ThemeBloc()),
        BlocProvider(create: (_) => AuthBloc()),
      ],
      child: AppView(),
    );
  }
}

class AppView extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();
  NavigatorState? get _navigator => _navigatorKey.currentState;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeBloc, ThemeData>(
      buildWhen: (previous, current) => previous != current,
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Tweety',
          theme: AppTheme.appTheme[state],
          onGenerateRoute: (_) => LoginPage.route(),
          navigatorKey: _navigatorKey,
        );
      },
    );
  }
}
