import 'package:data/src/di/locator.dart';

export 'src/common/constants.dart';
export 'src/datasource/local/db/app_shared_objects.dart';

class Data {
  static void init() {
    setupLocator();
  }
}
