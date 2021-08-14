// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:domain/domain.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../datasource/local/dao/tweet_dao.dart' as _i8;
import '../datasource/local/dao/user_dao.dart' as _i9;
import '../datasource/remote/service/authentication_service.dart' as _i5;
import '../datasource/remote/service/tweet_service.dart' as _i7;
import '../repository/authentication_repository.dart' as _i4;
import '../repository/tweet_repository.dart'
    as _i6; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthenticationRepository>(
      () => _i4.AuthenticationRepositoryImpl(get<_i5.AuthenticationService>()));
  gh.factory<_i3.TweetRepository>(() => _i6.TweetRepositoryImpl(
      get<_i7.TweetService>(), get<_i8.TweetDao>(), get<_i9.UserDao>()));
  return get;
}
