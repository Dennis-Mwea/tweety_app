import 'package:data/src/datasource/remote/dto/base/pagination_response.dart';
import 'package:data/src/datasource/remote/dto/tweet_response.dart';
import 'package:data/src/datasource/remote/dto/user_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'base_response.g.dart';

@JsonSerializable()
class BaseResponse<T> {
  @JsonKey(name: 'data')
  @_Converter()
  final T data;
  final bool success;
  final String? message;

  BaseResponse(this.data, this.message, this.success);

  factory BaseResponse.fromJson(Map<String, dynamic> json) => _$BaseResponseFromJson<T>(json);

  Map<String, dynamic> toJson() => _$BaseResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic>) {
      if (json.containsKey('username') && json.containsKey('email')) {
        return UserResponse.fromJson(json) as T;
      }

      if (json.containsKey('current_page') && json.containsKey('first_page_url')) {
        print(PaginationResponse<TweetResponse>.fromJson(json));
        return PaginationResponse<TweetResponse>.fromJson(json) as T;
      }
    }

    throw UnimplementedError('This class is not mapped to any converter.');
  }

  @override
  Object? toJson(T object) {
    if (T is UserResponse) {
      return (T as UserResponse).toJson();
    }

    throw UnimplementedError('No suitable json converter was found for this instance.');
  }
}
