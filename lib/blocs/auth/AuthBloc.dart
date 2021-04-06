import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweety_app/blocs/auth/Bloc.dart';
import 'package:tweety_app/repositories/AuthenticationRepository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required AuthenticationRepository repository})
      : _authRepository = repository,
        super(const AuthState.unknown());

  final AuthenticationRepository _authRepository;

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    print('Called');
    if (event is AuthStarted) {
      yield* _mapAuthenticationStartedToState();
    } else if (event is AuthUserChanged) {
      // yield* _mapAuthenticationLoggedInToState();
    } else if (event is AuthLogoutRequested) {
      // yield* _mapAuthenticationLoggedOutToState();
    }
  }

  Stream<AuthState> _mapAuthenticationStartedToState() async* {
    final isSignedIn = await _authRepository.isSignedIn;

    if (isSignedIn) {
    } else {
      yield const AuthState.unauthenticated();
    }
  }
}
