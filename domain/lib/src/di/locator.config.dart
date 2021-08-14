// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../domain.dart' as _i5;
import '../repository/authentication_repository.dart' as _i8;
import '../usecase/authentication/authentication_use_case.dart' as _i6;
import '../usecase/authentication/authentication_use_case_impl.dart' as _i7;
import '../usecase/tweet/tweet_use_case.dart' as _i3;
import '../usecase/tweet/tweet_use_case_impl.dart'
    as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.GetAllTweetsUseCase>(
      () => _i4.GetAllTweetsUseCaseImpl(get<_i5.TweetRepository>()));
  gh.factory<_i3.GetTweetByIdUseCase>(
      () => _i4.GetTweetByIdUseCaseImpl(get<_i5.TweetRepository>()));
  gh.factory<_i6.LoginUseCase>(
      () => _i7.LoginUseCaseImpl(get<_i8.AuthenticationRepository>()));
  return get;
}
