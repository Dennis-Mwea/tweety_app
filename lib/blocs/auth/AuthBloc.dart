import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tweety_app/blocs/auth/Bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState.unknown()) {
    add(FetchUser());
  }

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {}
}
