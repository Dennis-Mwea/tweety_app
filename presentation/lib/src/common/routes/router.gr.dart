// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../../features/login/login_screen.dart' as _i4;
import '../../features/profile/view/profile_view_scree.dart' as _i7;
import '../../features/splash/splash_screen.dart' as _i3;
import '../../features/tweets/details/tweet_details_screen.dart' as _i6;
import '../../features/tweets/list/article_list_screen.dart' as _i5;

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
          return const _i5.ArticleListScreen();
        }),
    TweetDetailsScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<TweetDetailsScreenRouteArgs>();
          return _i6.TweetDetailsScreen(id: args.id);
        }),
    ProfileViewScreenRoute.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return _i7.ProfileViewScreen();
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i1.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i1.RouteConfig(ArticleListScreenRoute.name,
            path: '/article-list-screen'),
        _i1.RouteConfig(TweetDetailsScreenRoute.name,
            path: '/tweet-details-screen'),
        _i1.RouteConfig(ProfileViewScreenRoute.name,
            path: '/profile-view-screen')
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

class TweetDetailsScreenRoute
    extends _i1.PageRouteInfo<TweetDetailsScreenRouteArgs> {
  TweetDetailsScreenRoute({required int id})
      : super(name,
            path: '/tweet-details-screen',
            args: TweetDetailsScreenRouteArgs(id: id));

  static const String name = 'TweetDetailsScreenRoute';
}

class TweetDetailsScreenRouteArgs {
  const TweetDetailsScreenRouteArgs({required this.id});

  final int id;
}

class ProfileViewScreenRoute extends _i1.PageRouteInfo {
  const ProfileViewScreenRoute() : super(name, path: '/profile-view-screen');

  static const String name = 'ProfileViewScreenRoute';
}
