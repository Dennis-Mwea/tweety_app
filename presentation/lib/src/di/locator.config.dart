// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:core/service/toast_service.dart' as _i6;
import 'package:domain/domain.dart' as _i4;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/articles/details/article_details_view_model.dart' as _i3;
import '../features/articles/list/article_list_view_model.dart' as _i5;
import '../features/explore/explore_view_model.dart' as _i7;
import '../features/login/login_view_model.dart' as _i8;
import '../features/messages/messages_view_model.dart' as _i9;
import '../features/notifications/notifications_view_model.dart' as _i10;
import '../features/splash/splash_screen_view_model.dart'
    as _i11; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.ArticleDetailsViewModel>(
      () => _i3.ArticleDetailsViewModel(get<_i4.GetTweetByIdUseCase>()));
  gh.factory<_i5.ArticleListViewModel>(() => _i5.ArticleListViewModel(
      get<_i4.GetAllTweetsUseCase>(), get<_i6.ToastService>()));
  gh.factory<_i7.ExploreViewModel>(() => _i7.ExploreViewModel());
  gh.factory<_i8.LoginViewModel>(() =>
      _i8.LoginViewModel(get<_i4.LoginUseCase>(), get<_i6.ToastService>()));
  gh.factory<_i9.MessagesViewModel>(() => _i9.MessagesViewModel());
  gh.factory<_i10.NotificationsViewModel>(() => _i10.NotificationsViewModel());
  gh.factory<_i11.SplashScreenViewModel>(
      () => _i11.SplashScreenViewModel(get<_i4.LoginUseCase>()));
  return get;
}
