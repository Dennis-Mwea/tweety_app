import 'package:data/src/datasource/remote/dto/tweet_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'pagination_response.g.dart';

@JsonSerializable()
class PaginationResponse<T> {
  @JsonKey(name: 'current_page')
  final int currentPage;
  @JsonKey(name: 'data')
  @_Converter()
  final List<T> data;

  PaginationResponse(this.currentPage, this.data);

  factory PaginationResponse.fromJson(Map<String, dynamic> json) => _$PaginationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaginationResponseToJson(this);
}

class _Converter<T> implements JsonConverter<T, Object?> {
  const _Converter();

  @override
  T fromJson(Object? json) {
    if (json is Map<String, dynamic> && json.containsKey('user_id') && json.containsKey('image')) {
      return TweetResponse.fromJson(json) as T;
    }

    throw UnimplementedError('This class is not mapped to any converter.');
  }

  @override
  Object? toJson(T object) {
    if (T is TweetResponse) {
      return (T as TweetResponse).toJson();
    }

    throw UnimplementedError('No suitable json converter was found for this instance.');
  }
}
