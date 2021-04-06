import 'package:equatable/equatable.dart';
import 'package:tweety_app/models/User.dart';

enum AuthStatus { unknown, unauthenticated, authenticated }

class AuthState extends Equatable {
  const AuthState._({this.status = AuthStatus.unknown, this.user = User.empty});

  final AuthStatus status;
  final User user;

  @override
  List<Object?> get props => [user, status];

  const AuthState.unknown() : this._();

  const AuthState.authenticated(User user) : this._(status: AuthStatus.authenticated, user: user);

  const AuthState.unauthenticated() : this._(status: AuthStatus.unauthenticated);
}
