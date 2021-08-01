import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:presentation/src/common/constants/strings.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/splash/splash_screen_view_model.dart';

class SplashScreen extends CoreScreen<SplashScreenViewModel> {
  @override
  Widget builder(BuildContext context, SplashScreenViewModel viewModel, Widget? child) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: Center(
          child: Text(Strings.appName, style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w900, fontSize: 40)),
        ),
      ),
    );
  }

  @override
  SplashScreenViewModel viewModelBuilder(BuildContext context) => locator<SplashScreenViewModel>();
}
