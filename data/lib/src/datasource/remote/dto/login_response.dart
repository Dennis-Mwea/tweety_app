import 'package:json_annotation/json_annotation.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'data')
  final UserResponse user;
  final bool success;
  final String? message;

  LoginResponse(this.user, this.success, {this.message});

  factory LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class UserResponse {
  final int? id;
  final String name;
  final String username;
  final String avatar;
  final String banner;
  final String? description;
  final String email;
  final String? token;

  UserResponse(this.id, this.email, this.username, this.token, this.name, this.avatar, this.banner, this.description);

  factory UserResponse.fromJson(Map<String, dynamic> json) => _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
