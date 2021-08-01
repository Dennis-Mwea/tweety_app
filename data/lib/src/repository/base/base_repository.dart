import 'package:dio/dio.dart';
import 'package:domain/domain.dart';
import 'package:logger/logger.dart';

typedef ResponseToModelMapper<Response, Model> = Model Function(Response response);
typedef EntityToModelMapper<Entity, Model> = Model Function(Entity? entity);
typedef SaveResult<Response> = Future Function(Response response);

abstract class BaseResponse {
  final _logger = Logger();

  Future<Result<Model>> safeDbCall<Entity, Model>(Future<Entity?> call, {required EntityToModelMapper<Entity, Model> mapper}) async {
    try {
      final response = await call;

      if (response != null) {
        _logger.d('DB success message -> $response');

        return Success(mapper.call(response)!);
      } else {
        _logger.d('DB response is null');

        return Error(NetworkExceptions.unableToProcess(), 'DB response is null');
      }
    } catch (exception) {
      _logger.d("DB failure message -> $exception");

      return Error(NetworkExceptions.unableToProcess(), "Unknown DB error");
    }
  }

  Future<Result<Model>> safeApiCall<Response, Model>(Future<Response> call,
      {required ResponseToModelMapper<Response, Model> mapper, SaveResult<Response>? saveResult}) async {
    try {
      var response = await call;

      await saveResult?.call(response);

      return Success(mapper.call(response));
    } catch (exception) {
      if (exception is DioError) {
        return Error(NetworkExceptions.getDioException(exception)!, exception.message);
      }

      return Error(NetworkExceptions.unexpectedError(), "Unknown API error");
    }
  }
}
