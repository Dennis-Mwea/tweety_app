import 'package:fimber/fimber.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    Fimber.d('$event');
    super.onEvent(bloc, event);
  }

  @override
  void onError(BlocBase cubit, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(cubit, error, stackTrace);
  }

  @override
  void onChange(BlocBase cubit, Change change) {
    Fimber.d('$change');
    super.onChange(cubit, change);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    Fimber.d('$transition');
    super.onTransition(bloc, transition);
  }
}
