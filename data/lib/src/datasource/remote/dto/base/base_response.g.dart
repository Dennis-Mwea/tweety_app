// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse<T> _$BaseResponseFromJson<T>(Map<String, dynamic> json) {
  return BaseResponse<T>(
    _Converter<T>().fromJson(json['data']),
    json['message'] as String?,
    json['success'] as bool,
  );
}

Map<String, dynamic> _$BaseResponseToJson<T>(BaseResponse<T> instance) =>
    <String, dynamic>{
      'data': _Converter<T>().toJson(instance.data),
      'success': instance.success,
      'message': instance.message,
    };
