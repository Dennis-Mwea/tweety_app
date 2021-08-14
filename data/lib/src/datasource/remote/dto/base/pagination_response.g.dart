// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponse<T> _$PaginationResponseFromJson<T>(
    Map<String, dynamic> json) {
  return PaginationResponse<T>(
    json['current_page'] as int,
    (json['data'] as List<dynamic>).map(_Converter<T>().fromJson).toList(),
  );
}

Map<String, dynamic> _$PaginationResponseToJson<T>(
        PaginationResponse<T> instance) =>
    <String, dynamic>{
      'current_page': instance.currentPage,
      'data': instance.data.map(_Converter<T>().toJson).toList(),
    };
