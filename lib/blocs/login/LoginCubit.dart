import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:tweety_app/blocs/login/Cubit.dart';
import 'package:tweety_app/inputs/Email.dart';
import 'package:tweety_app/inputs/Password.dart';
import 'package:tweety_app/models/Auth.dart';
import 'package:tweety_app/network/ApiResult.dart';
import 'package:tweety_app/repositories/AuthenticationRepository.dart';
import 'package:tweety_app/utils/NetworkExceptions.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit({required AuthenticationRepository repository})
      : _authRepository = repository,
        super(const LoginState());

  final AuthenticationRepository _authRepository;

  void emailChanged(String value) {
    final email = Email.dirty(value);

    emit(state.copyWith(email: email, status: Formz.validate([email, state.password])));
  }

  void passwordChanged(String value) {
    final password = Password.dirty(value);

    emit(state.copyWith(password: password, status: Formz.validate([password, state.email])));
  }

  void login() async {
    if (!state.status.isValidated) return;

    emit(state.copyWith(status: FormzStatus.submissionInProgress));

    ApiResult<Auth> result = await _authRepository.login(state.email.value, state.password.value);

    result.when(success: (Auth? auth) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    }, failure: (NetworkExceptions? error) {
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
    });
  }
}
