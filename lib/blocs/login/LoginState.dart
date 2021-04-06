import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:tweety_app/inputs/Email.dart';
import 'package:tweety_app/inputs/Password.dart';

class LoginState extends Equatable {
  final Email email;
  final Password password;
  final FormzStatus status;

  const LoginState({this.email = const Email.pure(), this.status = FormzStatus.pure, this.password = const Password.pure()});

  @override
  List<Object?> get props => [email, status, password];

  LoginState copyWith({Email? email, FormzStatus? status, Password? password}) =>
      LoginState(email: email ?? this.email, status: status ?? this.status, password: password ?? this.password);
}
