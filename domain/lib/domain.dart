library domain;

import 'package:domain/src/di/locator.dart';

export 'src/common/error_type.dart';
export 'src/common/result.dart';
export 'src/model/tweet_model.dart';
export 'src/model/user_model.dart';
export 'src/repository/authentication_repository.dart';
export 'src/repository/tweet_repository.dart';
export 'src/usecase/authentication/authentication_use_case.dart';
export 'src/usecase/tweet/tweet_use_case.dart';
export 'src/utils/network_exceptions.dart';

class Domain {
  static void init() {
    setupLocator();
  }
}
