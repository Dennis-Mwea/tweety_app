import 'package:equatable/equatable.dart';

class User extends Equatable {
  /// {@macro user}
  const User({required this.email, this.name});

  /// The current user's email address.
  final String email;

  /// The current user's name (display name).
  final String? name;

  /// Empty user which represents an unauthenticated user.
  static const empty = User(email: '', name: null);

  @override
  List<Object> get props => [email, name!];
}
