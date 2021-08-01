import 'dart:convert';

import 'package:core/core/core_view_model.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/routes/router.dart';

@Injectable()
class SplashScreenViewModel extends CoreViewModel {
  final LoginUseCase _loginUseCase;

  SplashScreenViewModel(this._loginUseCase) {
    _getUser();
  }

  void _getUser() async {
    final results = await _loginUseCase.getUser();
    results.when(success: (data) async {
      await SharedObjects.prefs.setString(Constants.user, json.encode(data.toJson()));

      navigationService.popAndPush(ArticleListScreenRoute());
    }, error: (NetworkExceptions errorType, message) {
      navigationService.pushAndRemoveUntil(LoginScreenRoute());
    });
  }
}
