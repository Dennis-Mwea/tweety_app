import 'dart:convert';

import 'package:core/core/core_view_model.dart';
import 'package:core/service/toast_service.dart';
import 'package:data/data.dart';
import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:presentation/src/common/routes/router.dart';

@Injectable()
class LoginViewModel extends CoreViewModel {
  final LoginUseCase _loginUseCase;
  final ToastService _toastService;
  bool _showPassword = true;
  bool get showPassword => _showPassword;
  late String email;
  late String password;
  String? _emailError;
  String? get emailError => _emailError;
  String? _passwordError;
  String? get passwordError => _passwordError;

  LoginViewModel(this._loginUseCase, this._toastService);

  void onLoginButtonPressed(GlobalKey<FormState> key) async {
    if (!key.currentState!.validate()) return;
    loading();

    final results = await _loginUseCase.loginWithEmailAndPassword(email, password);
    results.when(success: (data) async {
      await SharedObjects.prefs.setString(Constants.accessToken, data.token!);
      await SharedObjects.prefs.setString(Constants.user, json.encode(data.toJson()));

      navigationService.push(ArticleListScreenRoute());
    }, error: (errorType, errorMessage) {
      errorType.maybeWhen(
          unProcessableEntity: (Map<String, dynamic> error) {
            final errors = (error['errors'] as Map);
            if (errors.containsKey('email')) _emailError = (errors['email'] as List).first;
            if (errors.containsKey('password')) _passwordError = (errors['password'] as List).first;
            notifyListeners();

            _toastService.show(error['message']);
          },
          orElse: () => _toastService.show(errorMessage));
    });

    loaded(results.isSuccessful);
  }

  void onRegisterButtonPressed() {
    // navigationService.push(ArticleListScreenRoute());
  }

  void onForgotPasswordButtonPressed() {
    // navigationService.push(ArticleListScreenRoute());
  }

  void togglePassword() {
    _showPassword = !_showPassword;
    notifyListeners();
  }
}
