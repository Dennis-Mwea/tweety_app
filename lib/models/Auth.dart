import 'package:json_annotation/json_annotation.dart';

part 'Auth.g.dart';

@JsonSerializable()
class Auth {
  final String token;
  final int userID;
  final String username;

  const Auth({required this.userID, required this.username, required this.token});

  @override
  List<Object> get props => [token, userID, username];

  static Auth fromJson(dynamic json) => _$AuthFromJson(json);
}
