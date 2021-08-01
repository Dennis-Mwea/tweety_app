import 'package:core/core/core_screen.dart';
import 'package:flutter/material.dart';
import 'package:presentation/src/common/constants/decorations.dart';
import 'package:presentation/src/common/constants/strings.dart';
import 'package:presentation/src/di/locator.dart';
import 'package:presentation/src/features/login/login_view_model.dart';
import 'package:presentation/src/utils/validators.dart';
import 'package:presentation/src/widgets/Wave.dart';

class LoginScreen extends CoreScreen<LoginViewModel> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget builder(BuildContext context, LoginViewModel viewModel, Widget? child) {
    final size = MediaQuery.of(context).size;
    final bool keyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Container(height: size.height - 350, color: Color(0xff4A64FE)),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 500),
                      curve: Curves.easeOutQuad,
                      top: keyboardOpen ? -size.height / 3.7 : 0,
                      child: Wave(size: size, yOffset: size.height / 3.0, color: Theme.of(context).scaffoldBackgroundColor),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 100),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                Strings.appName,
                                style:
                                    TextStyle(color: Theme.of(context).scaffoldBackgroundColor, fontWeight: FontWeight.w900, fontSize: 40),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Column(
                              children: [
                                TextFormField(
                                  style: TextStyle(color: Theme.of(context).textSelectionTheme.cursorColor, fontWeight: FontWeight.w500),
                                  decoration: Decorations.emailInputDecoration(context, error: viewModel.emailError),
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  autocorrect: false,
                                  keyboardType: TextInputType.emailAddress,
                                  onChanged: (value) => viewModel.email = value,
                                  validator: (value) => Validators.emailValidator(value),
                                ),
                                SizedBox(height: 30.0),
                                TextFormField(
                                  style: TextStyle(color: Theme.of(context).textSelectionTheme.cursorColor, fontWeight: FontWeight.w500),
                                  decoration: Decorations.passwordInputDecoration(
                                    context,
                                    viewModel.showPassword,
                                    viewModel.togglePassword,
                                    error: viewModel.passwordError,
                                  ),
                                  obscureText: viewModel.showPassword,
                                  autovalidateMode: AutovalidateMode.onUserInteraction,
                                  autocorrect: false,
                                  onChanged: (value) => viewModel.password = value,
                                  validator: (value) => Validators.passwordValidator(value),
                                ),
                                SizedBox(height: 50.0),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20.0),
                                  child: Material(
                                    color: Theme.of(context).primaryColor,
                                    child: InkWell(
                                      onTap: () => viewModel.onLoginButtonPressed(_formKey),
                                      child: SizedBox(
                                        height: 50.0,
                                        width: size.width,
                                        child: Center(
                                          child: Text(
                                            Strings.login,
                                            style: TextStyle(color: Colors.white, fontSize: 18.0, letterSpacing: 1.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 50.0),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Text(Strings.notRegistered, style: TextStyle(color: Theme.of(context).hintColor, fontSize: 16.0)),
                                    SizedBox(width: 10.0),
                                    InkWell(
                                      onTap: () => viewModel.onRegisterButtonPressed(),
                                      child: Text(
                                        Strings.register,
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          letterSpacing: 1.0,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(height: 30.0),
                                Align(
                                  alignment: FractionalOffset.bottomCenter,
                                  child: InkWell(
                                    onTap: () => viewModel.onForgotPasswordButtonPressed(),
                                    child: Text(
                                      Strings.forgotPassword,
                                      style: TextStyle(
                                        color: Theme.of(context).primaryColor,
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1.0,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => locator<LoginViewModel>();
}
