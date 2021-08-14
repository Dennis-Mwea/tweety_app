import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

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
