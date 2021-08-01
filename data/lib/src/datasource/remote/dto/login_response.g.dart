// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return LoginResponse(
    User.fromJson(json['data'] as Map<String, dynamic>),
    json['success'] as bool,
    message: json['message'] as String?,
  );
}

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'data': instance.user,
      'success': instance.success,
      'message': instance.message,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
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

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'username': instance.username,
      'avatar': instance.avatar,
      'banner': instance.banner,
      'description': instance.description,
      'email': instance.email,
      'token': instance.token,
    };
