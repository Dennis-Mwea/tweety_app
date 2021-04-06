// ignore: import_of_legacy_library_into_null_safe
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tweety_app/utils/NetworkExceptions.dart';

part 'ApiResult.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult<T> {
  const factory ApiResult.success({T? data}) = Success<T>;

  const factory ApiResult.failure({NetworkExceptions? error}) = Failure<T>;
}
