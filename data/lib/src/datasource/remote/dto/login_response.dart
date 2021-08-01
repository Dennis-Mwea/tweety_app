import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'data')
  final User user;
  final bool success;
  final String? message;

  LoginResponse(this.user, this.success, {this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class User {
  final int? id;
  final String name;
  final String username;
  final String avatar;
  final String banner;
  final String? description;
  final String email;
  final String? token;

  User(this.id, this.email, this.username, this.token, this.name, this.avatar, this.banner, this.description);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
