library domain;

import 'package:domain/src/di/locator.dart';

export 'src/common/error_type.dart';
export 'src/common/result.dart';
export 'src/model/article_model.dart';
export 'src/repository/article_repository.dart';
export 'src/usecase/article_use_case.dart';

class Domain {
  static void init() {
    setupLocator();
  }
}
