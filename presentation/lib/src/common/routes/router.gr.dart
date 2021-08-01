// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../features/articles/details/article_details_screen.dart' as _i6;
import '../../features/articles/list/article_list_screen.dart' as _i5;
import '../../features/login/login_screen.dart' as _i4;
import '../../features/splash/splash_screen.dart' as _i3;

class FeatureRouter extends _i1.RootStackRouter {
  FeatureRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i3.SplashScreen();
        }),
    LoginScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i4.LoginScreen();
        }),
    ArticleListScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i5.ArticleListScreen();
        }),
    ArticleDetailsScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<ArticleDetailsScreenRouteArgs>();
          return _i6.ArticleDetailsScreen(id: args.id);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i1.RouteConfig(ArticleListScreenRoute.name,
            path: '/article-list-screen'),
        _i1.RouteConfig(ArticleDetailsScreenRoute.name,
            path: '/article-details-screen')
      ];
}

class SplashScreenRoute extends _i1.PageRouteInfo {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

class LoginScreenRoute extends _i1.PageRouteInfo {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

class ArticleListScreenRoute extends _i1.PageRouteInfo {
  const ArticleListScreenRoute() : super(name, path: '/article-list-screen');

  static const String name = 'ArticleListScreenRoute';
}

class ArticleDetailsScreenRoute
    extends _i1.PageRouteInfo<ArticleDetailsScreenRouteArgs> {
  ArticleDetailsScreenRoute({required int id})
      : super(name,
            path: '/article-details-screen',
            args: ArticleDetailsScreenRouteArgs(id: id));

  static const String name = 'ArticleDetailsScreenRoute';
}

class ArticleDetailsScreenRouteArgs {
  const ArticleDetailsScreenRouteArgs({required this.id});

  final int id;
}
