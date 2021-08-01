import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/strings.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/login/login_view_model.dart';

class LoginScreen extends CoreScreen<LoginViewModel> {
  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: Text(Strings.login)),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: Strings.username)),
            SizedBox(height: 20),
            TextField(decoration: InputDecoration(border: OutlineInputBorder(), labelText: Strings.password), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(child: Text(Strings.login), onPressed: () => viewModel.onLoginButtonPressed())
          ],
        ),
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => locator<LoginViewModel>();
}
