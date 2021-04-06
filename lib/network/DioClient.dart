import 'dart:io';

// ignore: import_of_legacy_library_into_null_safe
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class DioClient {
  final String baseUrl;
  final List<Interceptor>? interceptors;
  Dio? _dio;

  DioClient(this.baseUrl, Dio dio, {this.interceptors}) {
    _dio = dio;
    _dio!
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers.addAll({'Accept': 'application/json'});
    if (interceptors?.isNotEmpty ?? false) {
      _dio!.interceptors.addAll(interceptors);
    }
    if (kDebugMode) {
      _dio!.interceptors.add(PrettyDioLogger(
          requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
    }
  }

  Future<dynamic> get(String uri,
      {Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onReceiveProgress,
      bool refresh = false,
      Duration? duration}) async {
    try {
      if (options != null)
        options.headers.addAll({
          'content-type': 'application/json; charset=UTF-8',
          'Content-Type': 'application/json; charset=UTF-8',
        });

      var response = await _dio!
          .get(uri, queryParameters: queryParameters, options: options, cancelToken: cancelToken, onReceiveProgress: onReceiveProgress);

      return response.data;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw FormatException('Unable to process data.');
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> post(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      ProgressCallback? onReceiveProgress,
      bool hasFile = false}) async {
    try {
      if (!hasFile && options != null) {
        options.headers.addAll({
          'content-type': 'application/json; charset=UTF-8',
          'Content-Type': 'application/json; charset=UTF-8',
        });
      }
      var response = await _dio!.post(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);
      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data.");
    } catch (e) {
      throw e;
    }
  }

  Future<dynamic> request(String uri,
      {data,
      Map<String, dynamic>? queryParameters,
      Options? options,
      CancelToken? cancelToken,
      ProgressCallback? onSendProgress,
      bool hasFile = false,
      ProgressCallback? onReceiveProgress}) async {
    try {
      if (!hasFile && options != null) {
        options.headers.addAll({
          'content-type': 'application/json; charset=UTF-8',
          'Content-Type': 'application/json; charset=UTF-8',
        });
      }

      var response = await _dio!.request(uri,
          data: data,
          queryParameters: queryParameters,
          options: options,
          cancelToken: cancelToken,
          onSendProgress: onSendProgress,
          onReceiveProgress: onReceiveProgress);

      return response.data;
    } on FormatException catch (_) {
      throw FormatException("Unable to process the data.");
    } catch (e) {
      throw e;
    }
  }
}
