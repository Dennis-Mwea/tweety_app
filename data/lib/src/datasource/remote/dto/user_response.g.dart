// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) {
  return UserResponse(
    json['id'] as int?,
    json['email'] as String,
    json['username'] as String,
    json['token'] as String?,
    json['name'] as String,
    json['avatar'] as String,
    json['banner'] as String,
    json['description'] as String?,
  );
}

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'description': instance.description,
      'email': instance.email,
      'token': instance.token,
    };
