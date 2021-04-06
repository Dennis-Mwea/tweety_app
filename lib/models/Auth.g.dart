// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Auth.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auth _$AuthFromJson(Map<String, dynamic> json) {
  return Auth(
    userID: json['userID'] as int,
    username: json['username'] as String,
    token: json['token'] as String,
  );
}

Map<String, dynamic> _$AuthToJson(Auth instance) => <String, dynamic>{
      'token': instance.token,
      'userID': instance.userID,
      'username': instance.username,
    };
