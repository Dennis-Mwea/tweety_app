import 'package:data/data.dart';
import 'package:data/src/common/constants.dart';
import 'package:data/src/datasource/local/dao/article_dao.dart';
import 'package:data/src/datasource/local/db/app_database.dart';
import 'package:data/src/datasource/remote/service/article_service.dart';
import 'package:data/src/datasource/remote/service/authentication_service.dart';
import 'package:data/src/di/locator.config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final locator = GetIt.instance..allowReassignment = true;

@injectableInit
void setupLocator() {
  _init(locator);

  $initGetIt(locator);
}

void _init(GetIt locator) async {
  _registerNetworkModules(locator);
  _registerServices(locator);
  _registerDatabase(locator);
}

void _registerNetworkModules(GetIt locator) {
  final _dio = Dio();
  _dio.interceptors.add(PrettyDioLogger(
      requestHeader: true, requestBody: true, responseBody: true, responseHeader: false, error: true, compact: true, maxWidth: 90));
  _dio.options.headers
      .addAll({'Accept': 'application/json', 'Authorization': 'Bearer ${SharedObjects.prefs.getString(Constants.accessToken)}'});
  locator.registerSingleton<Dio>(_dio);
}

void _registerServices(GetIt locator) {
  locator.registerLazySingleton<ArticleService>(() => ArticleService(locator<Dio>(), baseUrl: Constants.BASE_URL));
  locator.registerLazySingleton<AuthenticationService>(() => AuthenticationService(locator<Dio>(), baseUrl: Constants.BASE_URL));
}

void _registerDatabase(GetIt locator) async {
  final database = await $FloorAppDatabase.databaseBuilder('article_database.db').build();

  locator.registerLazySingleton<AppDatabase>(() => database);
  locator.registerLazySingleton<ArticleDao>(() => locator.get<AppDatabase>().articleDao);
}
