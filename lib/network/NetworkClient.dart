import 'package:dio/dio.dart';
import 'package:tweety_app/config/Constants.dart';
import 'package:tweety_app/network/DioClient.dart';
import 'package:tweety_app/utils/SharedObjects.dart';

class NetworkClient {
  NetworkClient(this.appUrl);

  final String appUrl;

  static String baseUrl(NetworkClient networkClient) => networkClient.appUrl;
  final _dio = Dio();
  final _authenticatedDio = Dio();

  DioClient get client => DioClient(appUrl, _dio);
  DioClient get authClient {
    _authenticatedDio..options.headers.addAll({'Authorization': 'Bearer ${SharedObjects.prefs.getString(Constants.accessToken)}'});

    return DioClient(appUrl, _authenticatedDio);
  }
}
